import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_store.dart';
import 'package:stepmd/app/shared/constants.dart';

class Test extends StatelessWidget {
  final DbQuestionsStore dbStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('questions').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Observer(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(
                  color: Color(0xFF4091C6), // Define a cor do botão de voltar
                ),
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
                                  borderRadius: BorderRadius.circular(8),
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
                                      'assets/svg/calculate.svg',
                                      color: Color(0xFF4091C6),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: SvgPicture.asset(
                                      'assets/svg/icon-science.svg',
                                      color: Color(0xFF4091C6),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: SvgPicture.asset(
                                      'assets/svg/menubook.svg',
                                      color: Color(0xFF4091C6),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: SvgPicture.asset(
                                      'assets/svg/icon-addnotes.svg',
                                      color: Color(0xFF4091C6),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: SvgPicture.asset(
                                      'assets/svg/icon-flashcard.svg',
                                      color: Color(0xFF4091C6),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: SvgPicture.asset(
                                      'assets/svg/icon-star.svg',
                                      color: Color(0xFF4091C6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                              child:
                                  const Icon(Icons.alarm, color: Colors.black),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '0:32',
                              style: TextStyle(
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
                                Row(
                                  children: [
                                    Container(
                                        width: 34,
                                        height: 34,
                                        decoration: const ShapeDecoration(
                                          shape: CircleBorder(
                                            side: BorderSide(
                                                width: 1, color: Colors.black),
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            size: 16,
                                            Icons.pause,
                                            color: Colors.black,
                                          ),
                                        )),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Pausar teste',
                                      style: TextStyle(
                                        color: Color(0xFF51628A),
                                        fontSize: 14,
                                        fontFamily: appFont,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 34,
                                        height: 34,
                                        decoration: const ShapeDecoration(
                                          shape: CircleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFFA22727)),
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            size: 16,
                                            Icons.stop,
                                            color: Colors.black,
                                          ),
                                        )),
                                    const SizedBox(width: 8),
                                    const Text(
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
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 24,
                            height: 24,
                            child: const Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      const SizedBox(width: 3),
                                      Text(
                                        '(70%)',
                                        style: TextStyle(
                                          color: Color(0xFF51628A),
                                          fontSize: 12,
                                          fontFamily: appFont,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  width: 165,
                                  height: 4,
                                  child: FlutterLogo(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 656,
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 8, right: 8),
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              left: 16,
                                              right: 8,
                                              bottom: 8,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                            child: InkWell(
                                              onTap: () {
                                                dbStore.setSelect(index);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          child: Text(
                                                            '${index + 1} - ${snapshot.data!.docs[index]['label']}',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF51628A),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  appFont,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    decoration: ShapeDecoration(
                                                      color: Color(0xFFCFE6D8),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9999),
                                                      ),
                                                    ),
                                                    child: Icon(Icons
                                                        .check_circle_outlined),
                                                  ),
                                                ],
                                              ),
                                            ));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '02 ${snapshot.data!.docs[dbStore.questionSelect]['label']} ',
                                    style: const TextStyle(
                                      color: Color(0xFF2E3F69),
                                      fontSize: 20,
                                      fontFamily: appFont,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'ID: #00159 ',
                                    style: TextStyle(
                                      color: Color(0xFF858585),
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: appFont,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                child: Text(
                                  "${snapshot.data!.docs[dbStore.questionSelect]['description']}",
                                  style: const TextStyle(
                                    color: Color(0xFF2E2E2E),
                                    fontSize: 16,
                                    fontFamily: appFont,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Image.network(
                                  width: 468,
                                  height: 258,
                                  '${snapshot.data!.docs[dbStore.questionSelect]['imageUrl']}'),
                              const SizedBox(height: 16),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      NeverScrollableScrollPhysics(), // Desabilita o scroll da lista embutida
                                  itemCount: (snapshot.data!
                                                  .docs[dbStore.questionSelect]
                                              ['options'] ??
                                          [])
                                      .length,
                                  itemBuilder: (context, index) {
                                    final option = snapshot.data!
                                                .docs[dbStore.questionSelect]
                                            ['options'][index] ??
                                        {};
                                    final isCorrect =
                                        option['isCorrect'] ?? false;
                                    final text = option['text'] ?? '';
                                    final letter = String.fromCharCode(65 +
                                        index); // Converte índice para letra ('A', 'B', etc.)

                                    if (dbStore.questionAnswered) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        decoration: BoxDecoration(
                                          color: isCorrect
                                              ? Color(0xFFE4F7E4)
                                              : Color(0xFFFFE4E4),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: isCorrect
                                                ? Color(0xFFA3CFA3)
                                                : Color(0xFFFCC3C3),
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Ícone e Texto
                                            Container(
                                              width: 36,
                                              height: 36,
                                              padding: const EdgeInsets.all(8),
                                              decoration: ShapeDecoration(
                                                color: isCorrect
                                                    ? Color(0xFF2E7D32)
                                                    : Color(0xFFA22727),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    width: 1,
                                                    color: isCorrect
                                                        ? Color(0xFF2E7D32)
                                                        : Color(0xFFA22727),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  isCorrect ? '✔' : '✘',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              text,
                                              style: TextStyle(
                                                color: isCorrect
                                                    ? Color(0xFF2E7D32)
                                                    : Color(0xFFA22727),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Color(0xAA51628B),
                                                width: 0.8,
                                              ),
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              dbStore.toggleAnswered();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                // Ícone e Texto
                                                Container(
                                                  width: 36,
                                                  height: 36,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xAA51628B)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9999),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      letter, // Exibe a letra baseada no índice
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xAA51628B),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  text,
                                                  style: TextStyle(
                                                    color: Color(0xAA51628B),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 24,
                                        height: 24,
                                        child: Icon(Icons.feedback_outlined)),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Envie um feedback',
                                      style: TextStyle(
                                        color: Color(0xFF2E3F69),
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                width: MediaQuery.of(context).size.width,
                height: 72,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFDAE9EE)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
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
                              color: Color(0xFF2E3F69),
                              fontSize: 14,
                              fontFamily: appFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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
                          child: const Text(
                            '02',
                            style: TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 16,
                              fontFamily: appFont,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '/40',
                          style: TextStyle(
                            color: Color(0xFF0F172A),
                            fontSize: 16,
                            fontFamily: appFont,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        dbStore.setSelect(dbStore.questionSelect + 1);
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFF4091C6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Próxima',
                              style: TextStyle(
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
                  ],
                ),
              ),
            );
          });
        });
  }
}
