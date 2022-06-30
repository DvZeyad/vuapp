import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/student/Student_enroll_course.dart';
import 'package:svu_beta/sizehelper.dart';

class Student_code_course extends StatefulWidget {
  var std_id;
  Student_code_course(this.std_id);
  State<StatefulWidget> createState() {
    return Student_code_coursestate(this.std_id);
  }
}

class Student_code_coursestate extends State<Student_code_course> {
  var std_id;
  Student_code_coursestate(this.std_id);
  final courseCodeController = TextEditingController();
  List courseslist = [];
  var coursecode;
  Future<List> getAvailableCourses() async {
    coursecode = courseCodeController.text;
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
        "SELECT coursecode,coursename,instructor,year FROM courses where coursecode = '$coursecode'");
    var jsondetails = new Map();
    for (final row in res.rows) {
      var details = row.assoc();
      //jsondetails.addAll(details);
      courseslist.add(details);
    }
    await conn.close();
    print(courseslist);
    return courseslist;
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
                Navigator.pop(
                  context,
                );
              },
              icon: const Icon(Icons.arrow_back, size: 25.0),
              color: Color(0xff000000),
            ),
          ),
          Container(
            alignment: Alignment(0.0, displayWidth(context) * -0.00165),
            child: Text(
              'Search For Course',
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
              softWrap: true,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 18),
              alignment: Alignment(0.0, displayWidth(context) * -0.001),
              width: displayWidth(context) * 0.92,
              child: Stack(children: [
                TextField(
                  onSubmitted: (value) {
                    setState(() {
                      getAvailableCourses();
                      courseslist.clear();
                    });
                  },
                  controller: courseCodeController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Course Name / ID",
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
                Container(
                    margin: EdgeInsets.fromLTRB(
                        displayWidth(context) * 0.78, 0, 0, 0),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            getAvailableCourses();
                            courseslist.clear();
                          });
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )))
              ])),
          Align(
            alignment: Alignment(0.0, -0.573),
            child: SizedBox(
              child: Text(
                'You can search using your Subject Code or your Subject Name.',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              margin:
                  EdgeInsets.only(top: displayHeight(context) * 0.38, left: 18),
              width: displayWidth(context) * 0.92,
              height: displayHeight(context) * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: const Color(0xffffffff)),
              ),
              child: Stack(
                children: [
                  Container(
                      alignment:
                          Alignment(0.0, displayWidth(context) * -0.00257),
                      child: Text(
                        "Results",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            backgroundColor: Colors.black),
                      )),
                  ListView.builder(
                      itemCount: courseslist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            elevation: 0,
                            shadowColor: Colors.white,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Student_enroll_course(
                                                  coursecode, std_id)));
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      Size.fromWidth(
                                          displayWidth(context) * 0.85)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                child: Container(
                                    margin: EdgeInsets.only(
                                        right: displayWidth(context) * 0.3),
                                    child: Text(
                                      '${courseslist[index]['coursecode'] + '\n' + courseslist[index]['coursename'] + '\n' + 'Year ' + courseslist[index]['year'] + '\n' + courseslist[index]['instructor']}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          height: 1.6),
                                    ))));
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
