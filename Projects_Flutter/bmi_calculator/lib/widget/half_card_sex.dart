import 'package:flutter/material.dart';

class HalfCardSex extends StatefulWidget {
  @override
  _HalfCardSexState createState() => _HalfCardSexState();
}

class _HalfCardSexState extends State<HalfCardSex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFF1D1E33), borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
