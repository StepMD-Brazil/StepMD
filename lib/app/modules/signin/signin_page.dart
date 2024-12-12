import 'package:brasil_fields/brasil_fields.dart';
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
          height: MediaQuery.of(context).size.height * 0.05,
          child: SvgPicture.asset(
            'assets/svg/logo.svg',
            color: Color(0xFF020E2B),
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 500,
              child: Column(
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
                    'Telefone',
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
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 38,
                    child: TextFormField(
                      inputFormatters: [
                        // obrigatório
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      onChanged: (value) {
                        store.phone = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Digite aqui',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Color(0xFFCBD5E1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      if (store.phone.length == 15) {
                        String unmaskedPhoneNumber =
                            UtilBrasilFields.removeCaracteres(store.phone);

                        store.verifyPhoneNumber('+55$unmaskedPhoneNumber');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VerifyPage()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Número de telefone inválido'),
                              content: Text(
                                  'Por favor, insira um número de telefone válido.'),
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
                        // Show an error message or handle the invalid phone number case
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
            )
          ],
        );
      }),
    );
  }
}
