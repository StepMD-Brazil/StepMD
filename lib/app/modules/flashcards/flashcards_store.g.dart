// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcards_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FlashcardsStore on _FlashcardsStoreBase, Store {
  late final _$timeAtom =
      Atom(name: '_FlashcardsStoreBase.time', context: context);

  @override
  int get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(int value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$secondsAtom =
      Atom(name: '_FlashcardsStoreBase.seconds', context: context);

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
      Atom(name: '_FlashcardsStoreBase.minutes', context: context);

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
      Atom(name: '_FlashcardsStoreBase.hours', context: context);

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

  late final _$countAnsweredsAtom =
      Atom(name: '_FlashcardsStoreBase.countAnswereds', context: context);

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

  late final _$timeIsRunningAtom =
      Atom(name: '_FlashcardsStoreBase.timeIsRunning', context: context);

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

  late final _$categoryIdAtom =
      Atom(name: '_FlashcardsStoreBase.categoryId', context: context);

  @override
  String get categoryId {
    _$categoryIdAtom.reportRead();
    return super.categoryId;
  }

  @override
  set categoryId(String value) {
    _$categoryIdAtom.reportWrite(value, super.categoryId, () {
      super.categoryId = value;
    });
  }

  late final _$cardSelectAtom =
      Atom(name: '_FlashcardsStoreBase.cardSelect', context: context);

  @override
  int get cardSelect {
    _$cardSelectAtom.reportRead();
    return super.cardSelect;
  }

  @override
  set cardSelect(int value) {
    _$cardSelectAtom.reportWrite(value, super.cardSelect, () {
      super.cardSelect = value;
    });
  }

  late final _$countStudiesAtom =
      Atom(name: '_FlashcardsStoreBase.countStudies', context: context);

  @override
  int get countStudies {
    _$countStudiesAtom.reportRead();
    return super.countStudies;
  }

  @override
  set countStudies(int value) {
    _$countStudiesAtom.reportWrite(value, super.countStudies, () {
      super.countStudies = value;
    });
  }

  late final _$uniqueFlashcardsCountAtom = Atom(
      name: '_FlashcardsStoreBase.uniqueFlashcardsCount', context: context);

  @override
  int get uniqueFlashcardsCount {
    _$uniqueFlashcardsCountAtom.reportRead();
    return super.uniqueFlashcardsCount;
  }

  @override
  set uniqueFlashcardsCount(int value) {
    _$uniqueFlashcardsCountAtom.reportWrite(value, super.uniqueFlashcardsCount,
        () {
      super.uniqueFlashcardsCount = value;
    });
  }

  late final _$disciplineIdsAtom =
      Atom(name: '_FlashcardsStoreBase.disciplineIds', context: context);

  @override
  List<String> get disciplineIds {
    _$disciplineIdsAtom.reportRead();
    return super.disciplineIds;
  }

  @override
  set disciplineIds(List<String> value) {
    _$disciplineIdsAtom.reportWrite(value, super.disciplineIds, () {
      super.disciplineIds = value;
    });
  }

  late final _$cardsAtom =
      Atom(name: '_FlashcardsStoreBase.cards', context: context);

  @override
  List<dynamic> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(List<dynamic> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$timeFormatAtom =
      Atom(name: '_FlashcardsStoreBase.timeFormat', context: context);

  @override
  String get timeFormat {
    _$timeFormatAtom.reportRead();
    return super.timeFormat;
  }

  @override
  set timeFormat(String value) {
    _$timeFormatAtom.reportWrite(value, super.timeFormat, () {
      super.timeFormat = value;
    });
  }

  late final _$cardsStreamAtom =
      Atom(name: '_FlashcardsStoreBase.cardsStream', context: context);

  @override
  ObservableStream<List<Map<dynamic, dynamic>>>? get cardsStream {
    _$cardsStreamAtom.reportRead();
    return super.cardsStream;
  }

  @override
  set cardsStream(ObservableStream<List<Map<dynamic, dynamic>>>? value) {
    _$cardsStreamAtom.reportWrite(value, super.cardsStream, () {
      super.cardsStream = value;
    });
  }

  late final _$answersAtom =
      Atom(name: '_FlashcardsStoreBase.answers', context: context);

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

  late final _$checkedCategoriesAtom =
      Atom(name: '_FlashcardsStoreBase.checkedCategories', context: context);

  @override
  ObservableList<String> get checkedCategories {
    _$checkedCategoriesAtom.reportRead();
    return super.checkedCategories;
  }

  @override
  set checkedCategories(ObservableList<String> value) {
    _$checkedCategoriesAtom.reportWrite(value, super.checkedCategories, () {
      super.checkedCategories = value;
    });
  }

  late final _$getCountStudiesAsyncAction =
      AsyncAction('_FlashcardsStoreBase.getCountStudies', context: context);

  @override
  Future getCountStudies() {
    return _$getCountStudiesAsyncAction.run(() => super.getCountStudies());
  }

  late final _$finishFlashcardsAsyncAction =
      AsyncAction('_FlashcardsStoreBase.finishFlashcards', context: context);

  @override
  Future finishFlashcards() {
    return _$finishFlashcardsAsyncAction.run(() => super.finishFlashcards());
  }

  late final _$resetAsyncAction =
      AsyncAction('_FlashcardsStoreBase.reset', context: context);

  @override
  Future<dynamic> reset() {
    return _$resetAsyncAction.run(() => super.reset());
  }

  late final _$_FlashcardsStoreBaseActionController =
      ActionController(name: '_FlashcardsStoreBase', context: context);

  @override
  void fetchcardsByIdsAsStream(List<String> disciplineIds) {
    final _$actionInfo = _$_FlashcardsStoreBaseActionController.startAction(
        name: '_FlashcardsStoreBase.fetchcardsByIdsAsStream');
    try {
      return super.fetchcardsByIdsAsStream(disciplineIds);
    } finally {
      _$_FlashcardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fillAnswers(List<Map<dynamic, dynamic>> flashcards) {
    final _$actionInfo = _$_FlashcardsStoreBaseActionController.startAction(
        name: '_FlashcardsStoreBase.fillAnswers');
    try {
      return super.fillAnswers(flashcards);
    } finally {
      _$_FlashcardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnswer(int index, int difficulty) {
    final _$actionInfo = _$_FlashcardsStoreBaseActionController.startAction(
        name: '_FlashcardsStoreBase.setAnswer');
    try {
      return super.setAnswer(index, difficulty);
    } finally {
      _$_FlashcardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startCounter() {
    final _$actionInfo = _$_FlashcardsStoreBaseActionController.startAction(
        name: '_FlashcardsStoreBase.startCounter');
    try {
      return super.startCounter();
    } finally {
      _$_FlashcardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopCounter() {
    final _$actionInfo = _$_FlashcardsStoreBaseActionController.startAction(
        name: '_FlashcardsStoreBase.stopCounter');
    try {
      return super.stopCounter();
    } finally {
      _$_FlashcardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelect(int index) {
    final _$actionInfo = _$_FlashcardsStoreBaseActionController.startAction(
        name: '_FlashcardsStoreBase.setSelect');
    try {
      return super.setSelect(index);
    } finally {
      _$_FlashcardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCategory(String categoryName) {
    final _$actionInfo = _$_FlashcardsStoreBaseActionController.startAction(
        name: '_FlashcardsStoreBase.toggleCategory');
    try {
      return super.toggleCategory(categoryName);
    } finally {
      _$_FlashcardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
time: ${time},
seconds: ${seconds},
minutes: ${minutes},
hours: ${hours},
countAnswereds: ${countAnswereds},
timeIsRunning: ${timeIsRunning},
categoryId: ${categoryId},
cardSelect: ${cardSelect},
countStudies: ${countStudies},
uniqueFlashcardsCount: ${uniqueFlashcardsCount},
disciplineIds: ${disciplineIds},
cards: ${cards},
timeFormat: ${timeFormat},
cardsStream: ${cardsStream},
answers: ${answers},
checkedCategories: ${checkedCategories}
    ''';
  }
}
