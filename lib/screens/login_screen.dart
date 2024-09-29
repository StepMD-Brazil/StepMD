import 'package:flutter/material.dart';
import 'package:stepmd/stores/login_store.dart';

class LoginScreen extends StatelessWidget {

  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24.0),
          width: 360, // Definindo largura fixa para o layout web
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                onChanged: loginStore.setEmail,
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
                onChanged: loginStore.setPassword,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aqui você pode implementar a lógica de autenticação, como enviar uma requisição HTTP
                  if (loginStore.email.isNotEmpty && loginStore.password.isNotEmpty) {
                    loginStore.login();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Por favor, preencha todos os campos."),
                      ),
                    );
                  }
                },
                child: Text("Entrar"),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Redirecionar para a tela de cadastro
                },
                child: Text("Não tem uma conta? Cadastre-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
