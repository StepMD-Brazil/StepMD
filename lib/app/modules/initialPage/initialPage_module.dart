import 'package:stepmd/app/modules/initialPage/initialPage_page.dart';
import 'package:stepmd/app/modules/initialPage/initialPage_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialPageModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(InitialPageStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const InitialPagePage());
  }
}
