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

  late final _$secondsAtom =
      Atom(name: '_DbQuestionsStoreBase.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  late final _$minutesAtom =
      Atom(name: '_DbQuestionsStoreBase.minutes', context: context);

  @override
  int get minutes {
    _$minutesAtom.reportRead();
    return super.minutes;
  }

  @override
  set minutes(int value) {
    _$minutesAtom.reportWrite(value, super.minutes, () {
      super.minutes = value;
    });
  }

  late final _$hoursAtom =
      Atom(name: '_DbQuestionsStoreBase.hours', context: context);

  @override
  int get hours {
    _$hoursAtom.reportRead();
    return super.hours;
  }

  @override
  set hours(int value) {
    _$hoursAtom.reportWrite(value, super.hours, () {
      super.hours = value;
    });
  }

  late final _$timeIsRunningAtom =
      Atom(name: '_DbQuestionsStoreBase.timeIsRunning', context: context);

  @override
  bool get timeIsRunning {
    _$timeIsRunningAtom.reportRead();
    return super.timeIsRunning;
  }

  @override
  set timeIsRunning(bool value) {
    _$timeIsRunningAtom.reportWrite(value, super.timeIsRunning, () {
      super.timeIsRunning = value;
    });
  }

  late final _$answersAtom =
      Atom(name: '_DbQuestionsStoreBase.answers', context: context);

  @override
  List<List<int>> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(List<List<int>> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
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
  void setAnswer(dynamic index, dynamic value, dynamic indexAnswer) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.setAnswer');
    try {
      return super.setAnswer(index, value, indexAnswer);
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startCounter() {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.startCounter');
    try {
      return super.startCounter();
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopCounter() {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.stopCounter');
    try {
      return super.stopCounter();
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
questionAnswered: ${questionAnswered},
seconds: ${seconds},
minutes: ${minutes},
hours: ${hours},
timeIsRunning: ${timeIsRunning},
answers: ${answers}
    ''';
  }
}
