import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/notes/notes_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/constants.dart';

class NotesPage extends StatefulWidget {
  final String title;
  const NotesPage({Key? key, this.title = 'NotesPage'}) : super(key: key);
  @override
  NotesPageState createState() => NotesPageState();
}

class NotesPageState extends State<NotesPage> {
  final NotesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
        
          Column(
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}
