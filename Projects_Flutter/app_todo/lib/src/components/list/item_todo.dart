import 'package:app_todo/src/models/task.dart';
import 'package:flutter/material.dart';

class ItemTodo extends StatefulWidget {
  final String name;
  final bool isDone;
  final Function onToggleTask;
  final Function onLongPressTask;

  ItemTodo({this.name, this.isDone, this.onToggleTask, this.onLongPressTask});

  @override
  _ItemTodoState createState() => _ItemTodoState();
}

class _ItemTodoState extends State<ItemTodo> {
  // bool checked = false;

  void changeTaskState() {
    widget.onToggleTask();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //changeTaskState(widget.task.isDone);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPressTask,
      onTap: changeTaskState,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.name,
            style: TextStyle(
                decoration: widget.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: 20),
          ),
          Checkbox(
            value: widget.isDone,
            onChanged: (_) => changeTaskState(),
            activeColor: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
