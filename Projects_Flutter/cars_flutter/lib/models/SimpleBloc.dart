import 'dart:async';

class SimpleBloc<T>{
  StreamController _streamController = StreamController<T>();

  Stream<T> get stream => _streamController.stream;

  void add(T object){
    _streamController.add(object);
  }

  void addError(Object error){
    _streamController.addError(error);
  }

  void clearStream(){
    _streamController.close();
  }
}