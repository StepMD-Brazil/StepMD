import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/initialPage/initialPage_store.dart';
 
void main() {
  late InitialPageStore store;

  setUpAll(() {
    store = InitialPageStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}