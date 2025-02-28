import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_store.dart';
import 'package:stepmd/app/modules/home/home_page.dart';
import 'package:stepmd/app/shared/constants.dart';
import 'package:flash_card/flash_card.dart';

class Flashcard extends StatefulWidget {
  @override
  _FlashcardState createState() => _FlashcardState();
}
class _FlashcardState extends State<Flashcard> {
  final FlashcardsStore flashStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    // flashStore.fetchcardsByIdsAsStream(flashStore.disciplineIds);
    return StreamBuilder(
        stream: flashStore.cardsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          }
          flashStore.startCounter();
          return Observer(builder: (context) {
            return WillPopScope(
              onWillPop: () {
                return _showBackConfirmation(context);
              },
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(
                    color: Color(0xFF4091C6),
                  ),
                  title: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(color: Color(0xFFDAE9EE)),
                        top: BorderSide(color: Color(0xFFDAE9EE)),
                        right: BorderSide(color: Color(0xFFDAE9EE)),
                        bottom: BorderSide(width: 1, color: Color(0xFFDAE9EE)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          child: Text(
                            "Tem que puxar o nome da disciplina",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          // Barra de progresso e dropdown de questões
                          width: MediaQuery.of(context).size.width * 0.20,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFDAE9EE),
                              ),
                              top: BorderSide(
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFDAE9EE),
                              ),
                              right: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFDAE9EE),
                              ),
                              bottom: BorderSide(
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFDAE9EE),
                              ),
                            ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 56,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Seu progresso',
                                            style: TextStyle(
                                              color: Color(0xFF51628A),
                                              fontSize: 12,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '(100%)',
                                            // '(${((dbStore.countAnswereds) / snapshot.data!.length * 100).truncate()}%)',
                                            style: TextStyle(
                                              color: Color(0xFF51628A),
                                              fontSize: 12,
                                              fontFamily: appFont,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      LinearProgressIndicator(
                                        value: 10,
                                        // value: (dbStore.countAnswereds) /
                                        //     snapshot.data!.length,
                                        backgroundColor: Colors.grey[300],
                                        color: Colors.blue,
                                        minHeight: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                child: const Icon(Icons.alarm,
                                    color: Colors.black),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${flashStore.hours > 0 ? '${flashStore.hours}:' : ''}${flashStore.minutes}:${flashStore.seconds < 10 ? '0' : ''}${flashStore.seconds}',
                                style: const TextStyle(
                                  color: Color(0xFF51628A),
                                  fontSize: 14,
                                  fontFamily: appFont,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Finalizar',
                                          style: TextStyle(
                                            color: Color(0xFFA22727),
                                            fontSize: 14,
                                            fontFamily: appFont,
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
                      ],
                    ),
                  ),
                ),
                body: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: PageView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Evita que ocupe espaço desnecessário
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlashCard(
                              frontWidget: Container(
                                  height: 428,
                                  width: 912,
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFE1F3FF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9999),
                                          ),
                                        ),
                                        child: Text(
                                          'Verso',
                                          style: TextStyle(
                                            color: Color(0xFF4091C6),
                                            fontSize: 14,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${snapshot.data![flashStore.cardSelect]['labelVerse']}',
                                                style: TextStyle(
                                                  color: Color(0xFF51628A),
                                                  fontSize: 16,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    ' - ${snapshot.data![flashStore.cardSelect]['textVerse']}',
                                                style: TextStyle(
                                                  color: Color(0xFF51628A),
                                                  fontSize: 16,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        margin: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.blue, width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(2, 2),
                                                  spreadRadius: 1,
                                                  blurRadius: 15)
                                            ]),
                                        child: Center(
                                            child: Icon(Icons.volume_down_sharp,
                                                color: Colors.blue)),
                                      ),
                                    ],
                                  )),
                              backWidget: Container(
                                width: 912,
                                height: 450,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFDAE9EE)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3FAEAEAE),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFE1F3FF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                        ),
                                      ),
                                      child: Text(
                                        'Frente',
                                        style: TextStyle(
                                          color: Color(0xFF4091C6),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${snapshot.data![flashStore.cardSelect]['label']}',
                                              style: TextStyle(
                                                color: Color(0xFF51628A),
                                                fontSize: 16,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' - ${snapshot.data![flashStore.cardSelect]['text']}',
                                              style: TextStyle(
                                                color: Color(0xFF51628A),
                                                fontSize: 16,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 360,
                                            height: 200,
                                            decoration: ShapeDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${snapshot.data![flashStore.cardSelect]['imageUrl']}"),
                                                fit: BoxFit.fill,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      width: double.infinity,
                                      height: 40,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  child: SvgPicture.asset(
                                                    'assets/svg/icon-rotation.svg',
                                                    color: Color(0xFF4091C6),
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                const Text(
                                                  'Virar carta',
                                                  style: TextStyle(
                                                    color: Color(0xFF4091C6),
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
                              height: 428,
                              width: 912,
                            ),
                            const SizedBox(height: 24),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              height: 96,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Qual seu nível de dificuldade neste card?',
                                    style: TextStyle(
                                      color: Color(0xFF51628A),
                                      fontSize: 16,
                                      fontFamily: appFont,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  flashStore.setAnswer(
                                                      flashStore.cardSelect, 1);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 32,
                                                      vertical: 8),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFC64040),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFFC64040)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  child: const Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '1',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Work Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Muito difícil',
                                                style: TextStyle(
                                                  color: Color(0xFF51628A),
                                                  fontSize: 14,
                                                  fontFamily: appFont,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  flashStore.setAnswer(
                                                      flashStore.cardSelect, 2);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 32,
                                                      vertical: 8),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFFEA900),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                  child: const Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '2',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Work Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Difícil',
                                                style: TextStyle(
                                                  color: Color(0xFF51628A),
                                                  fontSize: 14,
                                                  fontFamily: appFont,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  flashStore.setAnswer(
                                                      flashStore.cardSelect, 3);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 32,
                                                      vertical: 8),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFFDD700),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                  child: const Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '3',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Work Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Normal',
                                                style: TextStyle(
                                                  color: Color(0xFF51628A),
                                                  fontSize: 14,
                                                  fontFamily: appFont,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  flashStore.setAnswer(
                                                      flashStore.cardSelect, 4);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 32,
                                                      vertical: 8),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF20A653),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                  child: const Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '4',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Work Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Fácil',
                                                style: TextStyle(
                                                  color: Color(0xFF51628A),
                                                  fontSize: 14,
                                                  fontFamily: appFont,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  flashStore.setAnswer(
                                                      flashStore.cardSelect, 5);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 32,
                                                      vertical: 8),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF0021C9),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                  child: const Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '5',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Work Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Muito fácil',
                                                style: TextStyle(
                                                  color: Color(0xFF51628A),
                                                  fontSize: 14,
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
                                ],
                              ),
                            )
                          ],
                        ));
                      },
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(color: Color(0xFFDAE9EE)),
                      top: BorderSide(width: 1, color: Color(0xFFDAE9EE)),
                      right: BorderSide(color: Color(0xFFDAE9EE)),
                      bottom: BorderSide(color: Color(0xFFDAE9EE)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFDAE9EE)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (flashStore.cardSelect > 0) {
                                flashStore.setSelect(flashStore.cardSelect - 1);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  child: const Icon(
                                    Icons.arrow_back_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Anterior',
                                  style: TextStyle(
                                    color: Color(0xFF957B0B),
                                    fontSize: 14,
                                    fontFamily: appFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Color(0xFFCBD5E1),
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              '${flashStore.cardSelect + 1}',
                              style: const TextStyle(
                                color: Color(0xFF0F172A),
                                fontSize: 16,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '/${snapshot.data!.length}',
                            style: const TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 16,
                              fontFamily: appFont,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (flashStore.cardSelect <
                                snapshot.data!.length - 1) {
                              flashStore.setSelect(flashStore.cardSelect + 1);
                            } else {
                              flashStore.finishFlashcards();
                            }
                          },
                          child: Container(
                            height: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFF051333),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  flashStore.cardSelect <
                                          flashStore.answers.length - 1
                                      ? 'Próxima'
                                      : 'Finalizar',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: appFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 24,
                                  height: 24,
                                  child: const Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Future<bool> _showBackConfirmation(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Cancelar teste',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Você tem certeza que deseja cancelar o estudo de flashcard?',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Isso fará com que perca todo seu progresso neste estudo.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Não cancelar'),
          ),
          TextButton(
            onPressed: () async {
              // Navigator.of(context).pop();
              await flashStore.reset();
              await Modular.to.pushReplacementNamed('/home/');
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.red[600], // Cor de fundo correta
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 16), // Espaçamento interno
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bordas arredondadas
              ),
            ),
            child: const Text(
              'Sim, cancelar o estudo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ) ?? false;
  }
}
