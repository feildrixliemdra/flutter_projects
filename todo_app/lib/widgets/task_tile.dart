import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  checkboxCallback(bool checkboxState) {
    setState(() {
      isChecked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Some Work Todo',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        checked: isChecked,
        checkboxCallback: checkboxCallback,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checked;
  final Function checkboxCallback;
  TaskCheckbox({this.checked, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.lightBlueAccent,
      value: checked,
      onChanged: checkboxCallback,
    );
  }
}
