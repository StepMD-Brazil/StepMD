import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/initialPage/initialPage_store.dart';
import 'package:flutter/material.dart';

class InitialPagePage extends StatefulWidget {
  final String title;
  const InitialPagePage({Key? key, this.title = 'InitialPagePage'}) : super(key: key);
  @override
  InitialPagePageState createState() => InitialPagePageState();
}
class InitialPagePageState extends State<InitialPagePage> {
  final InitialPageStore store = Modular.get();

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