// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemModel on _ItemModelBase, Store {
  final _$titleAtom = Atom(name: '_ItemModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$checkedAtom = Atom(name: '_ItemModelBase.checked');

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  final _$_ItemModelBaseActionController =
      ActionController(name: '_ItemModelBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChecked(bool value) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.setChecked');
    try {
      return super.setChecked(value);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
checked: ${checked}
    ''';
  }
}
