import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/db_questions/dbQuestions_store.dart';
import 'package:flutter/material.dart';

class DbQuestionsPage extends StatefulWidget {
  final String title;
  const DbQuestionsPage({Key? key, this.title = 'DbQuestionsPage'}) : super(key: key);
  @override
  DbQuestionsPageState createState() => DbQuestionsPageState();
}
class DbQuestionsPageState extends State<DbQuestionsPage> {
  final DbQuestionsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}