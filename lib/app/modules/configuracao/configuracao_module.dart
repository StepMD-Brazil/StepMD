import 'package:stepmd/app/modules/configuracao/configuracao_page.dart';
import 'package:stepmd/app/modules/configuracao/configuracao_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfiguracaoModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ConfiguracaoStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ConfiguracaoPage());
  }
}
