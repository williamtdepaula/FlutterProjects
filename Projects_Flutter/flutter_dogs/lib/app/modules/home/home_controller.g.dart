// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(dogsRepository: i<DogsRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$breedsAtom = Atom(name: '_HomeControllerBase.breeds');

  @override
  ObservableList<Breed> get breeds {
    _$breedsAtom.reportRead();
    return super.breeds;
  }

  @override
  set breeds(ObservableList<Breed> value) {
    _$breedsAtom.reportWrite(value, super.breeds, () {
      super.breeds = value;
    });
  }

  final _$onLoadWidgetAsyncAction =
      AsyncAction('_HomeControllerBase.onLoadWidget');

  @override
  Future<dynamic> onLoadWidget() {
    return _$onLoadWidgetAsyncAction.run(() => super.onLoadWidget());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
breeds: ${breeds}
    ''';
  }
}
