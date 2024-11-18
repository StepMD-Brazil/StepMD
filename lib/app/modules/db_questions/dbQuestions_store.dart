import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'dbQuestions_store.g.dart';

class DbQuestionsStore = _DbQuestionsStoreBase with _$DbQuestionsStore;

abstract class _DbQuestionsStoreBase with Store {
  @observable
  int value = 0;

  @observable
  int questionSelect = 0;

  @observable
  bool questionAnswered = false;

  @observable
  int seconds = 0;

  @observable
  int minutes = 0;

  @observable
  int hours = 0;

  @observable
  bool timeIsRunning = true;

  Timer? _timer;

  @observable
  var answers = [[0, 0], [0, 0], [0, 0]];

  @action
  void setAnswer (index, value, indexAnswer) {
    answers[index][0] = value;
    answers[index][1] = indexAnswer;
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
  void increment() {
    value++;
  }

  @action
  void setSelect(int index) {
    questionSelect = index;
  }

  @action
  void toggleAnswered() {
    questionAnswered = !questionAnswered;
  }

  @action
  setQuestion(String questionId, String testId, int timeSpend) async {
    try {
      var response =
          await FirebaseFirestore.instance.collection("answers").add({
        "questionId": questionId,
        "testId": testId,
        "status": true,
        "timeSpend": timeSpend
      });
    } catch (e) {
      print("Error adding document: $e");
    }
  }
}
