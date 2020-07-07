import 'dart:async';

import 'package:apptalk_prototype/src/models/Bloc/PositionFingerBloc.dart';
import 'package:apptalk_prototype/src/models/FingerPosition.dart';
import 'package:flutter/material.dart';

class React extends StatefulWidget {
  List<int> idsReactions;

  React(this.idsReactions);

  @override
  _React createState() => _React();
}

class _React extends State<React> {
  PositionFingerBloc positionFingerBloc = PositionFingerBloc();
  double positionContainerReactions = 0.0;
  OverlayState overlayState;
  OverlayEntry overlayEntry;
  List<GlobalKey> keys = [];

  StreamSubscription<FingerPosition> subscription;

  @override
  void initState() {
    super.initState();

    subscription = positionFingerBloc.stream.listen((event) {
      final finger = event.toString();

      /*if () {
        RenderBox box = key.currentContext.findRenderObject();
        Offset position = box.localToGlobal(Offset.zero);

        print('Teste ${position.dx}');
        //print('mudei $finger');
      }*/
    });
  }

  @override
  void dispose() {
    super.dispose();

    positionFingerBloc.dispose();
    subscription.cancel();
    overlayState.dispose();
  }

  onPress(DragStartDetails e) {
    positionContainerReactions = e.globalPosition.dy - 50;

    overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => Container(child: renderContainerToGesture()),
    );

    overlayState.insert(overlayEntry);
  }

  onHorizontalDragUpdate(DragUpdateDetails e) {
    positionFingerBloc.setPositionFinger(
        e.globalPosition.dx, e.globalPosition.dy);
  }

  onHorizontalDragEnd(DragEndDetails e) {
    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onHorizontalDragStart: onPress,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
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

  renderContainerToGesture() {
    print('POSITION START  $positionContainerReactions');
    final sizePhone = MediaQuery.of(context).size;

    return Positioned(
      top: positionContainerReactions,
      left: 20,
      child: renderReactContainer(),
    );
  }

  renderReactContainer() {
    RenderBox renderBox = context.findRenderObject();

    return Container(
        decoration: BoxDecoration(
          color: Colors.white70,
        ),
        child: ListView(
          children: <Widget>widget.idsReactions.map((e) => renderReact(e))
          ,
        ));
  }

  renderReact(int index) {
    return Container(
      key: keys[index],
      child: Image.asset('assets/imgs/likePNG.png', width: 38),
    );
  }
}
