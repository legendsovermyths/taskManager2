import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}
class Event{
  final String time;
  final String task;
  final String desc;
  final bool isdone;

  Event({this.time,this.task,this.desc,this.isdone});
}
List<Event> events=[
  Event(time: "9:00",task: "Coffee with Versha",desc: "personal",isdone: true),
  Event(time: "10:00",task: "Attend Lab",desc: "Education",isdone: true),
  Event(time: "15:00",task: "Drink Water",desc: "Health",isdone: true),
  Event(time: "17:00",task: "Meet Aungan",desc: "Professional",isdone: false)
];
class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double Iconsize=20;
    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left:24.0),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: IconDecoration(
                    Iconsize: Iconsize,
                    linewidth: 1,
                    firstData: index==0?true:false,
                    lastData:index==events.length-1?true:false,
                    paintline: Paint()
                      ..color=events[index].isdone?Colors.purple:Colors.grey
                      ..strokeCap=StrokeCap.round
                      ..strokeWidth=2
                      ..style=PaintingStyle.stroke

                  ),

                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              color: Color(0x20000000),
                              blurRadius: 5)
                        ]),
                    child: Icon(
                      events[index].isdone?Icons.fiber_manual_record:Icons.radio_button_unchecked,
                      color: events[index].isdone?Colors.purple:Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(events[index].time),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12.0),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all((Radius.circular(12))),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(events[index].task,style: TextStyle(color: Colors.black),),
                          SizedBox(
                            height: 12,
                          ),
                          Text(events[index].desc,style: TextStyle(color: Colors.grey,fontSize: 15),),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        padding: EdgeInsets.all(0),
      ),
    );
  }
}

class IconDecoration extends Decoration{
  final double Iconsize;
  final double linewidth;
  final bool firstData;
  final bool lastData;
  final Paint paintline;
  IconDecoration({this.Iconsize,this.linewidth,this.firstData,this.lastData,this.paintline});

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return IconLine(
      Iconsize: Iconsize,
      lastData: lastData,
      paintline: paintline,
      firstData: firstData,
    );
  }}
  class IconLine extends BoxPainter{
  final double Iconsize;
  final bool firstData;

  final bool lastData;
  final Paint paintline;
  IconLine({this.Iconsize,this.lastData,this.firstData,this.paintline});

  void paint(Canvas canvas,Offset offset,ImageConfiguration configuration){
    final leftOffset=Offset((Iconsize/2)+24,offset.dy);
    final double iconSpace=Iconsize/1.5;
    final Offset top=configuration.size.topLeft(Offset(leftOffset.dx,0.0));
    final Offset centerTop=configuration.size.centerLeft(Offset(leftOffset.dx,leftOffset.dy-iconSpace));
    final Offset centerBottom=configuration.size.centerLeft(Offset(leftOffset.dx,leftOffset.dy+iconSpace));
    final Offset end=configuration.size.bottomLeft(Offset(leftOffset.dx,leftOffset.dy*2));
    if (!firstData)canvas.drawLine(top,centerTop,paintline);
    if(!lastData)canvas.drawLine(centerBottom,end,paintline);

  }

}

