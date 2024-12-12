import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/artigos/artigos_store.dart';
 
void main() {
  late ArtigosStore store;

  setUpAll(() {
    store = ArtigosStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}