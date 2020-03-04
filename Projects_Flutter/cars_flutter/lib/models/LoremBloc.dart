import 'dart:async';

import 'package:cars_flutter/models/SimpleBloc.dart';
import 'package:cars_flutter/utils/Api.dart';

class LoremBloc {
  static String lorimCache;

  StreamController _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;

  Future<String> getLorem() async {
    String lorem = lorimCache ?? await Api.getLorem();

    lorimCache = lorem;

    _streamController.add(lorem);
  }

  clearStreams() {
    _streamController.close();
  }
}
