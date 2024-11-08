import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'firebase_options.dart';

import 'app/app_module.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garante que o binding do Flutter esteja pronto.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
