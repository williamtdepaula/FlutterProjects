class FingerPosition {
  double positionX = 0.0;
  double positionY = 0.0;
  double positionStart = 0.0;

  FingerPosition(this.positionX, this.positionY, this.positionStart);

  @override
  String toString() {
    // TODO: implement toString
    return 'Finger Position: X: $positionX Y: $positionY Start: $positionStart';
  }
}
