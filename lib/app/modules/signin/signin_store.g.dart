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

  late final _$phoneAtom =
      Atom(name: '_SigninStoreBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$codeAtom = Atom(name: '_SigninStoreBase.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$verifyPhoneNumberAsyncAction =
      AsyncAction('_SigninStoreBase.verifyPhoneNumber', context: context);

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) {
    return _$verifyPhoneNumberAsyncAction
        .run(() => super.verifyPhoneNumber(phoneNumber));
  }

  late final _$createUserWithPhoneAsyncAction =
      AsyncAction('_SigninStoreBase.createUserWithPhone', context: context);

  @override
  Future<void> createUserWithPhone(String phoneNumber, String smsCode) {
    return _$createUserWithPhoneAsyncAction
        .run(() => super.createUserWithPhone(phoneNumber, smsCode));
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
phone: ${phone},
code: ${code}
    ''';
  }
}
