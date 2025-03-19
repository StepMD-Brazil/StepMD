import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/signin/signin_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/modules/signin/verify_page.dart';

import '../../shared/constants.dart';

class SigninPage extends StatefulWidget {
  final String title;
  const SigninPage({Key? key, this.title = 'SigninPage'}) : super(key: key);
  @override
  SigninPageState createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage> {
  final SigninStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.06,
          child: SvgPicture.asset(
            'assets/svg/logo.svg',
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.2,
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    // height: 500,
                    padding: const EdgeInsets.only(left: 100),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 56,
                          child: const Column(
                            children: [
                              Text(
                                'Bem vindo à StepMD Brazil',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF020E2B),
                                  fontSize: 20,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Faça seu login para continuar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF020E2B),
                                  fontSize: 14,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Color(0xFF041233),
                            fontSize: 14,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              store.email = value;
                              if (value.isEmpty) {
                                store.emailError = 'Por favor, insira um email';
                              } else {
                                final regex = RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
                                if (!regex.hasMatch(value)) {
                                  store.emailError =
                                      'Por favor, insira um email válido';
                                } else {
                                  store.emailError = '';
                                }
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Digite aqui',
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCBD5E1),
                                ),
                              ),
                              errorText: store.emailError != ''
                                  ? store.emailError
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Senha',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF041233),
                            fontSize: 14,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 50,
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (value) {
                              store.password = value;
                              if (value.isEmpty) {
                                store.passwordError =
                                    'Por favor, insira uma senha';
                              } else if (value.length < 6) {
                                store.passwordError =
                                    'A senha deve conter pelo menos 6 caracteres';
                              } else {
                                store.passwordError = '';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Digite aqui',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xFFCBD5E1),
                                ),
                              ),
                              errorText: store.passwordError != ''
                                  ? store.passwordError
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Não tem uma conta? Cadastre-se',
                              style: TextStyle(
                                color: Color(0xFF041233),
                                fontSize: 14,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        InkWell(
                          onTap: () {
                            if (store.email.isNotEmpty &&
                                store.password.isNotEmpty) {
                              if (RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                  .hasMatch(store.email)) {
                                store.signInWithEmail(
                                    store.email, store.password, context);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Email inválido'),
                                      content: Text(
                                          'Por favor, insira um email válido.'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Dados inválidos'),
                                    content: Text(
                                        'Por favor, insira um email e senha válidos.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFF051333),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Enviar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'assets/img/login.JPG',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
