import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:stepmd/app/modules/home/home_page.dart';
import 'package:stepmd/app/root/root_store.dart';
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
  final RootStore rootStore = Modular.get();

  ReactionDisposer? disposer;

  @override
  void initState() {
    super.initState();

    disposer = autorun(
      (_) async {
        print(rootStore.status);
        if (rootStore.status == AuthStatus.signed_in) {
          rootStore.setSelectedTrunk(2);
        } else if (rootStore.status == AuthStatus.signed_out) {
          rootStore.setSelectedTrunk(0);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.black45,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(80)),
                      border: Border.all(
                          width: 3,
                          color: Colors.white,
                          style: BorderStyle.solid)),
                  child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    ));
  }
}
