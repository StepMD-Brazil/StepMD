import 'package:mobx/mobx.dart';

part 'artigos_store.g.dart';

class ArtigosStore = _ArtigosStoreBase with _$ArtigosStore;
abstract class _ArtigosStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}