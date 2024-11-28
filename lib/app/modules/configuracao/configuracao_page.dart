import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/configuracao/configuracao_store.dart';
import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatefulWidget {
  final String title;
  const ConfiguracaoPage({Key? key, this.title = 'ConfiguracaoPage'}) : super(key: key);
  @override
  ConfiguracaoPageState createState() => ConfiguracaoPageState();
}
class ConfiguracaoPageState extends State<ConfiguracaoPage> {
  final ConfiguracaoStore store = Modular.get();

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