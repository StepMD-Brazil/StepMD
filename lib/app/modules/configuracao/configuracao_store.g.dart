// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfiguracaoStore on _ConfiguracaoStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_ConfiguracaoStoreBase.value', context: context);

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

  late final _$fontSizeAtom =
      Atom(name: '_ConfiguracaoStoreBase.fontSize', context: context);

  @override
  int get fontSize {
    _$fontSizeAtom.reportRead();
    return super.fontSize;
  }

  @override
  set fontSize(int value) {
    _$fontSizeAtom.reportWrite(value, super.fontSize, () {
      super.fontSize = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_ConfiguracaoStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$birthDateAtom =
      Atom(name: '_ConfiguracaoStoreBase.birthDate', context: context);

  @override
  String get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(String value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_ConfiguracaoStoreBase.email', context: context);

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

  late final _$nicknameAtom =
      Atom(name: '_ConfiguracaoStoreBase.nickname', context: context);

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  late final _$temaAtom =
      Atom(name: '_ConfiguracaoStoreBase.tema', context: context);

  @override
  String get tema {
    _$temaAtom.reportRead();
    return super.tema;
  }

  @override
  set tema(String value) {
    _$temaAtom.reportWrite(value, super.tema, () {
      super.tema = value;
    });
  }

  @override
  String toString() {
    return '''
value: ${value},
fontSize: ${fontSize},
name: ${name},
birthDate: ${birthDate},
email: ${email},
nickname: ${nickname},
tema: ${tema}
    ''';
  }
}
