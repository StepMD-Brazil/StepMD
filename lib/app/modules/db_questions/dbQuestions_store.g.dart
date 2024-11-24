// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dbQuestions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DbQuestionsStore on _DbQuestionsStoreBase, Store {
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

  late final _$countAnsweredsAtom =
      Atom(name: '_DbQuestionsStoreBase.countAnswereds', context: context);

  @override
  int get countAnswereds {
    _$countAnsweredsAtom.reportRead();
    return super.countAnswereds;
  }

  @override
  set countAnswereds(int value) {
    _$countAnsweredsAtom.reportWrite(value, super.countAnswereds, () {
      super.countAnswereds = value;
    });
  }

  late final _$testModeAtom =
      Atom(name: '_DbQuestionsStoreBase.testMode', context: context);

  @override
  String get testMode {
    _$testModeAtom.reportRead();
    return super.testMode;
  }

  @override
  set testMode(String value) {
    _$testModeAtom.reportWrite(value, super.testMode, () {
      super.testMode = value;
    });
  }

  late final _$testModelAtom =
      Atom(name: '_DbQuestionsStoreBase.testModel', context: context);

  @override
  String get testModel {
    _$testModelAtom.reportRead();
    return super.testModel;
  }

  @override
  set testModel(String value) {
    _$testModelAtom.reportWrite(value, super.testModel, () {
      super.testModel = value;
    });
  }

  late final _$questionIDsAtom =
      Atom(name: '_DbQuestionsStoreBase.questionIDs', context: context);

  @override
  String get questionIDs {
    _$questionIDsAtom.reportRead();
    return super.questionIDs;
  }

  @override
  set questionIDs(String value) {
    _$questionIDsAtom.reportWrite(value, super.questionIDs, () {
      super.questionIDs = value;
    });
  }

  late final _$questionsAtom =
      Atom(name: '_DbQuestionsStoreBase.questions', context: context);

  @override
  List<dynamic> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(List<dynamic> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
    });
  }

  late final _$questionsStreamAtom =
      Atom(name: '_DbQuestionsStoreBase.questionsStream', context: context);

  @override
  ObservableStream<List<Map<dynamic, dynamic>>>? get questionsStream {
    _$questionsStreamAtom.reportRead();
    return super.questionsStream;
  }

  @override
  set questionsStream(ObservableStream<List<Map<dynamic, dynamic>>>? value) {
    _$questionsStreamAtom.reportWrite(value, super.questionsStream, () {
      super.questionsStream = value;
    });
  }

  late final _$answersAtom =
      Atom(name: '_DbQuestionsStoreBase.answers', context: context);

  @override
  ObservableList<Map<dynamic, dynamic>> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(ObservableList<Map<dynamic, dynamic>> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  late final _$finishTestAsyncAction =
      AsyncAction('_DbQuestionsStoreBase.finishTest', context: context);

  @override
  Future finishTest() {
    return _$finishTestAsyncAction.run(() => super.finishTest());
  }

  late final _$_DbQuestionsStoreBaseActionController =
      ActionController(name: '_DbQuestionsStoreBase', context: context);

  @override
  void setAnswer(int index, int value, int indexOption) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.setAnswer');
    try {
      return super.setAnswer(index, value, indexOption);
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchQuestionsByIdsAsStream(List<String> questionIds) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.fetchQuestionsByIdsAsStream');
    try {
      return super.fetchQuestionsByIdsAsStream(questionIds);
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void splitQuestions(String IDs) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.splitQuestions');
    try {
      return super.splitQuestions(IDs);
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fillAnswers(List<Map<dynamic, dynamic>> questions) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.fillAnswers');
    try {
      return super.fillAnswers(questions);
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
  void setTestMode(String mode) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.setTestMode');
    try {
      return super.setTestMode(mode);
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTestModel(String model) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.setTestModel');
    try {
      return super.setTestModel(model);
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuestionIDs(String IDs) {
    final _$actionInfo = _$_DbQuestionsStoreBaseActionController.startAction(
        name: '_DbQuestionsStoreBase.setQuestionIDs');
    try {
      return super.setQuestionIDs(IDs);
    } finally {
      _$_DbQuestionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
questionSelect: ${questionSelect},
seconds: ${seconds},
minutes: ${minutes},
hours: ${hours},
timeIsRunning: ${timeIsRunning},
countAnswereds: ${countAnswereds},
testMode: ${testMode},
testModel: ${testModel},
questionIDs: ${questionIDs},
questions: ${questions},
questionsStream: ${questionsStream},
answers: ${answers}
    ''';
  }
}
