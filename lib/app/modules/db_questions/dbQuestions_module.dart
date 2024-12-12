import 'package:stepmd/app/modules/db_questions/dbQuestions_page.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DbQuestionsModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(DbQuestionsStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const DbQuestionsPage());
  }
}
