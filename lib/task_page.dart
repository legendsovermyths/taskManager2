import 'package:flutter/material.dart';
class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text("This is task 1"),
      trailing: Checkbox(
        onChanged: (value) {},
        value: true,
        activeColor: Colors.purple,
      ),
    );
  }
}
