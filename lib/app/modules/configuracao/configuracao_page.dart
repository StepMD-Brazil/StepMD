import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  String language = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        language = value['language'];
        store.fontSize = value['fontSize'];
        store.tema = value['tema'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: appColorPrimary,
            fontSize: 20,
            fontFamily: appFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.32,
                        decoration: const ShapeDecoration(
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
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                border: Border(
                                  left: BorderSide(color: Color(0xFFDAE9EE)),
                                  top: BorderSide(color: Color(0xFFDAE9EE)),
                                  right: BorderSide(color: Color(0xFFDAE9EE)),
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
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
                                  const Text(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              decoration: const ShapeDecoration(
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 24,
                                          padding: const EdgeInsets.only(
                                              right: 76.74),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: SvgPicture.asset(
                                                  'assets/svg/g_translate.svg',
                                                  color: appColorDeafut,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              const Text(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 19.99),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkResponse(
                                                    onTap: () {
                                                      setState(() {
                                                        language = 'pt';
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8,
                                                          vertical: 4),
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: language == 'pt'
                                                            ? const Color(
                                                                0xFFFEEEA9)
                                                            : Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: const BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFF051333)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      9999),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 24,
                                                            height: 24,
                                                            child: Image.asset(
                                                              'assets/img/brazil.png',
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 4),
                                                          const Text(
                                                            'Português (BRA)',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF858585),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Mulish',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        language = 'en';
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8,
                                                          vertical: 4),
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: language == 'en'
                                                            ? Color(0xFFFEEEA9)
                                                            : Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: const BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFF858585)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      9999),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 24,
                                                            height: 24,
                                                            child: Image.asset(
                                                              'assets/img/eua.png',
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 4),
                                                          const Text(
                                                            'English (USA)',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF858585),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                'assets/svg/custom_typography.svg',
                                                color: appColorDeafut,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 19.99),
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
                                                      groupValue:
                                                          store.fontSize,
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
                                                        color:
                                                            Color(0xFF041233),
                                                        fontSize: 14,
                                                        fontFamily: 'Mulish',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 20),
                                                Row(
                                                  children: [
                                                    Radio(
                                                      value: 2,
                                                      groupValue:
                                                          store.fontSize,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          store.fontSize =
                                                              value as int;
                                                        });
                                                      },
                                                    ),
                                                    const Text(
                                                      'Médio',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF041233),
                                                        fontSize: 14,
                                                        fontFamily: 'Mulish',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 20),
                                                Row(
                                                  children: [
                                                    Radio(
                                                      value: 3,
                                                      groupValue:
                                                          store.fontSize,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          store.fontSize =
                                                              value as int;
                                                        });
                                                      },
                                                    ),
                                                    const Text(
                                                      'Grande',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF041233),
                                                        fontSize: 14,
                                                        fontFamily: 'Mulish',
                                                        fontWeight:
                                                            FontWeight.w700,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 24,
                                          padding: const EdgeInsets.only(
                                              right: 76.74),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  store.tema = 'light';
                                                });
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    right: 19.99),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8,
                                                          vertical: 4),
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: store.tema ==
                                                                'light'
                                                            ? Color(0xFFFEEEA9)
                                                            : Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFF858585)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      9999),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 24,
                                                            height: 24,
                                                            child: Icon(
                                                              Icons.light_mode,
                                                              color:
                                                                  appColorDeafut,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 4),
                                                          Container(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Claro',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF858585),
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          store.tema = 'dark';
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8,
                                                                vertical: 4),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: store.tema ==
                                                                  'dark'
                                                              ? Color(
                                                                  0xFFFEEEA9)
                                                              : Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFF858585)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9999),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: 24,
                                                              height: 24,
                                                              child: Icon(
                                                                Icons
                                                                    .dark_mode_outlined,
                                                                color:
                                                                    appColorDeafut,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 4),
                                                            Container(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Escuro',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF858585),
                                                                      fontSize:
                                                                          14,
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
                                                    ),
                                                  ],
                                                ),
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
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
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
                              height: 255,
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
                                    height: 220,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Seu nome completo',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF041233),
                                                          fontSize: 14,
                                                          fontFamily: 'Mulish',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Container(
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
                                                        child: TextFormField(
                                                          initialValue: snapshot
                                                              .data!['name']
                                                              .toString(),
                                                          onChanged: (value) {
                                                            store.name = value;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'Digite seu nome completo',
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 8),
                                                          ),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Como você prefere ser chamado?',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF041233),
                                                          fontSize: 14,
                                                          fontFamily: 'Mulish',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Container(
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
                                                        child: TextFormField(
                                                          initialValue: snapshot
                                                              .data!['nickname']
                                                              .toString(),
                                                          onChanged: (value) {
                                                            store.nickname =
                                                                value;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'Digite seu nome completo',
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 8),
                                                          ),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Seu e-mail',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF041233),
                                                          fontSize: 14,
                                                          fontFamily: 'Mulish',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
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
                                                        child: TextFormField(
                                                          initialValue: snapshot
                                                              .data!['email']
                                                              .toString(),
                                                          onChanged: (value) {
                                                            store.email = value;
                                                            if (!RegExp(
                                                                    r'^[^@]+@[^@]+\.[^@]+')
                                                                .hasMatch(
                                                                    value)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                    content: Text(
                                                                        'Email inválido')),
                                                              );
                                                              return;
                                                            }
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'Digite seu nome completo',
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 8,
                                                                    bottom: 16),
                                                          ),
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Gênero',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF041233),
                                                          fontSize: 14,
                                                          fontFamily: 'Mulish',
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 38,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12,
                                                                      vertical:
                                                                          8),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
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
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        SizedBox(
                                                                      child:
                                                                          Text(
                                                                        'Masculino',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xFF041233),
                                                                          fontSize:
                                                                              14,
                                                                          fontFamily:
                                                                              'Mulish',
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 24,
                                                                    height: 24,
                                                                    child: Icon(
                                                                        Icons
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Data de nascimento',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF041233),
                                                          fontSize: 14,
                                                          fontFamily: 'Mulish',
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 38,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          12,
                                                                      vertical:
                                                                          8),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      BorderSide(
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
                                                              child: Text(
                                                                '01/01/1999',
                                                                style:
                                                                    TextStyle(
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 16),
                                                        child: ElevatedButton(
                                                          onPressed: () async {
                                                            // Save action
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'users')
                                                                .doc(FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid)
                                                                .update({
                                                              'name': store.name
                                                                      .isNotEmpty
                                                                  ? store.name
                                                                  : snapshot
                                                                          .data![
                                                                      'name'],
                                                              'email': store
                                                                      .email
                                                                      .isNotEmpty
                                                                  ? store.email
                                                                  : snapshot
                                                                          .data![
                                                                      'email'],
                                                              'nickname': store
                                                                      .nickname
                                                                      .isNotEmpty
                                                                  ? store
                                                                      .nickname
                                                                  : snapshot
                                                                          .data![
                                                                      'nickname'],
                                                              'dataBirth': store
                                                                      .birthDate
                                                                      .isNotEmpty
                                                                  ? store
                                                                      .birthDate
                                                                  : snapshot
                                                                          .data![
                                                                      'dataBirth'],
                                                              'language': language
                                                                      .isNotEmpty
                                                                  ? language
                                                                  : snapshot
                                                                          .data![
                                                                      'language'],
                                                              'fontSize': store
                                                                          .fontSize !=
                                                                      0
                                                                  ? store
                                                                      .fontSize
                                                                  : snapshot
                                                                          .data![
                                                                      'fontSize'],
                                                              'tema': store
                                                                          .tema !=
                                                                      ''
                                                                  ? store.tema
                                                                  : snapshot
                                                                          .data![
                                                                      'tema'],
                                                            }).then((_) {
                                                              store.birthDate =
                                                                  '';
                                                              store.email = '';
                                                              store.fontSize =
                                                                  0;
                                                              store.name = '';
                                                              store.nickname =
                                                                  '';
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                    content: Text(
                                                                        'Configurações salvas com sucesso!')),
                                                              );
                                                            }).catchError(
                                                                    (error) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                    content: Text(
                                                                        'Erro ao salvar configurações: $error')),
                                                              );
                                                            });
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            backgroundColor:
                                                                appColorDeafut,
                                                          ),
                                                          child: Text(
                                                            'Salvar',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Mulish',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
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
                );
              }),
        );
      }),
    );
  }
}
