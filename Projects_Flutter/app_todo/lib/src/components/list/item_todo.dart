import 'package:flutter/material.dart';

class ItemTodo extends StatefulWidget {
  @override
  _ItemTodoState createState() => _ItemTodoState();
}

class _ItemTodoState extends State<ItemTodo> {
  bool checked = false;

  void onClickCheck(bool isChecked) {
    setState(() {
      checked = isChecked;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Limpar a casa',
          style: TextStyle(
            decoration:
                checked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        Checkbox(
          value: checked,
          onChanged: onClickCheck,
          activeColor: Colors.lightBlueAccent,
        )
      ],
    );
  }
}
