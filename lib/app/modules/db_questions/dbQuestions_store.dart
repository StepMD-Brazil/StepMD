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
    print(questionAnswered);
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
