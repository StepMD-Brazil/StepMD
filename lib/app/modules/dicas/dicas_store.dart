import 'package:mobx/mobx.dart';

part 'dicas_store.g.dart';

class DicasStore = _DicasStoreBase with _$DicasStore;
abstract class _DicasStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}