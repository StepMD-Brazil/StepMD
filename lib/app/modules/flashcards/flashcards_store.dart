import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'flashcards_store.g.dart';

class FlashcardsStore = _FlashcardsStoreBase with _$FlashcardsStore;

abstract class _FlashcardsStoreBase with Store {
  @observable
  int seconds = 0;

  @observable
  int minutes = 0;

  @observable
  int hours = 0;

  @observable
  bool timeIsRunning = true;

  @observable
  int cardSelect = 0;

  @observable
  List<String> disciplineIds = ["iFhgQRItAJsZ5sjcgnE9"];

  @observable
  List<dynamic> cards = [];

  @observable
  ObservableStream<List<Map<dynamic, dynamic>>>? cardsStream;

  Timer? _timer;

  @observable
  ObservableList<String> checkedCategories = ObservableList<String>();

  @action
  void fetchcardsByIdsAsStream(List<String> disciplineIds) {
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
      print(cardsStream);
    } catch (e) {
      print("Erro ao criar stream de questões: $e");
      cardsStream = null;
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
  finishFlahsCards() async {
    //
    {}

    //   try {
    //     var response =
    //         await FirebaseFirestore.instance.collection("answers").add({
    //       "cardId": cardId,
    //       "testId": testId,
    //       "status": true,
    //       "timeSpend": timeSpend
    //     });
    //   } catch (e) {
    //     print("Error adding document: $e");
    //   }
  }
}
