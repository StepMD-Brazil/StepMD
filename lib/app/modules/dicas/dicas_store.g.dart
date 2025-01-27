// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dicas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DicasStore on _DicasStoreBase, Store {
  late final _$questionIdAtom =
      Atom(name: '_DicasStoreBase.questionId', context: context);

  @override
  String get questionId {
    _$questionIdAtom.reportRead();
    return super.questionId;
  }

  @override
  set questionId(String value) {
    _$questionIdAtom.reportWrite(value, super.questionId, () {
      super.questionId = value;
    });
  }

  late final _$disciplinesAtom =
      Atom(name: '_DicasStoreBase.disciplines', context: context);

  @override
  List<String> get disciplines {
    _$disciplinesAtom.reportRead();
    return super.disciplines;
  }

  @override
  set disciplines(List<String> value) {
    _$disciplinesAtom.reportWrite(value, super.disciplines, () {
      super.disciplines = value;
    });
  }

  late final _$tipsStreamAtom =
      Atom(name: '_DicasStoreBase.tipsStream', context: context);

  @override
  ObservableStream<List<Map<String, dynamic>>>? get tipsStream {
    _$tipsStreamAtom.reportRead();
    return super.tipsStream;
  }

  @override
  set tipsStream(ObservableStream<List<Map<String, dynamic>>>? value) {
    _$tipsStreamAtom.reportWrite(value, super.tipsStream, () {
      super.tipsStream = value;
    });
  }

  late final _$_DicasStoreBaseActionController =
      ActionController(name: '_DicasStoreBase', context: context);

  @override
  void fetchTips() {
    final _$actionInfo = _$_DicasStoreBaseActionController.startAction(
        name: '_DicasStoreBase.fetchTips');
    try {
      return super.fetchTips();
    } finally {
      _$_DicasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuestionId(String newQuestion) {
    final _$actionInfo = _$_DicasStoreBaseActionController.startAction(
        name: '_DicasStoreBase.setQuestionId');
    try {
      return super.setQuestionId(newQuestion);
    } finally {
      _$_DicasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
questionId: ${questionId},
disciplines: ${disciplines},
tipsStream: ${tipsStream}
    ''';
  }
}
