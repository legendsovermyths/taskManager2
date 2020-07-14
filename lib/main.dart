import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/add_event_page.dart';
import 'package:taskmanager/add_task_page.dart';
import 'package:taskmanager/events_page.dart';
import 'task_page.dart';
import 'events_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task manager',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget currentwidget=TaskPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            height: 22,
            color: Colors.purple,
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topRight,
              child: Text(
            "6",
            style: TextStyle(
                fontSize: 120, color: Color(0x10000000), fontFamily: 'BalsamiqSans'),
            textAlign: TextAlign.right,
          )),
          Column(
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Monday",
                    style: TextStyle(fontSize: 32, fontFamily: 'BalsamiqSans'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.purple,
                        padding: EdgeInsets.all(14.0),
                        onPressed: () {
                          setState(() {
                            currentwidget=TaskPage();
                          });
                        },
                        child: Text(
                          "Tasks",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.white,
                        padding: EdgeInsets.all(14.0),
                        onPressed: () {
                          setState(() {
                            currentwidget=EventPage();
                          });
                        },
                        child: Text(
                          "Events",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             currentwidget,
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: () {
            print(currentwidget.toString()=="TaskPage");
            showDialog(

                barrierDismissible: false,
                context: context,
            builder: (BuildContext context){
              return Dialog(child:currentwidget.toString()=="TaskPage"? AddTaskPage():AddEventPage(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),);
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
