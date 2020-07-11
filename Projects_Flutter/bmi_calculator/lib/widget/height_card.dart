import 'package:flutter/material.dart';

class HeightCard extends StatefulWidget {
  @override
  _HeightCardState createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFF1D1E33), borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
