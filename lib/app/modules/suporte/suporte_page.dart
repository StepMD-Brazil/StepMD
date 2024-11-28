import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/suporte/suporte_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/constants.dart';

class SuportePage extends StatefulWidget {
  final String title;
  const SuportePage({Key? key, this.title = 'SuportePage'}) : super(key: key);
  @override
  SuportePageState createState() => SuportePageState();
}

class SuportePageState extends State<SuportePage> {
  final SuporteStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Suporte',
          style: TextStyle(
            color: Color(0xFF957B0B),
            fontSize: 20,
            fontFamily: appFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Encontrou algo errado? Entre em contato com o Suporte.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF020E2B),
                            fontSize: 20,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Preencha os campos abaixo para enviar seu feedback. Você será respondido por email.',
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
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 62,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Seu nome',
                                style: TextStyle(
                                  color: Color(0xFF041233),
                                  fontSize: 14,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 38,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 38,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Color(0xFFCBD5E1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Digite aqui',
                                            style: TextStyle(
                                              color: Color(0xFF041233),
                                              fontSize: 14,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 62,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tópico',
                                style: TextStyle(
                                  color: Color(0xFF041233),
                                  fontSize: 14,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 38,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 38,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Color(0xFFCBD5E1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Digite aqui',
                                            style: TextStyle(
                                              color: Color(0xFF041233),
                                              fontSize: 14,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sua mensagem',
                                style: TextStyle(
                                  color: Color(0xFF041233),
                                  fontSize: 14,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 116,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: Color(0xFFCBD5E1),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Digite aqui',
                                              style: TextStyle(
                                                color: Color(0xFF041233),
                                                fontSize: 14,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 36,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF051333),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Row(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
