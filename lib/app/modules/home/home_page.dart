import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/configuracao/configuracao_page.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_page.dart';
import 'package:stepmd/app/modules/dicas/dicas_page.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_page.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_store.dart';
import 'package:stepmd/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/modules/initialPage/initialPage_page.dart';
import 'package:stepmd/app/modules/notebook/notebook_page.dart';
import 'package:stepmd/app/modules/notes/notes_page.dart';
import 'package:stepmd/app/modules/suporte/suporte_page.dart';
import 'package:stepmd/app/root/root_store.dart';
import 'package:stepmd/app/shared/constants.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../artigos/artigos_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final RootStore rootStore = Modular.get();
  final FlashcardsStore flashStore = Modular.get();

  _onItemTapped(int index) {
    setState(() {
      store.selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Home Page ${FirebaseAuth.instance.currentUser!.uid}');
    // uploadCsvToFirestore('assets/Modelo StepMD - Flashcards.csv');
  }

  Future<void> uploadCsvToFirestore(String filePath) async {
    // Carregar o arquivo CSV
    final input = await rootBundle.loadString(filePath);
    final fields = CsvToListConverter().convert(input);

    // Obter a referência do Firestore
    final firestore = FirebaseFirestore.instance;

    // Iterar sobre as linhas do CSV e inserir no Firestore
    for (var i = 1; i < fields.length; i++) {
      final row = fields[i];
      final label = row[0];
      final text = row[1];
      final textVerse = row[2];
      final category = row[3];
      final imageUrl = row[4];

      // Buscar o ID da categoria no Firestore
      final categoryQuerySnapshot = await firestore
          .collection('categories')
          .where('name', isEqualTo: category)
          .get();

      String categoryId;
      if (categoryQuerySnapshot.docs.isNotEmpty) {
        categoryId = categoryQuerySnapshot.docs.first.id;
      } else {
        // Se a categoria não existir, criar uma nova
        final newCategoryDoc =
            await firestore.collection('categories').add({'name': category});
        categoryId = newCategoryDoc.id;
      }
      // Verificar se o documento já existe
      final querySnapshot = await firestore
          .collection('flashcards')
          .where('label', isEqualTo: label)
          .where('categoryId', isEqualTo: categoryId)
          .get();
      if (querySnapshot.docs.isEmpty) {
        // Criar um mapa de dados
        final data = {
          'label': label,
          'labelVerse': label,
          'text': text,
          'textVerse': textVerse,
          'categoryId': category,
          'imageUrl': imageUrl,
        };

        // Inserir no Firestore
        await firestore.collection('flashcards').add(data);
        print('Documento adicionado: $label');
      } else {
        print('Documento já existe: $label');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: Center(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).hintColor,
                    width: 0.5, // Set the border width
                  ),
                ),
                child: Drawer(
                  width: MediaQuery.of(context).size.width * 0.14,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: SvgPicture.asset(
                            'assets/svg/logo.svg',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: 35,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFCBD5E1),
                              ),
                              borderRadius: BorderRadius.circular(9999),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Theme.of(context).hintColor,
                                ),
                                const SizedBox(width: 3),
                                SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Pesquisar',
                                      hintStyle: TextStyle(
                                        color: Theme.of(context).hintColor,
                                        fontSize: 14,
                                        fontFamily: appFont,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 0,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(0);
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.quiz_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'StepMD Qbank',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 1,
                        onTap: () {
                          _onItemTapped(1); // Ativa "Banco de questões"
                          store.selectedIndexDB = 0;
                        },
                      ),
                      Visibility(
                        visible: store.selectedIndex ==
                            1, // Ativa apenas quando "Banco de questões" está ativo
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    decoration: store.selectedIndexDB == 0
                                        ? ShapeDecoration(
                                            color: const Color(0xFFE2F1FF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Novo teste',
                                        style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontSize: 14,
                                          fontFamily: appFont,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              selected: store.selectedIndexDB == 0,
                              onTap: () async {
                                store.selectedIndexDB =
                                    0; // Atualiza o índice do Banco de questões
                              },
                            ),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width *
                                        0.11,
                                    decoration: store.selectedIndexDB == 1
                                        ? ShapeDecoration(
                                            color: const Color(0xFFE2F1FF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Testes realizados',
                                        style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontSize: 14,
                                          fontFamily: appFont,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              selected: store.selectedIndexDB == 1,
                              onTap: () {
                                store.selectedIndexDB =
                                    1; // Atualiza o índice do Banco de questões
                              },
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/flash.svg',
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Flashcards',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex ==
                            2, // Define o estado selecionado de Flashcards
                        onTap: () async {
                          _onItemTapped(
                              2); // Atualiza o índice principal para Flashcards
                          store.selectedIndexDB =
                              -1; // Reseta o estado de subitens
                        },
                      ),
                      Visibility(
                        visible: store.selectedIndex ==
                            2, // Ativa os subitens apenas quando Flashcards está selecionado
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width *
                                        0.11,
                                    decoration: store.selectedIndexDB == 0
                                        ? ShapeDecoration(
                                            color: Color(0xFFE2F1FF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Meus decks',
                                        style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontSize: 14,
                                          fontFamily: appFont,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              selected: store.selectedIndexDB ==
                                  0, // Verifica o estado do subitem
                              onTap: () async {
                                store.selectedIndexDB =
                                    0; // Atualiza o índice de subitens
                              },
                            ),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width *
                                        0.11,
                                    decoration: store.selectedIndexDB == 1
                                        ? ShapeDecoration(
                                            color: Color(0xFFE2F1FF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Decks prontos',
                                        style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontSize: 14,
                                          fontFamily: appFont,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              selected: store.selectedIndexDB ==
                                  1, // Verifica o estado do subitem
                              onTap: () {
                                store.selectedIndexDB =
                                    1; // Atualiza o índice de subitens
                              },
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/book.svg',
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Meu caderno',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 3,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(3);
                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/add_notes.svg',
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Notes',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 4,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(4);
                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/notes.svg',
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Reviews',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 5,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(5);
                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.lightbulb_outline_sharp,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'High Yield Tips',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 6,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(6);
                          // Then close the drawer
                        },
                      ),
                      const SizedBox(
                        height: 270,
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.help_outline_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Suporte',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 7,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(7);
                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.settings_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Configurações',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 8,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(8);

                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.login,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Log out',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: store.selectedIndex == 9,
                        onTap: () async {
                          // Update the state of the app
                          _onItemTapped(9);
                          await rootStore.signout();

                          // Then close the drawer
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: store.widgetOptions[store.selectedIndex ?? 0]),
            ],
          ),
        ),
      );
    });
  }
}
