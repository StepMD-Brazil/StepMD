import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_store.dart';
import 'package:stepmd/app/modules/home/home_page.dart';
import 'package:stepmd/app/shared/components/resultadoTesteRealizado.dart';
import 'package:stepmd/app/shared/components/testeRealizados.dart';
import 'package:stepmd/app/shared/constants.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final DbQuestionsStore dbStore = Modular.get();
  final QuillController _controller = QuillController.basic();

  @override
  void dispose() {
    dbStore.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dbStore.questionsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (dbStore.testMode == 'cronometrado') {
          dbStore.startCounter();
        }
        return Observer(
          builder: (context) {
            return WillPopScope(
              onWillPop: () {
                return _showBackConfirmation(context);
              },
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(
                    color: Color(0xFF4091C6), // Define a cor do botão de voltar
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
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: Container(
                                              height:
                                                  400, // Ajuste a altura conforme necessário
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              child: SimpleCalculator(
                                                theme: CalculatorThemeData(
                                                  borderColor:
                                                      Colors.grey[300]!,
                                                  operatorColor: Colors.white,
                                                  displayColor: Colors.white,
                                                  displayStyle: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.black),
                                                  expressionStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                  operatorStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        child: SvgPicture.asset(
                                          'assets/svg/calculate.svg',
                                          color: Color(0xFF4091C6),
                                        ),
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
                                    InkWell(
                                      onTap: () {
                                        _showNotebook(context);
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        child: SvgPicture.asset(
                                          'assets/svg/menubook.svg',
                                          color: Color(0xFF4091C6),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            TextEditingController
                                                noteController =
                                                TextEditingController();

                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom,
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              16)),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Text(
                                                      "Escreva sua anotação",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    TextField(
                                                      controller:
                                                          noteController,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "Digite sua nota aqui...",
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      maxLines: 3,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              "Cancelar"),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            String noteText =
                                                                noteController
                                                                    .text
                                                                    .trim();
                                                            if (noteText
                                                                .isNotEmpty) {
                                                              dbStore.addNote(
                                                                snapshot.data![
                                                                        dbStore
                                                                            .questionSelect]
                                                                    [
                                                                    'questionId'],
                                                                noteText,
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                          child: const Text(
                                                              "Salvar"),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        child: SvgPicture.asset(
                                          'assets/svg/icon-addnotes.svg',
                                          color: Color(0xFF4091C6),
                                        ),
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
                          // Barra de progresso e dropdown de questões
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
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      '(${((dbStore.countAnswereds) / snapshot.data!.length * 100).truncate()}%)',
                                      style: TextStyle(
                                        color: Color(0xFF51628A),
                                        fontSize: 12,
                                        fontFamily: appFont,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                LinearProgressIndicator(
                                  value: (dbStore.countAnswereds /
                                      snapshot.data!.length),
                                  backgroundColor: Colors.grey[300],
                                  color: Colors.blue,
                                  minHeight: 10,
                                ),
                                Container(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: DropdownButton<String>(
                                    hint: Text("Selecione uma opção"),
                                    value:
                                        '${snapshot.data![dbStore.questionSelect]['label']}',
                                    isExpanded: true,
                                    items: snapshot.data!
                                        .map<DropdownMenuItem<String>>((item) {
                                      return DropdownMenuItem<String>(
                                        value: item['label'],
                                        child: Row(
                                          children: [
                                            Text(
                                              '${snapshot.data!.indexOf(item) + 1} - ${item['label']}',
                                              style: TextStyle(
                                                color: snapshot.data![dbStore
                                                                .questionSelect]
                                                            ['label'] ==
                                                        item['label']
                                                    ? Color.fromRGBO(
                                                        34, 109, 159, 1)
                                                    : Color.fromRGBO(
                                                        5, 19, 51, 1),
                                                fontSize: 14,
                                                fontFamily: appFont,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 24,
                                              height: 24,
                                              decoration: ShapeDecoration(
                                                color: dbStore.answers[snapshot
                                                                .data!
                                                                .indexOf(item)]
                                                            ['status'] ==
                                                        1
                                                    ? Color(0xFFCFE6D8)
                                                    : dbStore.answers[snapshot
                                                                    .data!
                                                                    .indexOf(
                                                                        item)]
                                                                ['status'] ==
                                                            -1
                                                        ? Color(0xFFF8D7DA)
                                                        : Color(0xFFE0E0E0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                ),
                                              ),
                                              child: Icon(
                                                dbStore.answers[snapshot.data!
                                                                .indexOf(item)]
                                                            ['status'] ==
                                                        1
                                                    ? Icons
                                                        .check_circle_outlined
                                                    : dbStore.answers[snapshot
                                                                    .data!
                                                                    .indexOf(
                                                                        item)]
                                                                ['status'] ==
                                                            -1
                                                        ? Icons.close_rounded
                                                        : Icons.info_outline,
                                                color: dbStore.answers[snapshot
                                                                .data!
                                                                .indexOf(item)]
                                                            ['status'] ==
                                                        1
                                                    ? Colors.green
                                                    : dbStore.answers[snapshot
                                                                    .data!
                                                                    .indexOf(
                                                                        item)]
                                                                ['status'] ==
                                                            -1
                                                        ? Colors.red
                                                        : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      final selectedIndex = snapshot.data!
                                          .indexWhere((item) =>
                                              item['label'] == newValue);

                                      if (selectedIndex != -1) {
                                        dbStore.setSelect(selectedIndex);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: dbStore.testMode == 'cronometrado'
                              ? Row(
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
                                      '${dbStore.hours > 0 ? '${dbStore.hours}:' : ''}${dbStore.minutes}:${dbStore.seconds < 10 ? '0' : ''}${dbStore.seconds}',
                                      style: const TextStyle(
                                        color: Color(0xFF51628A),
                                        fontSize: 14,
                                        fontFamily: appFont,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              : null,
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
                                  dbStore.testMode != 'cronometrado'
                                      ? Container()
                                      : dbStore.timeIsRunning
                                          ? InkWell(
                                              onTap: () {
                                                dbStore.stopCounter();
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                      width: 34,
                                                      height: 34,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        shape: CircleBorder(
                                                          side: BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.black),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                dbStore.startCounter();
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                      width: 34,
                                                      height: 34,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        shape: CircleBorder(
                                                          side: BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Icon(
                                                          size: 16,
                                                          Icons.play_arrow,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                                  const SizedBox(width: 8),
                                                  const Text(
                                                    'Retomar teste',
                                                    style: TextStyle(
                                                      color: Color(0xFF51628A),
                                                      fontSize: 14,
                                                      fontFamily: appFont,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      InkWell(
                                        onTap: () {
                                          _showFinishConfirmation(context);
                                        },
                                        child: const Text(
                                          'Finalizar',
                                          style: TextStyle(
                                            color: Color(0xFFA22727),
                                            fontSize: 14,
                                            fontFamily: appFont,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 822,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 150),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.37,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${snapshot.data![dbStore.questionSelect]['label']}',
                                              style: const TextStyle(
                                                color: Color(0xFF957B0B),
                                                fontSize: 20,
                                                fontFamily: appFont,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'ID: ${snapshot.data![dbStore.questionSelect]['questionId']} ',
                                              style: const TextStyle(
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            "${snapshot.data![dbStore.questionSelect]['description']}",
                                            style: const TextStyle(
                                              color: Color(0xFF2E2E2E),
                                              fontSize: 16,
                                              fontFamily: appFont,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        snapshot.data![dbStore.questionSelect]
                                                    ['imageUrl'] !=
                                                ""
                                            ? Image.network(
                                                width: 468,
                                                height: 258,
                                                '${snapshot.data![dbStore.questionSelect]['imageUrl']}')
                                            : Container(
                                                width: 36,
                                                height: 200,
                                              ),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: (snapshot.data![dbStore
                                                            .questionSelect]
                                                        ['options'] ??
                                                    [])
                                                .length,
                                            itemBuilder: (context, index) {
                                              final option = snapshot.data![
                                                          dbStore
                                                              .questionSelect]
                                                      ['options'][index] ??
                                                  {};
                                              final isCorrect =
                                                  option['isCorrect'] ?? false;
                                              final text = option['text'] ?? '';
                                              final letter =
                                                  String.fromCharCode(
                                                      65 + index);

                                              if (dbStore.answers[dbStore
                                                          .questionSelect]
                                                      ['status'] ==
                                                  0) {
                                                return Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 12),
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      top: BorderSide(
                                                        color:
                                                            Color(0xAA51628B),
                                                        width: 0.8,
                                                      ),
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (isCorrect) {
                                                          dbStore.setAnswer(
                                                              dbStore
                                                                  .questionSelect,
                                                              1,
                                                              index);
                                                        } else {
                                                          dbStore.setAnswer(
                                                              dbStore
                                                                  .questionSelect,
                                                              -1,
                                                              index);
                                                        }
                                                      });
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        // Ícone e Texto
                                                        Container(
                                                          width: 36,
                                                          height: 36,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  width: 1,
                                                                  color: Color(
                                                                      0xAA51628B)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          9999),
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              letter,
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xAA51628B),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        Expanded(
                                                          child: Text(
                                                            text,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xAA51628B),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              } else if (dbStore.answers[dbStore
                                                          .questionSelect]
                                                      ['status'] ==
                                                  1) {
                                                return isCorrect
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFE4F7E4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFA3CFA3),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // Ícone e Texto
                                                            Container(
                                                              width: 36,
                                                              height: 36,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Color(
                                                                    0xFF2E7D32),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color: Color(
                                                                          0xFF2E7D32)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              9999),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  '✔',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 8),
                                                            Expanded(
                                                              child: Text(
                                                                text,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFF2E7D32),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 12),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border(
                                                            top: BorderSide(
                                                              color: Color(
                                                                  0xAA51628B),
                                                              width: 0.8,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // Ícone e Texto
                                                            Container(
                                                              width: 36,
                                                              height: 36,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color: Color(
                                                                          0xAA51628B)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              9999),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  letter,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xAA51628B),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 8),
                                                            Expanded(
                                                              child: Text(
                                                                text,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xAA51628B),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                              } else {
                                                return index ==
                                                        dbStore.answers[dbStore
                                                                .questionSelect]
                                                            ['indexOption']
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFFE4E4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFFCC3C3),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // Ícone e Texto
                                                            Container(
                                                              width: 36,
                                                              height: 36,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Color(
                                                                    0xFFA22727),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color: Color(
                                                                          0xFFA22727)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              9999),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  '✘',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 8),
                                                            Expanded(
                                                              child: Text(
                                                                text,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFFA22727),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 12),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border(
                                                            top: BorderSide(
                                                              color: Color(
                                                                  0xAA51628B),
                                                              width: 0.8,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // Ícone e Texto
                                                            Container(
                                                              width: 36,
                                                              height: 36,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  ShapeDecoration(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color: Color(
                                                                          0xAA51628B)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              9999),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  letter,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xAA51628B),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 8),
                                                            Expanded(
                                                              child: Text(
                                                                text,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xAA51628B),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // const SizedBox(height: 16),
                                  // Container(
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.start,
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.center,
                                  //     children: [
                                  //       Container(
                                  //         width: 24,
                                  //         height: 24,
                                  //         child: Icon(Icons.feedback_outlined),
                                  //       ),
                                  //       const SizedBox(width: 8),
                                  //       Text(
                                  //         'Envie um feedback',
                                  //         style: TextStyle(
                                  //           color: Color(0xFF957B0B),
                                  //           fontSize: 14,
                                  //           fontFamily: appFont,
                                  //           fontWeight: FontWeight.w500,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: 16,
                  ),
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
                            onTap: dbStore.questionSelect > 0
                                ? () {
                                    setState(() {
                                      dbStore.setSelect(
                                          dbStore.questionSelect - 1);
                                    });
                                  }
                                : null,
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
                              '${dbStore.questionSelect + 1}',
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
                            setState(() {
                              if (dbStore.questionSelect <
                                  snapshot.data!.length - 1) {
                                dbStore.setSelect(dbStore.questionSelect + 1);
                              } else {
                                _showFinishConfirmation(context);
                              }
                            });
                          },
                          child: Container(
                            height: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFF051333),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  dbStore.questionSelect ==
                                          snapshot.data!.length - 1
                                      ? 'Finalizar'
                                      : 'Próxima',
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
                                  child: dbStore.questionSelect !=
                                          snapshot.data!.length - 1
                                      ? const Icon(
                                          Icons.arrow_forward_outlined,
                                          color: Colors.white,
                                        )
                                      : null,
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
          },
        );
      },
    );
  }

  Future<bool> _showNotebook(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => Dialog(
            insetPadding: const EdgeInsets.all(
                16), // Padding para evitar que ocupe toda a tela
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height *
                  0.8, // Define altura do popup
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Toolbar do Quill
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    child: QuillToolbar.simple(controller: _controller),
                  ),
                  const SizedBox(height: 16),
                  // Editor de texto
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: QuillEditor.basic(
                        controller: _controller,
                        configurations: const QuillEditorConfigurations(
                          placeholder:
                              'Dê um título a esta página, digite aqui suas anotações',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Botão de fechar
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          Navigator.of(context).pop(true), // Retorna true
                      child: const Text('Fechar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ) ??
        false; // Garante que não retorne null
  }

  void _showFinishConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Finalizar teste',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Você tem certeza que deseja finalizar o teste?',
                style: TextStyle(fontSize: 14),
              ),
            ]),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              dbStore.finishTest();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => ResultadoTestesRealizados()),
              // );
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
              'Sim, finalizar o teste',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
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
                  'Você tem certeza que deseja cancelar o teste?',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'Isso fará com que perca todo seu progresso neste teste.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Não cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await dbStore.reset();
                  await Modular.to.pushReplacementNamed('/home');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red[600], // Cor de fundo correta
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 16), // Espaçamento interno
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Bordas arredondadas
                  ),
                ),
                child: const Text(
                  'Sim, cancelar o teste',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
