// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on _NotesStoreBase, Store {
  late final _$notesListAtom =
      Atom(name: '_NotesStoreBase.notesList', context: context);

  @override
  ObservableList<Map<String, dynamic>> get notesList {
    _$notesListAtom.reportRead();
    return super.notesList;
  }

  @override
  set notesList(ObservableList<Map<String, dynamic>> value) {
    _$notesListAtom.reportWrite(value, super.notesList, () {
      super.notesList = value;
    });
  }

  late final _$fetchNotesAsyncAction =
      AsyncAction('_NotesStoreBase.fetchNotes', context: context);

  @override
  Future<void> fetchNotes(String questionId) {
    return _$fetchNotesAsyncAction.run(() => super.fetchNotes(questionId));
  }

  @override
  String toString() {
    return '''
notesList: ${notesList}
    ''';
  }
}
