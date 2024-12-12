import 'package:flutter_test/flutter_test.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_store.dart';
 
void main() {
  late DbQuestionsStore store;

  setUpAll(() {
    store = DbQuestionsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}