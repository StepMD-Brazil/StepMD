// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninStore on _SigninStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_SigninStoreBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_SigninStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SigninStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_SigninStoreBase.passwordError', context: context);

  @override
  String get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: '_SigninStoreBase.emailError', context: context);

  @override
  String get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$signInWithEmailAsyncAction =
      AsyncAction('_SigninStoreBase.signInWithEmail', context: context);

  @override
  Future<void> signInWithEmail(
      String email, String password, BuildContext context) {
    return _$signInWithEmailAsyncAction
        .run(() => super.signInWithEmail(email, password, context));
  }

  late final _$createUserWithEmailAsyncAction =
      AsyncAction('_SigninStoreBase.createUserWithEmail', context: context);

  @override
  Future<void> createUserWithEmail(String email, String password) {
    return _$createUserWithEmailAsyncAction
        .run(() => super.createUserWithEmail(email, password));
  }

  late final _$_SigninStoreBaseActionController =
      ActionController(name: '_SigninStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_SigninStoreBaseActionController.startAction(
        name: '_SigninStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SigninStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
email: ${email},
password: ${password},
passwordError: ${passwordError},
emailError: ${emailError}
    ''';
  }
}
