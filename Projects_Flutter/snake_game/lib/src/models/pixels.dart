enum PixelsNextPosition {
  nextLeftPosition,
  nextRightPosition,
  nextTopPosition,
  nextBottomPosition,
}

class Pixels {
  int totalPixels = 500;
  int heightPixel = 30;
  int widthPixel = 30;
  int totalColumns = 20;
  List<int> totalItemsByRow = [];

  Pixels({this.totalPixels, this.totalColumns}) {
    this._generateListTotalItemsByRow();
  }

  void _generateListTotalItemsByRow() {
    totalItemsByRow = List.generate(
        int.parse((this.getTotalOfRows()).toString()),
        (index) => (index + 1) * this.totalColumns);
  }

  int getTotalOfRows() {
    return (this.totalPixels / this.totalColumns).round();
  }

  //Retorna a posição do pixel
  int getPixelRow(int position) {
    //Gera um array de o valores máximos da quantidade de pixels que possui uma linha

    int row = 0;

    //Verifica qual é a linha
    this.totalItemsByRow.asMap().forEach((index, totalItemsInRow) {
      if (index == 0) {
        if (position <= totalItemsInRow) row = index + 1;
      } else {
        if (position <= totalItemsInRow &&
            position > this.totalItemsByRow[index - 1]) row = index + 1;
      }
    });

    return row;
  }

  int getNextPixel(int currentPosition, PixelsNextPosition nextPosition) {
    int indexRowOfCurrentPosition = this.getPixelRow(currentPosition) - 1;
    int totalRows = this.getTotalOfRows();

    if (nextPosition == PixelsNextPosition.nextRightPosition) {
      //Está no último pixel da linha
      if (currentPosition ==
          (this.totalItemsByRow[indexRowOfCurrentPosition] - 1)) {
        return this.totalItemsByRow[indexRowOfCurrentPosition] -
            this.totalColumns;
      } else {
        return currentPosition + 1;
      }
    }

    if (nextPosition == PixelsNextPosition.nextLeftPosition) {
      //Está no primeiro pixel

      if (currentPosition ==
          this.totalItemsByRow[indexRowOfCurrentPosition+1] - (this.totalColumns)) {

        return this.totalItemsByRow[indexRowOfCurrentPosition+1]-1;
      }
      /*} else {
        return currentPosition - 1;
      }*/

      return currentPosition - 1;
    }

    if (nextPosition == PixelsNextPosition.nextTopPosition) {
      //Está na primeira linha
      if (indexRowOfCurrentPosition == 0) {
        //vai para a última linha
        int nextPosition =
            this.totalItemsByRow[this.totalItemsByRow.length - 1] -
                (this.totalColumns - currentPosition);

        return nextPosition;
      } else {
        return currentPosition - this.totalColumns;
      }
    }

    if (nextPosition == PixelsNextPosition.nextBottomPosition) {
      //Está na última linha
      if (indexRowOfCurrentPosition == (totalRows - 1)) {
        //vai para a primeira linha
        int nextPosition =
            this.totalColumns - (this.totalPixels - currentPosition);

        return nextPosition;
      } else {
        return currentPosition + this.totalColumns;
      }
    }

    return currentPosition;
  }
}
