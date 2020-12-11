import 'dart:async';
import 'dart:io';

import 'package:flutter_mobx_modular_slidy_firebase/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageHive implements ILocalStorage {
  Completer<Box> _instance = Completer<Box>();

  LocalStorageHive() {
    init();
  }

  Future<void> init() async {
    Directory dir = await getApplicationDocumentsDirectory();

    Hive.init(dir.path);

    Box box = await Hive.openBox('db');

    _instance.complete(box);
  }

  @override
  Future delete(String key) async {
    Box box = await _instance.future;

    box.delete(key);
  }

  @override
  Future<List<String>> get(String key) async {
    Box box = await _instance.future;

    return box.get(key);
  }

  @override
  Future put(String key, List<String> value) async {
    Box box = await _instance.future;

    await box.put(key, value);
  }
}
