import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_store.dart';
import 'package:flutter/material.dart';

class FlashcardsPage extends StatefulWidget {
  final String title;
  const FlashcardsPage({Key? key, this.title = 'FlashcardsPage'}) : super(key: key);
  @override
  FlashcardsPageState createState() => FlashcardsPageState();
}
class FlashcardsPageState extends State<FlashcardsPage> {
  final FlashcardsStore store = Modular.get();

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