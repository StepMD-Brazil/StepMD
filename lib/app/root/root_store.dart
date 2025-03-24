import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../shared/utils/auth_status_enum.dart';

part 'root_store.g.dart';

class RootStore = _RootStoreBase with _$RootStore;

abstract class _RootStoreBase with Store {
  // final HomeStore verifyStore = Modular.get();
  _RootStoreBase() {
    setUser();
  }

  @observable
  int value = 0;
  @observable
  int selectedTrunk = 0;

  // @computed
  PageStorageBucket? bucketGlobal;
  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  Map<String, dynamic>? login;

  @action
  setBucket(PageStorageBucket bck) => bucketGlobal = bck;

  @action
  setSelectedTrunk(int value) => selectedTrunk = value;

  @action
  setUser() async {
    // User? user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   final userDoc = await FirebaseFirestore.instance
    //       .collection('users')
    //       .doc(user.uid)
    //       .get();
    //   if (!userDoc.exists) {
    //     status = AuthStatus.signed_in;
    //     selectedTrunk = 1;
    //   } else {
    //     status = AuthStatus.signed_in;

    //     selectedTrunk = 0;
    //   }
    // } else {
    //   status = AuthStatus.signed_in;

    //   selectedTrunk = 0;
    // }
  }

  signIn(newToken, user, type) async {
    selectedTrunk = 3;
    await Modular.to.pushReplacementNamed('/');
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
    status = AuthStatus.signed_out;
    selectedTrunk = 0;
    await Modular.to.pushReplacementNamed('/signin');
  }

  @action
  void increment() {
    value++;
  }
}
