import 'dart:async';

class TimerGame {
  Timer _timerSnakeMove;
  Timer _timerCreatePoint;

  Function onTimerCreatePoint;
  Function onTimerSnakeMove;

  TimerGame({
    this.onTimerCreatePoint,
    this.onTimerSnakeMove,
  });

  void initTimers() {
    this._timerSnakeMove =
        Timer.periodic(Duration(milliseconds: 100), (_) => onTimerSnakeMove());

    this._timerCreatePoint =
        Timer.periodic(Duration(seconds: 15), (_) => onTimerCreatePoint());

  }

  void restartTimers(){
    this.stopTimers();
    this.initTimers();
  }

  void stopTimers() {
    this._timerCreatePoint.cancel();
    this._timerSnakeMove.cancel();
  }
}
