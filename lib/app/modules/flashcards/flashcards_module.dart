import 'package:stepmd/app/modules/flashcards/flashcards_page.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FlashcardsModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(FlashcardsStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const FlashcardsPage());
  }
}
