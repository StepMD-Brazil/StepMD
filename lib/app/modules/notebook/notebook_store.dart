import 'package:mobx/mobx.dart';

part 'notebook_store.g.dart';

class NotebookStore = _NotebookStoreBase with _$NotebookStore;
abstract class _NotebookStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}