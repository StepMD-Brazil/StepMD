import 'dart:convert';

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
    status = AuthStatus.signed_in;
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
  @action
  setUser() async {
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     status = AuthStatus.signed_out;
    //   } else {
    //     status = AuthStatus.signed_in;
    //   }
    // });
    // if (token != null) {
    //   status = AuthStatus.signed_in;
    // } else {
    //   status = AuthStatus.signed_out;
    // }
  }

  signIn(newToken, user, type) async {
    selectedTrunk = 3;
    await Modular.to.pushReplacementNamed('/');
  }

  signout() async {
    status = AuthStatus.signed_out;
    selectedTrunk = 0;

    await Modular.to.pushReplacementNamed('/');
  }

  @action
  void increment() {
    value++;
  }
}
