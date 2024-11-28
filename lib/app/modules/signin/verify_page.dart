import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stepmd/app/modules/signin/signin_store.dart';
import 'package:stepmd/app/root/root_store.dart';

class VerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SigninStore store = Modular.get();

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
                  PinFieldAutoFill(
                    decoration: UnderlineDecoration(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black),
                      colorBuilder:
                          FixedColorBuilder(Colors.black.withOpacity(0.3)),
                    ),
                    currentCode: store.code,
                    onCodeSubmitted: (code) {
                      store.createUserWithPhone(store.phone, code);
                    },
                    onCodeChanged: (code) {
                      if (code!.length == 6) {
                        code = store.code;

                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      if (store.code.length == 6) {
                        store.createUserWithPhone(store.phone, store.code);
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Código inválido'),
                              content: Text('Por favor, insira um código válido.'),
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
            )
          ],
        );
      }),
    );
  }
}
