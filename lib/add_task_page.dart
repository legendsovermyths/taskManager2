import 'package:flutter/material.dart';
import 'custom_file.dart';
class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              "Add New Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(12),
              )),
              labelText: "Enter task name"
            ),
          ),
          SizedBox(height: 10,),
          CustomButtom(onPressed: (){},textcolor: Colors.white,bordercolor: Colors.purple,buttonText: "Add Task",color: Colors.purple,)
        ],
      ),
    );
  }
}
