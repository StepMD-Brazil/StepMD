import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'dbQuestions_store.g.dart';

class DbQuestionsStore = _DbQuestionsStoreBase with _$DbQuestionsStore;

abstract class _DbQuestionsStoreBase with Store {
  @observable
  int questionSelect = 0;

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

      if (value != 0) {
        countAnswereds += 1;
      }
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
        "discipline": question["categoryId"] ?? "",
        "topics": question["topics"] ?? "",
        "status": 0,
      });
    }
  }

  @action
  void startCounter() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
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
  void stopCounter() {
    timeIsRunning = false;
    _timer?.cancel();
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
  void toggleCategory(String categoryId) {
    if (checkedCategories.contains(categoryId)) {
      checkedCategories.remove(categoryId);
    } else {
      checkedCategories.add(categoryId);
    }
  }

  bool isChecked(String categoryId) {
    return checkedCategories.contains(categoryId);
  }

  @action
  finishTest() async {
    print(answers);
    //
    {}

    //   try {
    //     var response =
    //         await FirebaseFirestore.instance.collection("answers").add({
    //       "questionId": questionId,
    //       "testId": testId,
    //       "status": true,
    //       "timeSpend": timeSpend
    //     });
    //   } catch (e) {
    //     print("Error adding document: $e");
    //   }
  }
}
