enum SnakeDirection {
  left,
  right,
  bottom,
  top,
}

class Snake {
  int position;
  SnakeDirection direction;
  List<int> body = [];

  Snake({this.position, this.direction = SnakeDirection.bottom}) {
    this.body.add(this.position); //Adiciona a cabeça ao corpo
  }

  int get totalPoints => this.body.length - 1;

  void die(){
    this.body.clear();
  }

  void addBody() {
    this.body.add(position);
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
