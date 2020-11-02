import 'package:flutter/material.dart';

enum SnakeDirection {
  left,
  right,
  bottom,
  top,
}

class Snake {
  int position;
  SnakeDirection direction;
  Color color;
  List<int> body = [];

  Snake({
    this.position,
    this.direction = SnakeDirection.bottom,
    this.color = Colors.white,
  }) {
    this.body.add(this.position); //Adiciona a cabeça ao corpo
  }

  int get totalPoints => this.body.length - 1;

  void changeToSuperSnake() {
    this.color = Colors.orange;
    this.addBody(size: 5);
  }

  void die() {
    this.body.clear();
  }

  void addBody({int size = 1}) {
    for (int i = 0; i < size; i++) {
      this.body.add(position - i);
    }
  }

  void moveBody() {
    if (this.body.length > 0) {
      List<int> newList = [];

      this.body.asMap().forEach((int index, int position) {
        if (index == 0) {
          newList.add(this.position);
        } else {
          newList.add(this.body[index - 1]);
        }
      });

      this.body = newList;
    }
  }

  bool isBody(int index) {
    return this.body.indexOf(index) != -1;
  }
}
