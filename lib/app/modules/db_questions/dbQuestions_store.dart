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
}