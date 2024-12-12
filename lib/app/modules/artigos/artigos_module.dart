import 'package:stepmd/app/modules/artigos/artigos_page.dart';
import 'package:stepmd/app/modules/artigos/artigos_page.dart';
import 'package:stepmd/app/modules/artigos/artigos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ArtigosModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ArtigosStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ArtigosPage());
  }
}
