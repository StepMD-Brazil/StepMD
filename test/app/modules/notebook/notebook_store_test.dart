import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/notebook/notebook_store.dart';
 
void main() {
  late NotebookStore store;

  setUpAll(() {
    store = NotebookStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}