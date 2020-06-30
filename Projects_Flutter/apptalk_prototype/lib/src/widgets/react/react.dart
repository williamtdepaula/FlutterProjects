import 'dart:async';

import 'package:apptalk_prototype/src/models/Bloc/PositionFingerBloc.dart';
import 'package:apptalk_prototype/src/models/FingerPosition.dart';
import 'package:flutter/material.dart';

class React extends StatefulWidget {
  @override
  _React createState() => _React();
}

class _React extends State<React> {
  PositionFingerBloc positionFingerBloc = PositionFingerBloc();

  StreamSubscription<FingerPosition> subscription;

  @override
  void initState() {
    super.initState();

    subscription = positionFingerBloc.stream.listen((event) {
      final finger = event.toString();
      print('mudei $finger');
    });
  }

  @override
  void dispose() {
    super.dispose();

    positionFingerBloc.dispose();
    subscription.cancel();
  }

  onPress() {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Container(child: renderContainerToGesture()),
    );

    overlayState.insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onHorizontalDragStart: (e) => onPress(),
        onHorizontalDragUpdate: (e) => positionFingerBloc.setPositionFinger(
            e.globalPosition.dx, e.globalPosition.dy, e.localPosition.dy),
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
    return StreamBuilder(
        stream: positionFingerBloc.stream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            FingerPosition pointer = snapshot.data;

            print('POSITION START ${pointer.positionStart}');

            return Positioned(
              height: 100,
              width: 200,
              top: 350,
              left: 20,
              child: renderReactContainer(),
            );
          }
          return Container();
        });
  }

  renderReactContainer() {
    RenderBox renderBox = context.findRenderObject();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          renderReact(),
          renderReact(),
          renderReact(),
          renderReact(),
        ],
      ),
    );
  }

  renderReact() {
    return Image.asset('assets/imgs/likePNG.png', width: 38);
  }
}
