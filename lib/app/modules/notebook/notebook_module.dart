import 'package:stepmd/app/modules/notebook/notebook_page.dart';
import 'package:stepmd/app/modules/notebook/notebook_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotebookModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(NotebookStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const NotebookPage());
  }
}
