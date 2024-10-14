import 'package:stepmd/app/modules/home/home_page.dart';
import 'package:stepmd/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
