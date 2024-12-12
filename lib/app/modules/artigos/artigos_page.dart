import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/artigos/artigos_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/constants.dart';

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
        backgroundColor: Colors.white,
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Color(0xFF957B0B),
            fontSize: 20,
            fontFamily: appFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
