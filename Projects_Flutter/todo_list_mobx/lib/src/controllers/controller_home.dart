import 'package:mobx/mobx.dart';
import 'package:todo_list_mobx/src/models/item_model.dart';
part 'controller_home.g.dart';

class ControllerHome = _ControllerHomeBase with _$ControllerHome;

abstract class _ControllerHomeBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: 'Estudar', checked: true),
  ].asObservable();

  @observable
  String filter = '';

  @computed
  List<ItemModel> get filteredList {
    if (filter.isEmpty) return listItems;
    return listItems
        .where(
            (ItemModel item) => item.title.contains(this.filter.toLowerCase()))
        .toList();
  }

  @action
  void setFilter(String value) => this.filter = value;

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
