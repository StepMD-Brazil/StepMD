import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:stepmd/app/modules/artigos/artigos_page.dart';
import 'package:stepmd/app/modules/configuracao/configuracao_page.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_page.dart';
import 'package:stepmd/app/modules/dicas/dicas_page.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_page.dart';
import 'package:stepmd/app/modules/initialPage/initialPage_page.dart';
import 'package:stepmd/app/modules/notebook/notebook_page.dart';
import 'package:stepmd/app/modules/notes/notes_page.dart';
import 'package:stepmd/app/modules/suporte/suporte_page.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  int value = 0;
  @observable
  int? selectedIndexDB;
  @observable
  int? selectedIndex;
  @observable
  List<Widget> widgetOptions = <Widget>[
    const InitialPagePage(),
    const DbQuestionsPage(),
    const FlashcardsPage(),
    const NotebookPage(),
    const NotesPage(),
    const ArtigosPage(),
    const DicasPage(),
    const SuportePage(),
    const ConfiguracaoPage(),
  ];
  @action
  void increment() {
    value++;
  }
}
