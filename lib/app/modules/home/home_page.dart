import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/configuracao/configuracao_page.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_page.dart';
import 'package:stepmd/app/modules/dicas/dicas_page.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_page.dart';
import 'package:stepmd/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/modules/initialPage/initialPage_page.dart';
import 'package:stepmd/app/modules/notebook/notebook_page.dart';
import 'package:stepmd/app/modules/notes/notes_page.dart';
import 'package:stepmd/app/modules/suporte/suporte_page.dart';
import 'package:stepmd/app/shared/constants.dart';

import '../artigos/artigos_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    InitialPagePage(),
    DbQuestionsPage(),
    FlashcardsPage(),
    NotebookPage(),
    NotesPage(),
    ArtigosPage(),
    DicasPage(),
    SuportePage(),
    ConfiguracaoPage(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
                    color: appColorDeafut,
                    width: 0.5, // Set the border width
                  ),
                ),
                child: Drawer(
                  width: MediaQuery.of(context).size.width * 0.13,
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
                            color: appColorDeafut,
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
                            color: Colors.white,
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
                                const Icon(
                                  Icons.search,
                                  color: appColorDeafut,
                                ),
                                const SizedBox(width: 3),
                                SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Pesquisar',
                                      hintStyle: TextStyle(
                                        color: appColorPrimary,
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
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: appColorDeafut,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 0,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(0);
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.quiz_outlined,
                              color: appColorDeafut,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Banco de questões',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 1,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(1);
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      Visibility(
                        visible: _selectedIndex == 1,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.11,
                                decoration: store.selectedIndexDB == 0
                                    ? ShapeDecoration(
                                        color: Color(0xFFE1F3FF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      )
                                    : const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text(
                                    'Novo teste',
                                    style: TextStyle(
                                      color: appColorPrimary,
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
                            // Update the state of the app
                            store.selectedIndexDB = 0;
                            // Then close the drawer
                          },
                        ),
                      ),
                      Visibility(
                        visible: _selectedIndex == 1,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.11,
                                decoration: store.selectedIndexDB == 1
                                    ? ShapeDecoration(
                                        color: Color(0xFFE1F3FF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      )
                                    : const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text(
                                    'Testes realizados',
                                    style: TextStyle(
                                      color: appColorPrimary,
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
                            // Update the state of the app
                            store.selectedIndexDB = 1;
                            // Then close the drawer
                          },
                        ),
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/flash.svg',
                              color: appColorDeafut,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Flashcards',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 2,
                        onTap: () async {
                          // Update the state of the app
                          _onItemTapped(2);
                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/book.svg',
                              color: appColorDeafut,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Meu caderno',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 3,
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
                              color: appColorDeafut,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Notes',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 4,
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
                              color: appColorDeafut,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Artigos e resumos',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 5,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(5);
                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.lightbulb_outline_sharp,
                              color: appColorDeafut,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Dicas importantes',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 6,
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
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.help_outline_outlined,
                              color: appColorDeafut,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Suporte',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 7,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(7);
                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.settings_rounded,
                              color: appColorDeafut,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Configurações',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 8,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(8);
                          // Then close the drawer
                        },
                      ),
                      ListTile(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.login,
                              color: appColorDeafut,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Log out',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        selected: _selectedIndex == 5,
                        onTap: () {
                          // Update the state of the app
                          _onItemTapped(5);
                          // Then close the drawer
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: _widgetOptions[_selectedIndex]),
            ],
          ),
        ),
      );
    });
  }
}
