// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dbQuestions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DbQuestionsStore on _DbQuestionsStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_DbQuestionsStoreBase.value', context: context);

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

  late final _$questionSelectAtom =
      Atom(name: '_DbQuestionsStoreBase.questionSelect', context: context);

  @override
  int get questionSelect {
    _$questionSelectAtom.reportRead();
    return super.questionSelect;
  }

  @override
  set questionSelect(int value) {
    _$questionSelectAtom.reportWrite(value, super.questionSelect, () {
      super.questionSelect = value;
    });
  }

  late final _$questionAnsweredAtom =
      Atom(name: '_DbQuestionsStoreBase.questionAnswered', context: context);

  @override
  bool get questionAnswered {
    _$questionAnsweredAtom.reportRead();
    return super.questionAnswered;
  }

  @override
  set questionAnswered(bool value) {
    _$questionAnsweredAtom.reportWrite(value, super.questionAnswered, () {
      super.questionAnswered = value;
    });
  }

  late final _$setQuestionAsyncAction =
      AsyncAction('_DbQuestionsStoreBase.setQuestion', context: context);

  @override
  Future setQuestion(String questionId, String testId, int timeSpend) {
    return _$setQuestionAsyncAction
        .run(() => super.setQuestion(questionId, testId, timeSpend));
  }

  late final _$_DbQuestionsStoreBaseActionController =
      ActionController(name: '_DbQuestionsStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelect(int index) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.setSelect');
    try {
      return super.setSelect(index);
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleAnswered() {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.toggleAnswered');
    try {
      return super.toggleAnswered();
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
questionSelect: ${questionSelect},
questionAnswered: ${questionAnswered}
    ''';
  }
}
