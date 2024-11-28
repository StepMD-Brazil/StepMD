import 'package:mobx/mobx.dart';

part 'suporte_store.g.dart';

class SuporteStore = _SuporteStoreBase with _$SuporteStore;
abstract class _SuporteStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}