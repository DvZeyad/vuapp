import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_Calender extends StatefulWidget {
  Student_Calender({
    Key? key,
  }) : super(key: key);

  @override
  Student_Calenderstate createState() => Student_Calenderstate();
}

class Student_Calenderstate extends State<Student_Calender> {
  late CalendarController _controller;
  late DateTime _selectedDay;
  late Map<DateTime, List<dynamic>> _events;
  late TextEditingController _eventController;
  late SharedPreferences prefs;
  late List<dynamic> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _showAddDialog,
        child: Icon(Icons.add, color: Colors.black),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 25.0, start: 0.0),
            Pin(size: 25.0, start: displayHeight(context) * 0.11),
            child: Stack(
              children: <Widget>[
                Container(
                  color: const Color(0xff000000),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff000000),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: displayWidth(context) * 0.11,
            height: displayHeight(context) * 0.135,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            ),
          ),
          Container(
            alignment: Alignment(displayWidth(context) * -0.0013,
                displayWidth(context) * -0.00203),
            child: Text(
              'Calender',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Container(
            alignment: Alignment(-0.960, displayWidth(context) * -0.00211),
            child: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              icon: const Icon(Icons.arrow_back, size: 25.0),
              color: Color(0xff000000),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, displayHeight(context) * 0.1351),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff000000),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: displayHeight(context) * 0.15),
              child: Column(
                  ///////////////////////////////////////////////////////////THE GREAT CALENDAR

                  children: [
                    TableCalendar(
                      events: _events,
                      weekendDays: [DateTime.friday, DateTime.saturday],
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Colors.white)),
                      calendarStyle: CalendarStyle(
                        weekdayStyle: const TextStyle(color: Colors.white),
                        canEventMarkersOverflow: true,
                        todayColor: Colors.red,
                        todayStyle: const TextStyle(color: Colors.white),
                        eventDayStyle: const TextStyle(color: Colors.white),
                        markersColor: Colors.amber,
                        outsideStyle: const TextStyle(color: Colors.white30),
                        weekendStyle: const TextStyle(color: Colors.deepPurple),
                      ),
                      headerStyle: HeaderStyle(
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                          rightChevronIcon:
                              Icon(Icons.chevron_right, color: Colors.white),
                          centerHeaderTitle: true,
                          formatButtonDecoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          formatButtonTextStyle:
                              TextStyle(color: Colors.white, fontSize: 17),
                          formatButtonShowsNext: false,
                          titleTextStyle:
                              TextStyle(color: Colors.white, fontSize: 17)),
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) =>
                            Container(
                                margin: const EdgeInsets.all(4.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Text(
                                  date.day.toString(),
                                  style: TextStyle(color: Colors.white),
                                )),
                        todayDayBuilder: (context, date, events) => Container(
                            margin: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      //focusedDay: DateTime.now(),
                      startDay: DateTime.utc(2020, 1, 1),
                      endDay: DateTime.utc(2060, 12, 31),
                      onDaySelected: (date, events, holidays) {
                        setState(() {
                          _selectedEvents = events;
                        });
                      },
                      calendarController: _controller,
                    ),
                    ..._selectedEvents.map((event) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 20,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Text(
                              event,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                          ),
                        )),
                  ])),
        ],
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text("Add Events"),
              content: TextField(
                controller: _eventController,
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                    setState(() {
                      if (_events[_controller.selectedDay] != null) {
                        _events[_controller.selectedDay]
                            ?.add(_eventController.text);
                      } else {
                        _events[_controller.selectedDay] = [
                          _eventController.text
                        ];
                      }
                      prefs.setString(
                          "events", json.encode(encodeMap(_events)));
                      _eventController.clear();
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            ));
  }
}
