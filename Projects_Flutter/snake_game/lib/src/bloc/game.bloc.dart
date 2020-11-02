import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_game/src/models/game.dart';
import 'package:snake_game/src/models/pixels.dart';
import 'package:snake_game/src/models/points.dart';
import 'package:snake_game/src/models/snake.dart';
import 'package:snake_game/src/models/timerGame.dart';
import 'package:snake_game/src/utils/simple_stream.dart';
import 'package:snake_game/src/widgets/modals/modal_end_game.dart';

class GameBloc extends SimpleStream {
  Pixels pixels = new Pixels(totalPixels: 540, totalColumns: 20);
  Snake snake = new Snake(position: 0, direction: SnakeDirection.right);
  Points points = new Points();
  TimerGame _timerGame;

  Timer _timerSnakeMove;
  Timer _timerCreatePoint;
  Timer _timerCreateSuperPoint;

  bool gameIsPlaying;

  double _initalPositionDragHorizontal;
  double _distanceDragHorizontal;
  double _initalPositionDragVertical;
  double _distanceDragVerical;

  void initGame() {
    this.gameIsPlaying = true;

    this.startGame();
    this._sendToViewAppStatus();
  }

  void startGame() {
    _timerGame = new TimerGame(
      onTimerCreatePoint: () =>
          points.generatePoints(pixels.totalPixels, Random().nextInt(5)),
      onTimerSnakeMove: () => _onSnakeMove(),
    );

    _timerGame.initTimers();
  }

  void onHorizontalDragStart(DragStartDetails dragStartDetails) {
    this._initalPositionDragHorizontal = dragStartDetails.globalPosition.dx;
  }

  void onHorizontalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    this._distanceDragHorizontal = dragUpdateDetails.globalPosition.dx -
        this._initalPositionDragHorizontal;
  }

  void onHorizontalDragEnd(DragEndDetails dragEndDetails) {
    this._initalPositionDragHorizontal = 0.0;

    if (_distanceDragHorizontal > 0.0)
      onDragToRight();
    else
      onDragToLeft();
  }

  void onVerticalDragStart(DragStartDetails dragStartDetails) {
    this._initalPositionDragVertical = dragStartDetails.globalPosition.dy;
  }

  void onVerticalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    this._distanceDragVerical =
        dragUpdateDetails.globalPosition.dy - this._initalPositionDragVertical;
  }

  void onVerticalDragEnd(DragEndDetails dragEndDetails) {
    this._initalPositionDragVertical = 0.0;

    if (_distanceDragVerical > 0.0)
      onDragToBottom();
    else
      onDragToTop();
  }

  void onDragToLeft() {
    if (snake.direction != SnakeDirection.right)
      snake.direction = SnakeDirection.left;
  }

  void onDragToBottom() {
    if (snake.direction != SnakeDirection.top)
      snake.direction = SnakeDirection.bottom;
  }

  void onDragToTop() {
    if (snake.direction != SnakeDirection.bottom)
      snake.direction = SnakeDirection.top;
  }

  void onDragToRight() {
    if (snake.direction != SnakeDirection.left)
      snake.direction = SnakeDirection.right;
  }

  void _onSnakeMove() {
    snake.position = this._getNextPosition();

    //Verifica se o jogador não bateu no próprio corpo
    if (!snake.isBody(snake.position)) {
      //Verifica se está passando por um ponto
      if (points.isPoint(snake.position)) {
        snake.addBody();
        points.removePoint(snake.position);
      }

      snake.moveBody();

      add(Game(points: this.points, snake: this.snake));
    } else {
      this.onEndGame();
    }
  }

  int _getNextPosition() {
    if (snake.direction == SnakeDirection.right) {
      return pixels.getNextPixel(
        snake.position,
        PixelsNextPosition.nextRightPosition,
      );
    }

    if (snake.direction == SnakeDirection.left) {
      return pixels.getNextPixel(
        snake.position,
        PixelsNextPosition.nextLeftPosition,
      );
    }

    if (snake.direction == SnakeDirection.top) {
      return pixels.getNextPixel(
        snake.position,
        PixelsNextPosition.nextTopPosition,
      );
    }

    if (snake.direction == SnakeDirection.bottom) {
      return pixels.getNextPixel(
        snake.position,
        PixelsNextPosition.nextBottomPosition,
      );
    }

    return 0;
  }

  void pauseGame() {
    this.gameIsPlaying = false;
    
    this._timerGame.stopTimers();

    this._sendToViewAppStatus();
  }

  void onEndGame() {
    snake.die();
    points.clear();
    this._timerGame.stopTimers();

    this._sendToViewAppStatus();
  }

  void _sendToViewAppStatus() {
    add(Game(
      snake: this.snake,
      points: this.points,
      gamePlaying: this.gameIsPlaying,
    ));
  }
}
