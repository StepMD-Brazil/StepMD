import 'package:mobx/mobx.dart';

part 'initialPage_store.g.dart';

class InitialPageStore = _InitialPageStoreBase with _$InitialPageStore;
abstract class _InitialPageStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}