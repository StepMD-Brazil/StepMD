import 'package:mobx/mobx.dart';

part 'configuracao_store.g.dart';

class ConfiguracaoStore = _ConfiguracaoStoreBase with _$ConfiguracaoStore;
abstract class _ConfiguracaoStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}