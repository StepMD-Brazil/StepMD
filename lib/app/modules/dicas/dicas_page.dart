import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/dicas/dicas_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/constants.dart';

class DicasPage extends StatefulWidget {
  final String title;
  const DicasPage({Key? key, this.title = 'DicasPage'}) : super(key: key);
  @override
  DicasPageState createState() => DicasPageState();
}

class DicasPageState extends State<DicasPage> {
  final DicasStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Dicas',
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
