import 'package:mobx/mobx.dart';
import 'package:stepmd/app/shared/utils/auth_status_enum.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  @observable
  int value = 0;
  @observable
  AuthStatus status = AuthStatus.loading;
  @observable
  int selectedTrunk = 0;
  @action
  setSelectedTrunk(int value) => selectedTrunk = value;
  @action
  void increment() {
    value++;
  }
}
