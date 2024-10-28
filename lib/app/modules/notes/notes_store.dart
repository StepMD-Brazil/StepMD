import 'package:mobx/mobx.dart';

part 'notes_store.g.dart';

class NotesStore = _NotesStoreBase with _$NotesStore;
abstract class _NotesStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}