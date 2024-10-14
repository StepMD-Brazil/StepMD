import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/splash/splash_module.dart';

import 'modules/home/home_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
  }
}
