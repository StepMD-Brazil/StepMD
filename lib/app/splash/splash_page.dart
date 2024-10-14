import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:stepmd/app/modules/home/home_page.dart';
import 'package:stepmd/app/shared/utils/auth_status_enum.dart';
import 'package:stepmd/app/splash/splash_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  ReactionDisposer? disposer;

  @override
  void initState() {
    super.initState();

    disposer = autorun(
      (_) async {
        if (store.status == AuthStatus.signed_in) {
          store.setSelectedTrunk(2);
        } else if (store.status == AuthStatus.signed_out) {
          store.setSelectedTrunk(1);
        }
      },
    );
  }

  List<Widget> trunkModule = [
    const SplashPage(),
    const HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: trunkModule[store.selectedTrunk]));
  }
}
