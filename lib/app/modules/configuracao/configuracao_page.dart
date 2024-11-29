import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/configuracao/configuracao_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/constants.dart';

class ConfiguracaoPage extends StatefulWidget {
  final String title;
  const ConfiguracaoPage({Key? key, this.title = 'ConfiguracaoPage'})
      : super(key: key);
  @override
  ConfiguracaoPageState createState() => ConfiguracaoPageState();
}

class ConfiguracaoPageState extends State<ConfiguracaoPage> {
  final ConfiguracaoStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: Color(0xFF957B0B),
            fontSize: 20,
            fontFamily: appFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.32,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          border: Border(
                            left: BorderSide(color: Color(0xFFDAE9EE)),
                            top: BorderSide(color: Color(0xFFDAE9EE)),
                            right: BorderSide(color: Color(0xFFDAE9EE)),
                            bottom:
                                BorderSide(width: 1, color: Color(0xFFDAE9EE)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(
                                'assets/svg/desktop_windows.svg',
                                color: appColorDeafut,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Configurações do sistema',
                              style: TextStyle(
                                color: Color(0xFF041233),
                                fontSize: 18,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 24,
                                    padding:
                                        const EdgeInsets.only(right: 76.74),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          child: SvgPicture.asset(
                                            'assets/svg/g_translate.svg',
                                            color: appColorDeafut,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Idioma',
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 16,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(right: 19.99),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFFEEEA9),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color(0xFF051333)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    child: Image.asset(
                                                      'assets/img/brazil.png',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    'Português (BRA)',
                                                    style: TextStyle(
                                                      color: Color(0xFF041233),
                                                      fontSize: 14,
                                                      fontFamily: 'Mulish',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color(0xFF858585)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    child: Image.asset(
                                                      'assets/img/eua.png',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    'English (USA)',
                                                    style: TextStyle(
                                                      color: Color(0xFF858585),
                                                      fontSize: 14,
                                                      fontFamily: 'Mulish',
                                                      fontWeight:
                                                          FontWeight.w300,
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
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 24,
                                  padding: const EdgeInsets.only(right: 76.74),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        child: SvgPicture.asset(
                                          'assets/svg/custom_typography.svg',
                                          color: appColorDeafut,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Tamanho da fonte',
                                        style: TextStyle(
                                          color: Color(0xFF858585),
                                          fontSize: 16,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 0),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.only(right: 19.99),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Radio(
                                                value: 1,
                                                groupValue: store.fontSize,
                                                onChanged: (value) {
                                                  setState(() {
                                                    store.fontSize =
                                                        value as int;
                                                  });
                                                },
                                              ),
                                              const Text(
                                                'Pequeno',
                                                style: TextStyle(
                                                  color: Color(0xFF041233),
                                                  fontSize: 14,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Row(
                                            children: [
                                              Radio(
                                                value: 2,
                                                groupValue: store.fontSize,
                                                onChanged: (value) {
                                                  setState(() {
                                                    // store.fontSize = value as int;
                                                  });
                                                },
                                              ),
                                              const Text(
                                                'Médio',
                                                style: TextStyle(
                                                  color: Color(0xFF041233),
                                                  fontSize: 14,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Row(
                                            children: [
                                              Radio(
                                                value: 3,
                                                groupValue: store.fontSize,
                                                onChanged: (value) {
                                                  setState(() {
                                                    // store.fontSize = value as int;
                                                  });
                                                },
                                              ),
                                              const Text(
                                                'Grande',
                                                style: TextStyle(
                                                  color: Color(0xFF041233),
                                                  fontSize: 14,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 80,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 24,
                                    padding:
                                        const EdgeInsets.only(right: 76.74),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          child: SvgPicture.asset(
                                            'assets/svg/contrast.svg',
                                            color: appColorDeafut,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Tema',
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 16,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 0),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(right: 19.99),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFFEEEA9),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color(0xFF051333)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    child: Icon(
                                                      Icons.light_mode,
                                                      color: appColorDeafut,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Claro',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF041233),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Mulish',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color(0xFF858585)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    child: Icon(
                                                      Icons.dark_mode_outlined,
                                                      color: appColorDeafut,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Escuro',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF858585),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Mulish',
                                                            fontWeight:
                                                                FontWeight.w300,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          border: Border(
                            left: BorderSide(color: Color(0xFFDAE9EE)),
                            top: BorderSide(color: Color(0xFFDAE9EE)),
                            right: BorderSide(color: Color(0xFFDAE9EE)),
                            bottom:
                                BorderSide(width: 1, color: Color(0xFFDAE9EE)),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 24,
                                height: 24,
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  color: appColorDeafut,
                                )),
                            const SizedBox(width: 8),
                            Text(
                              'Configurações da conta',
                              style: TextStyle(
                                color: Color(0xFF041233),
                                fontSize: 18,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 212,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 180,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Seu nome completo',
                                                  style: TextStyle(
                                                    color: Color(0xFF041233),
                                                    fontSize: 14,
                                                    fontFamily: 'Mulish',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Container(
                                                  width: double.infinity,
                                                  height: 38,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 38,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 12,
                                                                vertical: 8),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              width: 1,
                                                              strokeAlign:
                                                                  BorderSide
                                                                      .strokeAlignOutside,
                                                              color: Color(
                                                                  0xFFCBD5E1),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'João Oliveira da Silva',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF041233),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Mulish',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Como você prefere ser chamado?',
                                                  style: TextStyle(
                                                    color: Color(0xFF041233),
                                                    fontSize: 14,
                                                    fontFamily: 'Mulish',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Container(
                                                  width: double.infinity,
                                                  height: 36,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 12,
                                                                vertical: 8),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              width: 1,
                                                              strokeAlign:
                                                                  BorderSide
                                                                      .strokeAlignOutside,
                                                              color: Color(
                                                                  0xFFCBD5E1),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'João',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF041233),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Mulish',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Seu e-mail',
                                                  style: TextStyle(
                                                    color: Color(0xFF041233),
                                                    fontSize: 14,
                                                    fontFamily: 'Mulish',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Container(
                                                  width: double.infinity,
                                                  height: 38,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 38,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 12,
                                                                vertical: 8),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              width: 1,
                                                              strokeAlign:
                                                                  BorderSide
                                                                      .strokeAlignOutside,
                                                              color: Color(
                                                                  0xFFCBD5E1),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'joao@email.com.br',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF041233),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Mulish',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Gênero',
                                                  style: TextStyle(
                                                    color: Color(0xFF041233),
                                                    fontSize: 14,
                                                    fontFamily: 'Mulish',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Container(
                                                  width: double.infinity,
                                                  height: 38,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 38,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 12,
                                                                vertical: 8),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              width: 1,
                                                              strokeAlign:
                                                                  BorderSide
                                                                      .strokeAlignOutside,
                                                              color: Color(
                                                                  0xFFCBD5E1),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: SizedBox(
                                                                child: Text(
                                                                  'Masculino',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF041233),
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 24,
                                                              height: 24,
                                                              child: Icon(Icons
                                                                  .arrow_drop_down),
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
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Data de nascimento',
                                                  style: TextStyle(
                                                    color: Color(0xFF041233),
                                                    fontSize: 14,
                                                    fontFamily: 'Mulish',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Container(
                                                  width: double.infinity,
                                                  height: 38,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 38,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 12,
                                                                vertical: 8),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              width: 1,
                                                              strokeAlign:
                                                                  BorderSide
                                                                      .strokeAlignOutside,
                                                              color: Color(
                                                                  0xFFCBD5E1),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '01/01/1999',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF041233),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Mulish',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
