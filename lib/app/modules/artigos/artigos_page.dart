import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/artigos/artigos_store.dart';
import 'package:flutter/material.dart';

class ArtigosPage extends StatefulWidget {
  final String title;
  const ArtigosPage({Key? key, this.title = 'ArtigosPage'}) : super(key: key);
  @override
  ArtigosPageState createState() => ArtigosPageState();
}
class ArtigosPageState extends State<ArtigosPage> {
  final ArtigosStore store = Modular.get();

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