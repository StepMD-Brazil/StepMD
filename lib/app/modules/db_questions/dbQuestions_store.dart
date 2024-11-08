import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'dbQuestions_store.g.dart';

class DbQuestionsStore = _DbQuestionsStoreBase with _$DbQuestionsStore;

abstract class _DbQuestionsStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  setQuestion(String questionId, String snapId) async {
    FirebaseFirestore.instance.collection('answers').add({
      "questionId": questionId,
      "status": false,
      "testId": snapId,
      "timeSpend": 0
    });
  }
}
