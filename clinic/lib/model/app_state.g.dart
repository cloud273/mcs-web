// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppState on AppStateBase, Store {
  final _$isLoggedAtom = Atom(name: 'AppStateBase.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$currentPageAtom = Atom(name: 'AppStateBase.currentPage');

  @override
  AppPage get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(AppPage value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$AppStateBaseActionController = ActionController(name: 'AppStateBase');

  @override
  void login() {
    final _$actionInfo =
        _$AppStateBaseActionController.startAction(name: 'AppStateBase.login');
    try {
      return super.login();
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo =
        _$AppStateBaseActionController.startAction(name: 'AppStateBase.logout');
    try {
      return super.logout();
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(AppPage page) {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.setPage');
    try {
      return super.setPage(page);
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogged: ${isLogged},
currentPage: ${currentPage}
    ''';
  }
}
