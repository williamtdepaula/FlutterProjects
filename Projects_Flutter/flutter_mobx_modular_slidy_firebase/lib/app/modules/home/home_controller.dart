import 'package:flutter_mobx_modular_slidy_firebase/app/shared/repositories/localstorage/local_storage_hive.dart';
import 'package:flutter_mobx_modular_slidy_firebase/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ILocalStorage _storageHive = Modular.get<ILocalStorage>();

  _HomeControllerBase() {
    this.init();
  }

  @observable
  String item = '';

  @observable
  ObservableList<String> listItems = <String>[].asObservable();

  @observable
  String filter = '';

  @computed
  List<String> get filteredList {
    if (filter.isEmpty) return listItems;
    return listItems
        .where((String item) => item.contains(this.filter.toLowerCase()))
        .toList();
  }

  @action
  Future init() async {
    List<String> localItems = await this._storageHive.get('list');

    if (localItems != null && localItems.isNotEmpty) {
      listItems = localItems.asObservable();
    }
  }

  @action
  void setItem(String value) => this.item = value;

  @action
  void setFilter(String value) => this.filter = value;

  @action
  void addItem() {
    this.listItems.add(this.item);

    setItem('');

    _storageHive.put(
      'list',
      this.listItems,
    );
  }

  @action
  void removeItem(String value) {
    this.listItems.removeWhere((String item) => item == value);

    _storageHive.put('list', this.listItems);
  }
}
