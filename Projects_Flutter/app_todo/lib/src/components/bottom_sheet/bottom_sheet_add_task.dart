import 'package:app_todo/src/models/task.dart';
import 'package:app_todo/src/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetAddTask extends StatelessWidget {
  final TextEditingController _textEditingController =
      new TextEditingController();

  void createTask(BuildContext context) {
    Task task = new Task(
      name: _textEditingController.value.text,
      isDone: false,
    );

    Provider.of<TaskData>(context, listen: false).addTask(task);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Adicionar uma tarefa',
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () => createTask(context),
              child: Text('ADICIONAR'),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
