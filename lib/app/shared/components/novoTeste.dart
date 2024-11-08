import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/components/test.dart';
import 'package:stepmd/app/shared/constants.dart';

class NovoTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Configure um teste',
            style: TextStyle(
              color: Color(0xFF2E3F69),
              fontSize: 20,
              fontFamily: appFont,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tipo de teste',
                style: TextStyle(
                  color: Color(0xFF2E3F69),
                  fontSize: 20,
                  fontFamily: appFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                padding: const EdgeInsets.all(5),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFDAE9EE)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      child: const Text(
                        'Estudo dirigido',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 14,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      child: const Text(
                        'Simulado da prova ',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 14,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      child: const Text(
                        'NBME',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 14,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: ShapeDecoration(
                        color: Color(0xFF4091C6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                        'Personalizado',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 184,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                      child: Text(
                        'Crie seu próprio teste personalizado utilizando os IDs das questões desejadas',
                        style: TextStyle(
                          color: Color(0xFF51628A),
                          fontSize: 16,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Digite os IDs das questões desejadas',
                            style: TextStyle(
                              color: Color(0xFF51628A),
                              fontSize: 14,
                              fontFamily: appFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 80,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                        color: Color(0xFFCBD5E1),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  child: const Text(
                                    'Ex.: #0001, #0002, #0003 etc...',
                                    style: TextStyle(
                                      color: Color(0xFF858585),
                                      fontSize: 14,
                                      fontFamily: appFont,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Você pode adicionar até 40 IDs separados por virgula',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontFamily: appFont,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFFDAE9EE),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Cancelar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF2E3F69),
                        fontSize: 14,
                        fontFamily: appFont,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Test()),
                      );
                    },
                    child: Container(
                      width: 114,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFF4091C6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                        'Iniciar teste',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
