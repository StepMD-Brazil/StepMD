import 'package:mobx/mobx.dart';

part 'flashcards_store.g.dart';

class FlashcardsStore = _FlashcardsStoreBase with _$FlashcardsStore;
abstract class _FlashcardsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}