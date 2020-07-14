import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/custom_file.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String selectedDate="Pick a Date";
  String selectedTime="Pick a Time";
  Future _picktime()async{
    TimeOfDay timePick=await showTimePicker(context: context, initialTime: TimeOfDay.now(),);
    if(timePick!=null){
      setState(() {
        selectedTime=timePick.toString();
      });

    }
  }
  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(Duration(days: -7)),
      lastDate: DateTime.now().add(
        Duration(days: 7)));
        if(datepick!=null){
          setState(() {
            selectedDate=datepick.toString();
          });

    }


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              "Add New Event",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
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
                labelText: "Enter event name"),
          ),
          SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(12),
                )),
                labelText: "Enter Description"),
          ),
          SizedBox(
            height: 12,
          ),
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: (
                ) {
              _pickDate();
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  color: Colors.purple,
                  size: 30,
                ),
                SizedBox(
                  width: 14,
                ),
                Text(selectedDate),
              ],
            ),
          ),
          SizedBox(height: 12,),
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: (
                ) {
              _picktime();
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.date_range,
                  color: Colors.purple,
                  size: 30,
                ),
                SizedBox(
                  width: 14,
                ),
                Text(selectedTime),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomButtom(
            color: Colors.purple,
            buttonText: "Add Event",
            bordercolor: Colors.transparent,
            onPressed: () {},
            textcolor: Colors.white,
          )
        ],
      ),
    );
  }
}
