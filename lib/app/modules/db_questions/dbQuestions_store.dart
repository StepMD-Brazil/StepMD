import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'dbQuestions_store.g.dart';

class DbQuestionsStore = _DbQuestionsStoreBase with _$DbQuestionsStore;

abstract class _DbQuestionsStoreBase with Store {
  User? user;

  @observable
  int questionSelect = 0;

  @observable
  int timeSpend = 0;

  @observable
  int seconds = 0;

  @observable
  int minutes = 0;

  @observable
  int hours = 0;

  @observable
  bool timeIsRunning = true;

  @observable
  int countAnswereds = 0;

  @observable
  String testName = "";

  // Modo de teste: Tutor/ cronometrado
  @observable
  String testMode = "tutor";

  // Modelo de teste: Step Simulado/ NBME/ Personalizado
  @observable
  String testModel = "stepmd";

  // Apenas para modo personalizado
  @observable
  String questionIDs = "";

  @observable
  List<dynamic> questions = [];

  @observable
  ObservableStream<List<Map<dynamic, dynamic>>>? questionsStream;

  Timer? _timer;

  @observable
  ObservableList<Map<dynamic, dynamic>> answers =
      ObservableList<Map<dynamic, dynamic>>();

  @observable
  ObservableList<String> checkedCategories = ObservableList<String>();

  @action
  void setAnswer(int index, int value, int indexOption) {
    if (index >= 0 && index < answers.length) {
      answers[index]['status'] = value;
      answers[index]['indexOption'] = indexOption;
      countAnswereds += 1;
    } else {
      print("Índice inválido para a lista de respostas.");
    }
  }

  @action
  void fetchQuestionsByIds(List<String> questionIds) {
    try {
      // Transformar a consulta Firestore em um Stream
      final collection = FirebaseFirestore.instance.collection("questions");
      final stream = collection
          .where("questionId", whereIn: questionIds)
          .snapshots()
          .map((querySnapshot) =>
              querySnapshot.docs.map((doc) => doc.data()).toList());

      // Atualizar o ObservableStream
      questionsStream = ObservableStream(stream);

      // Vincular a atualização do `answers` ao stream de perguntas
      questionsStream?.listen((questions) {
        fillAnswers(questions);
      });
    } catch (e) {
      print("Erro ao criar stream de questões: $e");
      questionsStream = null;
    }
  }

  @action
  void fetchQuestionsByCategories(List<String> categories) {
    try {
      // Transformar a consulta Firestore em um Stream
      final collection = FirebaseFirestore.instance.collection("questions");
      final stream = collection
          .where("categoryId", whereIn: categories)
          .snapshots()
          .map((querySnapshot) =>
              querySnapshot.docs.map((doc) => doc.data()).toList());

      // Atualizar o ObservableStream
      questionsStream = ObservableStream(stream);

      // Vincular a atualização do `answers` ao stream de perguntas
      questionsStream?.listen((questions) {
        fillAnswers(questions);
      });
    } catch (e) {
      print("Erro ao criar stream de questões: $e");
      questionsStream = null;
    }
  }

  @action
  void splitQuestions(String IDs) {
    final List<String> questionIds = IDs.split("/");
    fetchQuestionsByIds(questionIds);
  }

  @action
  void fillAnswers(List<Map<dynamic, dynamic>> questions) {
    answers.clear();
    for (final question in questions) {
      answers.add({
        "questionId": question["questionId"] ?? "",
        "indexOption": 0,
        "categoryId": question["categoryId"] ?? "",
        "topics": question["topics"] ?? "",
        "status": 0,
      });
    }
  }

  @action
  void startCounter() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      timeSpend++;
      seconds++;
      if (seconds >= 60) {
        seconds = 0;
        minutes++;
      }
      if (minutes >= 60) {
        hours++;
      }
    });
    timeIsRunning = true;
  }

  @action
  void setTestName(String testName) {
    this.testName = testName;
  }

  @action
  void stopCounter() {
    timeIsRunning = false;
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    _timer?.cancel();
  }

  @action
  void setSelect(int index) {
    questionSelect = index;
  }

  @action
  void setTestMode(String mode) {
    testMode = mode;
  }

  @action
  void setTestModel(String model) {
    testModel = model;
  }

  @action
  setQuestionIDs(String IDs) {
    questionIDs = IDs;
  }

  @action
  void toggleCategory(String categoryName) {
    if (checkedCategories.contains(categoryName)) {
      checkedCategories.remove(categoryName);
    } else {
      checkedCategories.add(categoryName);
    }
  }

  bool isChecked(String categoryId) {
    return checkedCategories.contains(categoryId);
  }

  addNote(String questionId, String note) async {
    var newNote = {
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "dateCreated": DateTime.now(),
      "questionId": questionId,
      "text": note,
    };

    try {
      var response =
          await FirebaseFirestore.instance.collection("notes").add(newNote);
      var documentId = response.id;
      await response.update({"noteId": documentId});
    } catch (e) {
      print("Error adding document: $e");
    }
  }

  Future finishTest() async {
    var newTest;
    if (testMode == "cronometrado") {
      newTest = {
        "name": testName,
        "mode": testMode,
        "timeSpend": timeSpend,
        "userId": FirebaseAuth.instance.currentUser!.uid,
        "dateCreated": DateTime.now(),
        "type": testModel,
        "questions": answers
      };
    } else {
      newTest = {
        "name": testName,
        "mode": testMode,
        "userId": FirebaseAuth.instance.currentUser!.uid,
        "dateCreated": DateTime.now(),
        "type": testModel,
        "questions": answers
      };
    }

    try {
      var response =
          await FirebaseFirestore.instance.collection("tests").add(newTest);
      var documentId = response.id;
      await response.update({"testId": documentId});

      return true;
    } catch (e) {
      print("Error adding document: $e");
      return false;
    }
  }

  @action
  Future<dynamic> reset() async {
    stopCounter();
    questionsStream?.close(); // Fecha explicitamente a stream
    questionsStream = null;
    questionSelect = 0;
    timeSpend = 0;
    seconds = 0;
    minutes = 0;
    hours = 0;
    timeIsRunning = false;
    countAnswereds = 0; // Resetando o contador de respostas
    testName = "";
    testMode = "tutor";
    testModel = "stepmd";
    questionIDs = "";
    questions.clear();
    answers.clear();
    checkedCategories.clear();
  }
}
