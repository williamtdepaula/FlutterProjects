import 'package:flutter_mobx_modular_slidy_firebase/app/shared/repositories/localstorage/local_storage_interface.dart';

class LocalStorageMock implements ILocalStorage {
  List<String> storage;

  @override
  Future delete(String key) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<String>> get(String key) async {
    return storage;
  }

  @override
  Future put(String key, List<String> value) async {
    storage = value;
  }
}
