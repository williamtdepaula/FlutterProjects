import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  _ItemModelBase({this.title = '', this.checked = false});

  @observable
  String title;

  @action
  setTitle(String value) => this.title = value;

  @observable
  bool checked;

  @action
  setChecked(bool value) => this.checked = value;
}
