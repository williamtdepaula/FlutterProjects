// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerHome on _ControllerHomeBase, Store {
  Computed<List<ItemModel>> _$filteredListComputed;

  @override
  List<ItemModel> get filteredList => (_$filteredListComputed ??=
          Computed<List<ItemModel>>(() => super.filteredList,
              name: '_ControllerHomeBase.filteredList'))
      .value;

  final _$listItemsAtom = Atom(name: '_ControllerHomeBase.listItems');

  @override
  ObservableList<ItemModel> get listItems {
    _$listItemsAtom.reportRead();
    return super.listItems;
  }

  @override
  set listItems(ObservableList<ItemModel> value) {
    _$listItemsAtom.reportWrite(value, super.listItems, () {
      super.listItems = value;
    });
  }

  final _$filterAtom = Atom(name: '_ControllerHomeBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$_ControllerHomeBaseActionController =
      ActionController(name: '_ControllerHomeBase');

  @override
  void setFilter(String value) {
    final _$actionInfo = _$_ControllerHomeBaseActionController.startAction(
        name: '_ControllerHomeBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(ItemModel itemModel) {
    final _$actionInfo = _$_ControllerHomeBaseActionController.startAction(
        name: '_ControllerHomeBase.addItem');
    try {
      return super.addItem(itemModel);
    } finally {
      _$_ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(ItemModel itemModel) {
    final _$actionInfo = _$_ControllerHomeBaseActionController.startAction(
        name: '_ControllerHomeBase.removeItem');
    try {
      return super.removeItem(itemModel);
    } finally {
      _$_ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItems: ${listItems},
filter: ${filter},
filteredList: ${filteredList}
    ''';
  }
}
