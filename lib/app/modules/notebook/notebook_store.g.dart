// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notebook_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotebookStore on _NotebookStoreBase, Store {
  late final _$pagesAtom =
      Atom(name: '_NotebookStoreBase.pages', context: context);

  @override
  ObservableList<NotebookPageModel> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(ObservableList<NotebookPageModel> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  late final _$selectedPageAtom =
      Atom(name: '_NotebookStoreBase.selectedPage', context: context);

  @override
  NotebookPageModel? get selectedPage {
    _$selectedPageAtom.reportRead();
    return super.selectedPage;
  }

  @override
  set selectedPage(NotebookPageModel? value) {
    _$selectedPageAtom.reportWrite(value, super.selectedPage, () {
      super.selectedPage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_NotebookStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addPageAsyncAction =
      AsyncAction('_NotebookStoreBase.addPage', context: context);

  @override
  Future<void> addPage(String title, String content) {
    return _$addPageAsyncAction.run(() => super.addPage(title, content));
  }

  late final _$updatePageAsyncAction =
      AsyncAction('_NotebookStoreBase.updatePage', context: context);

  @override
  Future<void> updatePage(String id, String newContent) {
    return _$updatePageAsyncAction.run(() => super.updatePage(id, newContent));
  }

  late final _$_NotebookStoreBaseActionController =
      ActionController(name: '_NotebookStoreBase', context: context);

  @override
  void loadPages() {
    final _$actionInfo = _$_NotebookStoreBaseActionController.startAction(
        name: '_NotebookStoreBase.loadPages');
    try {
      return super.loadPages();
    } finally {
      _$_NotebookStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedPage(NotebookPageModel page) {
    final _$actionInfo = _$_NotebookStoreBaseActionController.startAction(
        name: '_NotebookStoreBase.setSelectedPage');
    try {
      return super.setSelectedPage(page);
    } finally {
      _$_NotebookStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pages: ${pages},
selectedPage: ${selectedPage},
isLoading: ${isLoading}
    ''';
  }
}
