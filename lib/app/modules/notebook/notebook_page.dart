import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/notebook/notebook_store.dart';
import 'package:flutter/material.dart';

class NotebookPage extends StatefulWidget {
  final String title;
  const NotebookPage({Key? key, this.title = 'NotebookPage'}) : super(key: key);
  @override
  NotebookPageState createState() => NotebookPageState();
}
class NotebookPageState extends State<NotebookPage> {
  final NotebookStore store = Modular.get();

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