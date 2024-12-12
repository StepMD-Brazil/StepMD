import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/configuracao/configuracao_store.dart';
 
void main() {
  late ConfiguracaoStore store;

  setUpAll(() {
    store = ConfiguracaoStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}