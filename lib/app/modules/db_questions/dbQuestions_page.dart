import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/modules/home/home_store.dart';

import '../../shared/components/novoTeste.dart';
import '../../shared/components/testeRealizados.dart';
import '../../shared/constants.dart';

class DbQuestionsPage extends StatefulWidget {
  final String title;
  const DbQuestionsPage({Key? key, this.title = 'DbQuestionsPage'})
      : super(key: key);
  @override
  DbQuestionsPageState createState() => DbQuestionsPageState();
}

class DbQuestionsPageState extends State<DbQuestionsPage> {
  final DbQuestionsStore store = Modular.get();
  final HomeStore homeStore = Modular.get();

  static final List<Widget> _widgetOptions = <Widget>[
    NovoTeste(),
    TestesRealizados()
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
          body: Center(child: _widgetOptions[homeStore.selectedIndexDB ?? 0]));
    });
  }
}
