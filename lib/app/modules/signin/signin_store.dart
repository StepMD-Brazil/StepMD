import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:stepmd/app/root/root_store.dart';

part 'signin_store.g.dart';

class SigninStore = _SigninStoreBase with _$SigninStore;

abstract class _SigninStoreBase with Store {
  final RootStore rootStore = Modular.get();

  @observable
  int value = 0;
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  String passwordError = '';
  @observable
  String emailError = '';
  @action
  void increment() {
    value++;
  }

  @action
  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    print('Email: $email');
    print('Password: $password');
    try {
      // Sign in the user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the signed-in user
      User? user = userCredential.user;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get();

      if (!userDoc.exists) {
        print('User does not exist');
        // Create a new document for the user in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .set({
          'userId': user?.uid,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
          'dataBirth': '',
          'imageUrl': '',
          'name': '',
          'gender': '',
          'surname': '',
          'nickname': '',
          'language': '',
          'tema': '',
          'phone': '',
          'fontSize': 0
        });
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        print('User exists');
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-credential':
          errorMessage =
              'As credenciais fornecidas são incorretas, ou ão há usuário correspondente ao email fornecido.';
          break;
        case 'invalid-email':
          errorMessage = 'O endereço de email não é válido.';
          break;
        case 'user-disabled':
          errorMessage =
              'O usuário correspondente ao email fornecido foi desativado.';
          break;
        case 'user-not-found':
          errorMessage = 'Não há usuário correspondente ao email fornecido.';
          break;
        case 'wrong-password':
          errorMessage = 'A senha é inválida para o email fornecido.';
          break;
        default:
          errorMessage = 'Ocorreu um erro indefinido.';
      }
      print('Failed to sign in: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro ao entrar'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Failed to sign in: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro ao entrar'),
            content: Text(
                'Ocorreu um erro ao tentar entrar. Por favor, tente novamente.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @action
  Future<void> createUserWithEmail(String email, String password) async {
    print('criar usuario com email e senha');
    print('Email: $email');
    print('Password: $password');
    try {
      // Create a new user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the signed-in user
      User? user = userCredential.user;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get();

      if (!userDoc.exists) {
        print('User does not exist');
        // Create a new document for the user in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .set({
          'userId': user?.uid,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
          'dataBirth': '',
          'imageUrl': '',
          'name': '',
          'gender': '',
          'surname': '',
          'nickname': '',
          'language': '',
          'tema': '',
          'phone': '',
          'fontSize': 0
        });
        Modular.to.pushReplacementNamed('/home');
      } else {
        print('User exists');
        Modular.to.pushReplacementNamed('/home');
      }
    } catch (e) {
      print('Failed to create user: $e');
    }
  }
}
