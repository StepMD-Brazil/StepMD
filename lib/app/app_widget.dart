import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/shared/constants.dart';

class AppWidget extends StatelessWidget {
  Future<bool> _fetchDarkModeSetting() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snapshot['tema'] == 'dark';
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');

    return FutureBuilder(
      future: _fetchDarkModeSetting(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mostra um indicador de carregamento enquanto espera pela resposta
          return const CircularProgressIndicator();
        } else {
          // Usa o valor retornado para definir o tema
          bool isDarkMode = snapshot.data ?? false;

          return MaterialApp.router(
            title: 'StepMD',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              hintColor: const Color(0xFF051333),
              useMaterial3: false,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: const Color(0xFFE2C02F),
              hintColor: Colors.white,
              scaffoldBackgroundColor: Colors.grey[900],
            ),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            routerDelegate: Modular.routerDelegate,
            routeInformationParser: Modular.routeInformationParser,
          );
        }
      },
    );
  }
}
