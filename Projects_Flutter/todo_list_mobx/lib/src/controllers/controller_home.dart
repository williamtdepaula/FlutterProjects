import 'package:mobx/mobx.dart';
import 'package:todo_list_mobx/src/models/item_model.dart';
part 'controller_home.g.dart';

class ControllerHome = _ControllerHomeBase with _$ControllerHome;

abstract class _ControllerHomeBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: 'Teste', checked: true),
    ItemModel(title: '123', checked: false),
    ItemModel(title: 'abc', checked: false),
    ItemModel(title: 'teste123', checked: false)
  ].asObservable();

  @action
  void addItem(ItemModel itemModel) {
    this.listItems.add(itemModel);
  }

  @action
  void removeItem(ItemModel itemModel) {
    this
        .listItems
        .removeWhere((ItemModel item) => item.title == itemModel.title);
  }
}
