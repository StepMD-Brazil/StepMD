import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/signin/signin_store.dart';
 
void main() {
  late SigninStore store;

  setUpAll(() {
    store = SigninStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}