import 'dart:async';
import '../FingerPosition.dart';

class PositionFingerBloc {
  StreamController _streamController = StreamController<FingerPosition>.broadcast();

  Stream get stream => _streamController.stream;

  setPositionFinger(positionX, positionY){
    FingerPosition fingerPosition = FingerPosition(positionX, positionY);
    _streamController.add(fingerPosition);
  }

  dispose(){
    _streamController.close();
  }
}