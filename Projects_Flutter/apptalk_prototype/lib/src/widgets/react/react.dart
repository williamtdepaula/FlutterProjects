import 'package:flutter/material.dart';

class React extends StatelessWidget {
  /*Function onPress;
  Function onLongPress;

  React(this.onPress, this.onLongPress);*/

  onPress(context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Container(child: renderContainerToGesture(context)),
    );

    overlayState.insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onLongPress: () => onPress(context),
        child: Text(
          'Curtir',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  renderContainerToGesture(context) {
    final sizeDevice = MediaQuery.of(context).size;

    return GestureDetector(
      onHorizontalDragStart: (e) => print(e),
      onHorizontalDragUpdate: (e) => print(e),
      child: Container(
        width: sizeDevice.width,
        height: sizeDevice.height / 7,
        color: Colors.green,
      ),
    );
  }
}
