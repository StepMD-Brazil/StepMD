import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/root/root_page.dart';
import 'package:stepmd/app/root/root_store.dart';

import '../splash/splash_page.dart';

class RootModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(RootStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const RootPage(), children: [
      ChildRoute('/splash', child: (context) => const SplashPage()),
    ]);
  }
}
