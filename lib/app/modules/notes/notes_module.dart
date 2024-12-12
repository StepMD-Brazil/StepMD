import 'package:stepmd/app/modules/notes/notes_page.dart';
import 'package:stepmd/app/modules/notes/notes_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotesModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(NotesStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const NotesPage());
  }
}
