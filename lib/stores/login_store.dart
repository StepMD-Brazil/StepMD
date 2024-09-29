import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage = null;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;


  @action
  Future<bool> login() async {
    isLoading = true;
    errorMessage = null;

    try {
      // Realizar autenticação com Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Login realizado com sucesso!");
      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
      print("Erro ao realizar login: $e");
      return false;
    } finally {
      isLoading = false;
    }
  }


}