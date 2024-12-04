import 'package:mobx/mobx.dart';

part 'configuracao_store.g.dart';

class ConfiguracaoStore = _ConfiguracaoStoreBase with _$ConfiguracaoStore;

abstract class _ConfiguracaoStoreBase with Store {
  @observable
  int value = 0;
  @observable
  int fontSize = 0;
  @observable
  String name = '';
  @observable
  String birthDate = '';
  @observable
  String email = '';
  @observable
  String nickname = '';
  @observable
  String tema = '';
  void increment() {
    value++;
  }
}
