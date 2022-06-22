import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';
import './Student_courses.dart';

class Student_enroll_course extends StatefulWidget {
  String coursecode;
  Student_enroll_course(this.coursecode);
  @override
  State<StatefulWidget> createState() {
    return Student_enroll_coursestate(this.coursecode);
  }
}

class Student_enroll_coursestate extends State<Student_enroll_course> {
  String coursecode;
  Student_enroll_coursestate(this.coursecode);
  List courseDetail = [];
  final accessCodeController = TextEditingController();
  Future<List> courseDetailToEnroll() async {
    print("Connecting to mysql server...");
    // create connection
    final conn = await MySQLConnection.createConnection(
        host: "192.168.1.5",
        port: 3306,
        userName: "root",
        password: "zeyad123!",
        databaseName: "svu_db",
        secure: false // optional
        );
    await conn.connect();
    print("Connected");
    var res = await conn.execute(
        "SELECT coursecode,coursename,instructor,course_description FROM courses where coursecode = '$coursecode'");
    var jsondetails = new Map();
    for (final row in res.rows) {
      var details = row.assoc();
      //jsondetails.addAll(details);
      courseDetail.add(details);
    }
    await conn.close();
    print(courseDetail);
    return courseDetail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
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
              'Join Course',
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
            alignment: Alignment(displayWidth(context) * -0.0023,
                displayWidth(context) * -0.00209),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 25.0),
              color: Color(0xff000000),
            ),
          ),
          Container(
            alignment: Alignment(0.0, displayWidth(context) * -0.00165),
            child: Text(
              'Enroll In Course',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 23,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w800,
                shadows: [
                  Shadow(
                    color: const Color(0x29ffffff),
                    offset: Offset(1, 6),
                    blurRadius: 12,
                  )
                ],
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Align(
              alignment: Alignment(0, displayWidth(context) * -0.0013),
              child: FutureBuilder(
                  future: courseDetailToEnroll(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return Text(
                        '${data[0]['coursename']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    return Container();
                  })),
          Container(
              margin: EdgeInsets.all(12),
              alignment: Alignment(displayWidth(context) * -0.0021, -0.36),
              child: FutureBuilder(
                  future: courseDetailToEnroll(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return Text(
                        'Instructor: ${data[0]['instructor']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: const Color(0x29f2f2f2),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            )
                          ],
                        ),
                      );
                    }
                    return Container();
                  })),
          Container(
              margin: EdgeInsets.all(12),
              alignment: Alignment(displayWidth(context) * -0.0021,
                  displayWidth(context) * -0.00045),
              child: FutureBuilder(
                  future: courseDetailToEnroll(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return Text(
                        'Description: ${data[0]['course_description']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      );
                    }
                    return Container();
                  })),
          Container(
            alignment: Alignment(
                displayWidth(context) * -0.0021, displayWidth(context) * 0.001),
            child: Text(
              'Access Code:',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              softWrap: false,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment(0.0, displayWidth(context) * 0.0006),
            child: Text(
              'Access Code is required to enroll to this\ncourse ask your instructor to give\nyou this code.',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17,
                color: const Color(0x7affffff),
                fontStyle: FontStyle.italic,
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0, displayWidth(context) * 0.0019),
            child: Container(
                width: displayWidth(context) * 0.33,
                height: displayHeight(context) * 0.056,
                child: ElevatedButton(
                  onPressed: () {
                    //Enroll Function
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  child: Text(
                    'Enroll',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )),
          ),
          Container(
              margin: EdgeInsets.only(left: 18),
              alignment: Alignment(0.0, displayWidth(context) * 0.00135),
              width: displayWidth(context) * 0.92,
              child: Stack(children: [
                TextField(
                  controller: accessCodeController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Write Access Code",
                      hintStyle: TextStyle(color: Colors.white54),
                      contentPadding: const EdgeInsets.all(14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.black),
                ),
              ])),
        ],
      ),
    );
  }
}
