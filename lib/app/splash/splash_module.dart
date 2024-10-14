import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/splash/splash_page.dart';
import 'package:stepmd/app/splash/splash_store.dart';

class SplashModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(SplashStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
