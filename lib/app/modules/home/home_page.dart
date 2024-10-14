import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_page.dart';
import 'package:stepmd/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/constants.dart';

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
    // Aqui ao inves do textos vamos chamados os modulos
    const DbQuestionsPage(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 3: blabla',
    ),
    Text(
      'Index 4: blabla',
    ),
    Text(
      'Index 5: blabla',
    ),
  ];

  _onItemTapped(int index) {

    
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.01,
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                  width: 20,
                  height: 20,
                ),
              ),
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
                      color: appColorDeafut,
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
                      color: appColorDeafut,
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
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.flash_on_rounded,
                    color: appColorDeafut,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Flashcards',
                    style: TextStyle(
                      color: appColorDeafut,
                      fontSize: 14,
                      fontFamily: appFont,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu_book,
                    color: appColorDeafut,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Meu caderno',
                    style: TextStyle(
                      color: appColorDeafut,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.note_add_rounded,
                    color: appColorDeafut,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Notes',
                    style: TextStyle(
                      color: appColorDeafut,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.note,
                    color: appColorDeafut,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Artigos e resumos',
                    style: TextStyle(
                      color: appColorDeafut,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.note,
                    color: appColorDeafut,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Artigos e resumos',
                    style: TextStyle(
                      color: appColorDeafut,
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
