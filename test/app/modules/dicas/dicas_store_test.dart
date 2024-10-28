import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/dicas/dicas_store.dart';
 
void main() {
  late DicasStore store;

  setUpAll(() {
    store = DicasStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}