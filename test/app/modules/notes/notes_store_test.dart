import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/notes/notes_store.dart';
 
void main() {
  late NotesStore store;

  setUpAll(() {
    store = NotesStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}