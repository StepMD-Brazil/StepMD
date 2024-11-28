import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/suporte/suporte_store.dart';
 
void main() {
  late SuporteStore store;

  setUpAll(() {
    store = SuporteStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}