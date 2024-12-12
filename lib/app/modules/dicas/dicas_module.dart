import 'package:stepmd/app/modules/dicas/dicas_page.dart';
import 'package:stepmd/app/modules/dicas/dicas_page.dart';
import 'package:stepmd/app/modules/dicas/dicas_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DicasModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(DicasStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const DicasPage());
  }
}