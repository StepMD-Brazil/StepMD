import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_store.dart';
 
void main() {
  late FlashcardsStore store;

  setUpAll(() {
    store = FlashcardsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}