import 'dart:async';
import '../FingerPosition.dart';

class PositionFingerBloc {
  StreamController _streamController = StreamController<FingerPosition>.broadcast();

  Stream get stream => _streamController.stream;

  setPositionFinger(positionX, positionY, positionStart){
    FingerPosition fingerPosition = FingerPosition(positionX, positionY, positionStart);
    _streamController.add(fingerPosition);
  }

  dispose(){
    _streamController.close();
  }
}