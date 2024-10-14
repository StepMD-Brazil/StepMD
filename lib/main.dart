import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garante que o binding do Flutter esteja pronto.
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB-AUxlEBBUIl5Hsqs82p-V2v9o1tfZIbw",
          authDomain: "stepmd-ebcd9.firebaseapp.com",
          projectId: "stepmd-ebcd9",
          storageBucket: "stepmd-ebcd9.appspot.com",
          messagingSenderId: "562194623173",
          appId: "1:562194623173:web:a2fcbb97b40a7bb66d5eac",
          measurementId: "G-FNB4FM5CWM"));

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
