import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'flashcards_store.g.dart';

class FlashcardsStore = _FlashcardsStoreBase with _$FlashcardsStore;

abstract class _FlashcardsStoreBase with Store {
  @observable
  int time = 0;

  @observable
  int seconds = 0;

  @observable
  int minutes = 0;

  @observable
  int hours = 0;

  @observable
  int countAnswereds = 0;

  @observable
  bool timeIsRunning = true;

  @observable
  String categoryId = "";

  @observable
  int cardSelect = 0;

  @observable
  int countStudies = 0;

  @observable
  int uniqueFlashcardsCount = 0;

  @observable
  List<String> disciplineIds = [];

  @observable
  List<dynamic> cards = [];

  @observable
  String timeFormat = "";

  @observable
  ObservableStream<List<Map<dynamic, dynamic>>>? cardsStream;

  Timer? _timer;

  @observable
  ObservableList<Map<dynamic, dynamic>> answers =
      ObservableList<Map<dynamic, dynamic>>();

  @observable
  ObservableList<String> checkedCategories = ObservableList<String>();

  @action
  void fetchcardsByIdsAsStream(List<String> disciplineIds) {
    // Dizendo qual a disciplina estudada
    categoryId = disciplineIds[0];
    print("categoryId estudada: $categoryId");
    try {
      // Transformar a consulta Firestore em um Stream
      final collection = FirebaseFirestore.instance.collection("flashcards");
      final stream = collection
          .where("categoryId", whereIn: disciplineIds)
          .snapshots()
          .map((querySnapshot) =>
              querySnapshot.docs.map((doc) => doc.data()).toList());

      // Atualizar o ObservableStream
      cardsStream = ObservableStream(stream);

      cardsStream?.listen((questions) {
        fillAnswers(questions);
      });
    } catch (e) {
      print("Erro ao criar stream de questões: $e");
      cardsStream = null;
    }
  }

  @action
  void fillAnswers(List<Map<dynamic, dynamic>> flashcards) {
    answers.clear();
    for (final flashcard in flashcards) {
      answers.add({
        "id": flashcard["flashcardId"] ?? "",
        "difficulty": 0,
      });
    }
  }

  @action
  void setAnswer(int index, int difficulty) {
    print(answers.length);
    if (index >= 0 && index < answers.length) {
      answers[index]['difficulty'] = difficulty;
      countAnswereds += 1;
    } else {
      print("Índice inválido para a lista de respostas.");
    }
  }

  @action
  void startCounter() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds++;
      time++;
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
    cardSelect = index;
  }

  @action
  void toggleCategory(String categoryName) {
    if (checkedCategories.contains(categoryName)) {
      checkedCategories.remove(categoryName);
    } else {
      checkedCategories.add(categoryName);
    }
  }

  String formatTime(num seconds) {
    final num hours = seconds ~/ 3600;
    final num minutes = (seconds % 3600) ~/ 60;
    final num secs = seconds % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @action
  getCountStudies() async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      print(userId);

      // Obter todos os documentos de "studyFlashcards" do usuário
      var response = await FirebaseFirestore.instance
          .collection("studyFlashcards")
          .where("userId", isEqualTo: userId)
          .get();
      countStudies = response.docs.length;

      // Calcular o tempo de estudo de hoje
      var now = DateTime.now();
      var startOfDay = DateTime(now.year, now.month, now.day);
      var endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      var time = await FirebaseFirestore.instance
          .collection("studyFlashcards")
          .where("userId", isEqualTo: userId)
          .where("dateCreated", isGreaterThanOrEqualTo: startOfDay)
          .where("dateCreated", isLessThanOrEqualTo: endOfDay)
          .get();

      timeFormat = formatTime(
          time.docs.fold(0, (sum, doc) => sum + doc['timeSpend']));

      // Contar flashcards únicos
      Set<String> uniqueFlashcardIds = {};
      for (var doc in response.docs) {
        var flashcards = doc['flashcards'] as List<dynamic>;
        for (var flashcard in flashcards) {
          uniqueFlashcardIds.add(flashcard['id']);
        }
      }
      uniqueFlashcardsCount = uniqueFlashcardIds.length;
    } catch (e) {
      print("Error adding document: $e");
    }
  }

  bool isChecked(String categoryId) {
    return checkedCategories.contains(categoryId);
  }

  addNote(String type, String typeId, String note) async {
    var newNote = {
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "dateCreated": DateTime.now(),
      "type": type, // question ou flashcard
      "typeId": typeId,
      "note": note
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

  @action
  finishFlashcards() async {
    var newStudy = {
      "categoryId": categoryId,
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "dateCreated": DateTime.now(),
      "flashcards": answers,
      "timeSpend": time
    };

    try {
      var response = await FirebaseFirestore.instance
          .collection("studyFlashcards")
          .add(newStudy);
      var documentId = response.id;
      await response.update({"studyId": documentId});
    } catch (e) {
      print("Error adding document: $e");
    }
  }
}
