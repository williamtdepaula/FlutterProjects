import 'dart:async';

class SimpleStream<T>{
  StreamController streamController = new StreamController<T>();

  Stream<T> get stream => streamController.stream;

  addToStream(T value){
    streamController.add(value);
  }

  addErrorToStream(T value){
    streamController.addError(value);
  }

  dispose(){
    streamController.close();
  }
}