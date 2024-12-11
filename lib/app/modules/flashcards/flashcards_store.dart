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
  List<String> disciplineIds = [];

  @observable
  List<dynamic> cards = [];

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
  finishFlashcards() async {
    var newStudy = {
      "categoryId": categoryId,
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "dateCreated": DateTime.now(),
      "flashcards": answers,
      "timeSpend": time
    };

    try {
      var response =
          await FirebaseFirestore.instance.collection("studyFlashcards").add(newStudy);
      var documentId = response.id;
      await response.update({"studyId": documentId});
    } catch (e) {
      print("Error adding document: $e");
    }
  }
}
