import 'package:stepmd/app/modules/signin/signin_page.dart';
import 'package:stepmd/app/modules/signin/signin_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SigninModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(SigninStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SigninPage());
  }
}
