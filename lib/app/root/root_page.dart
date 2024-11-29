import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/modules/home/home_page.dart';

import 'package:stepmd/app/root/root_store.dart';

import '../modules/signin/signin_page.dart';
import '../splash/splash_page.dart';

class RootPage extends StatefulWidget {
  final String title;
  const RootPage({Key? key, this.title = 'RootPage'}) : super(key: key);
  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  RootStore store = Modular.get();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.setBucket(PageStorageBucket());
    });
    super.initState();
  }

  List<Widget> trunkModule = [
    const SigninPage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          // backgroundColor: ThemeConecta().backgroundColor,
          body: Observer(builder: (_) {
        return trunkModule[store.selectedTrunk];
      })),
    );
  }
}
