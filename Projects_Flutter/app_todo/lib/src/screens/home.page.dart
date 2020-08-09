import 'package:app_todo/src/components/bottom_sheet/bottom_sheet_add_task.dart';
import 'package:app_todo/src/components/list/item_todo.dart';
import 'package:app_todo/src/models/task.dart';
import 'package:app_todo/src/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final id = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: _handlerRenderBody(),
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: buildBottomSheet,
          isScrollControlled: true,
          backgroundColor: Color(0xFF757575),
        ),
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  _handlerRenderBody() {
    return Column(
      children: <Widget>[
        Expanded(flex: 1, child: _handlerRenderHeader()),
        Expanded(flex: 2, child: _handlerRenderList()),
      ],
    );
  }

  _handlerRenderHeader() {
    return Container(
      padding: EdgeInsets.all(50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _handlerRenderMenuButton(),
          SizedBox(height: 50),
          Text(
            'Todoey',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Text(
            '${Provider.of<TaskData>(context).tasks.length} Tasks',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  _handlerRenderMenuButton() {
    return RawMaterialButton(
      onPressed: null,
      shape: CircleBorder(),
      fillColor: Colors.white,
      padding: EdgeInsets.all(10),
      child: Icon(
        Icons.list,
        size: 50,
        color: Colors.lightBlueAccent,
      ),
    );
  }

  _handlerRenderList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Consumer<TaskData>(
        builder: (BuildContext context, taskData, child) {
          return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (BuildContext contenxt, index) {
              Task currentTask = taskData.tasks[index];

              return ItemTodo(
                name: currentTask.name,
                isDone: currentTask.isDone,
                onToggleTask: () => taskData.toggleTask(currentTask),
                onLongPressTask: () => taskData.deleteTask(currentTask),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BottomSheetAddTask(),
      );
}
