import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_store.dart';
import 'package:stepmd/app/modules/home/home_module.dart';
import 'package:stepmd/app/modules/initialPage/initialPage_store.dart';
import 'package:stepmd/app/modules/notebook/notebook_store.dart';
import 'package:stepmd/app/modules/signin/signin_module.dart';
import 'package:stepmd/app/modules/signin/signin_store.dart';
import 'package:stepmd/app/root/root_module.dart';
import 'package:stepmd/app/splash/splash_module.dart';
import 'package:stepmd/app/splash/splash_store.dart';

import 'modules/db_questions/dbQuestions_store.dart';
import 'modules/home/home_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeStore.new);
    i.addSingleton(SplashStore.new);
    i.addSingleton(SigninStore.new);
    i.addSingleton(DbQuestionsStore.new);
    i.addSingleton(InitialPageStore.new);
    i.addSingleton(FlashcardsStore.new);
    i.addSingleton(NotebookStore.new);
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: RootModule());
    r.module('/home', module: HomeModule());
    r.module('/signin', module: SigninModule());
    r.module('/splash', module: SplashModule());
  }
}
