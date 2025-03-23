import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/shared/constants.dart';
import 'package:flutter/foundation.dart';
import 'dart:html' as html;

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  Future<bool> _fetchDarkModeSetting() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snapshot['tema'] == 'dark';
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // Prevent browser back button
      html.window.history.pushState({}, '', html.window.location.href);

      // Add event listeners to prevent navigation
      html.window.onPopState.listen((event) {
        html.window.history.pushState({}, '', html.window.location.href);
      });

      // Prevent browser refresh and navigation
      html.window.onBeforeUnload.listen((event) {
        event.preventDefault();
      });

      // Add JavaScript to prevent back button and navigation
      const script = '''
        // Prevent browser back button
        window.history.pushState(null, '', window.location.href);
        
        // Override the back button behavior
        window.onpopstate = function(event) {
          window.history.pushState(null, '', window.location.href);
        };
        
        // Prevent browser refresh
        window.addEventListener('beforeunload', function(e) {
          e.preventDefault();
          e.returnValue = '';
          return '';
        });
        
        // Disable browser back button and keyboard shortcuts
        window.addEventListener('keydown', function(e) {
          if (e.key === 'Backspace' || 
              e.key === 'Alt+Left' || 
              (e.ctrlKey && e.key === 'r') ||
              (e.ctrlKey && e.key === 'w') ||
              (e.ctrlKey && e.key === 't') ||
              (e.ctrlKey && e.key === 'n')) {
            e.preventDefault();
            window.history.pushState(null, '', window.location.href);
          }
        });

        // Prevent right-click context menu
        document.addEventListener('contextmenu', function(e) {
          e.preventDefault();
        });

        // Disable browser navigation
        window.addEventListener('hashchange', function(e) {
          e.preventDefault();
          window.history.pushState(null, '', window.location.href);
        });

        // Disable browser back button
        window.addEventListener('popstate', function(e) {
          window.history.pushState(null, '', window.location.href);
        });
      ''';

      // Add the script to the page
      html.document.body?.appendHtml('''
        <script>
          $script
        </script>
      ''');
    }
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');

    return WillPopScope(
      onWillPop: () async {
        if (kIsWeb) {
          html.window.history.pushState({}, '', html.window.location.href);
          return false;
        }
        return true;
      },
      child: FutureBuilder(
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
                scaffoldBackgroundColor: Colors.white,
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
      ),
    );
  }
}
