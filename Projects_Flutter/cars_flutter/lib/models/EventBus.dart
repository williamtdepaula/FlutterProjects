import 'dart:async';

import 'package:provider/provider.dart';

class Event {

}

class EventBus{
  final _streamController = StreamController<Event>.broadcast();//Por padrão a stream só deve ser escutada uma vez, com o "BROAD CAST", permite que ele seja escutada várias vezes

  Stream<Event> get stream => _streamController.stream;

  sendEvent(Event event){
    _streamController.add(event);
  }

  static EventBus get(context){
    return Provider.of<EventBus>(context, listen: false);
  }

  dispose(){
    _streamController.close();
  }
}