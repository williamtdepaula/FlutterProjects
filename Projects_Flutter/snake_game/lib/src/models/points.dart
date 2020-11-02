import 'dart:math';

class Points {
  List<int> _indexOfPoints = [];

  get getIndexOfPoints => this._indexOfPoints;

  get getTotalPoints => this._indexOfPoints.length;

  void clear(){
    _indexOfPoints.clear();
  }

  void generatePoints(int totalOfIndex, int maxPoints) {
    if (this._indexOfPoints.length == 0) {
      Random random = new Random();

      while (_indexOfPoints.length < maxPoints) {
        int randomValue = 1 + random.nextInt(totalOfIndex - 1);

        if (this._indexOfPoints.indexOf(randomValue) == -1)
          this._indexOfPoints.add(1 + random.nextInt(totalOfIndex - 1));
      }
    }
  }

  bool isPoint(int index) {
    return this._indexOfPoints.indexOf(index) != -1;
  }

  void removePoint(int indexPoint) {
    this._indexOfPoints.remove(indexPoint);
  }
}
