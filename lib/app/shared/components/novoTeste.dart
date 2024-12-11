import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_store.dart';
import 'package:stepmd/app/shared/components/test.dart';
import 'package:stepmd/app/shared/constants.dart';

class NovoTeste extends StatelessWidget {
  final DbQuestionsStore dbStore = Modular.get();

  Map<String, bool> _checkedCategories = {};

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
                  title: const Text(
                    'Configure um teste',
                    style: TextStyle(
                      color: Color(0xFF957B0B),
                      fontSize: 20,
                      fontFamily: appFont,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dê um nome ao seu teste:',
                        style: TextStyle(
                          color: Color(0xFF957B0B),
                          fontSize: 18,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 300,
                        child: TextField(
                            onChanged: (value) {
                              dbStore.setTestName(value);
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              hintText: 'Ex.: Meu teste 1',
                              hintStyle: const TextStyle(
                                color: Color(0xFF858585),
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w300,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCBD5E1),
                                  width: 1,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: appFont,
                            )),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Modo da prova',
                        style: TextStyle(
                          color: Color(0xFF957B0B),
                          fontSize: 18,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 190,
                        padding: const EdgeInsets.all(5),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFDAE9EE)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                dbStore.setTestMode("tutor");
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: dbStore.testMode == "tutor"
                                    ? ShapeDecoration(
                                        color: Color(0xFF051333),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      )
                                    : null,
                                child: Text(
                                  'Tutor',
                                  style: TextStyle(
                                    color: dbStore.testMode == "tutor"
                                        ? Colors.white
                                        : Color(0xFF051333),
                                    fontSize: 14,
                                    fontFamily: appFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dbStore.setTestMode("cronometrado");
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: dbStore.testMode == "cronometrado"
                                    ? ShapeDecoration(
                                        color: Color(0xFF051333),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      )
                                    : null,
                                child: Text(
                                  'Cronometrado',
                                  style: TextStyle(
                                    color: dbStore.testMode == "cronometrado"
                                        ? Colors.white
                                        : Color(0xFF051333),
                                    fontSize: 14,
                                    fontFamily: appFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Modelo da prova',
                        style: TextStyle(
                          color: Color(0xFF957B0B),
                          fontSize: 18,
                          fontFamily: appFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 380,
                        padding: const EdgeInsets.all(5),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFDAE9EE)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                dbStore.setTestModel("stepmd");
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: dbStore.testModel == "stepmd"
                                    ? ShapeDecoration(
                                        color: Color(0xFF051333),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      )
                                    : null,
                                child: Text(
                                  'StepMD Simulado',
                                  style: TextStyle(
                                    color: dbStore.testModel == "stepmd"
                                        ? Colors.white
                                        : Color(0xFF051333),
                                    fontSize: 14,
                                    fontFamily: appFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dbStore.setTestModel("nbme");
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: dbStore.testModel == "nbme"
                                    ? ShapeDecoration(
                                        color: Color(0xFF051333),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      )
                                    : null,
                                child: Text(
                                  'Estilo NBME',
                                  style: TextStyle(
                                    color: dbStore.testModel == "nbme"
                                        ? Colors.white
                                        : Color(0xFF051333),
                                    fontSize: 14,
                                    fontFamily: appFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dbStore.setTestModel("personalizado");
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: dbStore.testModel == "personalizado"
                                    ? ShapeDecoration(
                                        color: Color(0xFF051333),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      )
                                    : null,
                                child: Text(
                                  'Personalizado',
                                  style: TextStyle(
                                    color: dbStore.testModel == "personalizado"
                                        ? Colors.white
                                        : Color(0xFF051333),
                                    fontSize: 14,
                                    fontFamily: appFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      dbStore.testModel == "personalizado"
                          ? Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          width: 550,
                                          height: 80,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                  onChanged: (value) {
                                                    dbStore.questionIDs = value;
                                                  },
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 12,
                                                            vertical: 8),
                                                    hintText:
                                                        'Ex.: #00155/#00157/#00158/...',
                                                    hintStyle: const TextStyle(
                                                      color: Color(0xFF858585),
                                                      fontSize: 14,
                                                      fontFamily: appFont,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Color(0xFFCBD5E1),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: appFont,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Você pode adicionar até 40 IDs separados por barra',
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
                            )
                          : Container(
                              width: 600,
                              height: 419,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('categories')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }

                                  if (snapshot.hasError) {
                                    return Center(
                                        child: Text(
                                            'Erro ao carregar categorias'));
                                  }

                                  if (!snapshot.hasData ||
                                      snapshot.data!.docs.isEmpty) {
                                    return Center(
                                        child: Text(
                                            'Nenhuma categoria encontrada'));
                                  }

                                  final categories = snapshot.data!.docs;

                                  return ListView.builder(
                                    itemCount: categories.length,
                                    itemBuilder: (context, index) {
                                      final category = categories[index];
                                      final categoryId = category.id;
                                      final categoryName = category['name'];
                                      // final categoryIcon =
                                      //     category['icon'] ?? Icons.category;

                                      return Observer(
                                        builder: (_) => Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 12.0),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 16.0),
                                          decoration: BoxDecoration(
                                            color: dbStore.isChecked(categoryId)
                                                ? Colors.blue.shade50
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 6.0,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade100,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.category,
                                                color: Colors.blue.shade700,
                                              ),
                                            ),
                                            title: Text(
                                              categoryName,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            trailing: Checkbox(
                                              value:
                                                  dbStore.isChecked(categoryId),
                                              onChanged: (_) {
                                                dbStore
                                                    .toggleCategory(categoryId);
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              activeColor: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                      SizedBox(height: 85),
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
                                color: Color(0xFF957B0B),
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              if (dbStore.checkedCategories.length != 0 ||
                                  dbStore.questionIDs.length != 0) {
                                if (dbStore.testModel == 'personalizado') {
                                  dbStore.splitQuestions(dbStore.questionIDs);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Test()),
                                  );
                                } else {
                                  dbStore.fetchQuestionsByCategories(
                                      dbStore.checkedCategories);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Test()),
                                  );
                                }
                              }
                            },
                            child: Container(
                              width: 114,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xFF051333),
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
                          Container(width: 150,)
                        ],
                      ),
                    ],
                  ),
                ));
          });
        });
  }
}
