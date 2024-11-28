import 'package:stepmd/app/modules/suporte/suporte_page.dart';
import 'package:stepmd/app/modules/suporte/suporte_page.dart';
import 'package:stepmd/app/modules/suporte/suporte_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SuporteModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(SuporteStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SuportePage(), children: [
      ChildRoute('/splash', child: (context) => const SuportePage()),
    ]);
  }
}
