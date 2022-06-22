import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/Student_course_materials.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:svu_beta/student_view_instructor.dart';
import './std_view_students.dart';

class student_course_name extends StatefulWidget {
  var cname;
  var ccode;
  var student_id;
  var instructor_id;
  student_course_name(
      {Key? key,
      required this.cname,
      required this.ccode,
      required this.student_id,
      required this.instructor_id})
      : super(key: key);
  @override
  student_course_namestate createState() => student_course_namestate(
      this.ccode, this.cname, this.student_id, this.instructor_id);
}

class student_course_namestate extends State<student_course_name> {
  var cname;
  var ccode;
  var student_id;
  var instructor_id;
  student_course_namestate(
      this.ccode, this.cname, this.student_id, this.instructor_id);

  Future unEnrollACourse() async {
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

    try {
      var res = await conn.execute(
          "delete from courses_enrollments where coursecode = '$ccode' and enrolled_student = '$student_id'");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Success',
        desc: 'You Have Been Unenrolled Successfully',
        btnOkOnPress: () {
          Navigator.pop(
            context,
          );
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.green,
      ).show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Error',
        desc: 'An Error Occured',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    }

    await conn.close();
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
              '$cname',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          ListView(padding: const EdgeInsets.all(10), children: <Widget>[
            Card(
              elevation: 2,
              shadowColor: Colors.white60,
              margin: EdgeInsets.only(top: displayHeight(context) * 0.15),
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              student_course_materials(cname, ccode)));
                },
                child: Text('Course Materials',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            Card(
              elevation: 2,
              shadowColor: Colors.white60,
              margin: EdgeInsets.only(top: displayHeight(context) * 0.04),
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => std_view_students(ccode)));
                },
                child: Text('View Students',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            Card(
              elevation: 2,
              shadowColor: Colors.white60,
              margin: EdgeInsets.only(top: displayHeight(context) * 0.04),
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text('Confirm'),
                            content: Container(
                                height: displayHeight(context) * 0.103,
                                child: Column(
                                  children: [
                                    Container(
                                        child: Text(
                                      'Are you sure you want remove this course?',
                                      softWrap: true,
                                    )),
                                    Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              unEnrollACourse();
                                            },
                                            child: Text('Confirm')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel'))
                                      ],
                                    )
                                  ],
                                )));
                      });
                },
                child: Text('Unenroll The Course',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            Card(
              elevation: 2,
              shadowColor: Colors.white60,
              margin: EdgeInsets.only(top: displayHeight(context) * 0.04),
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              student_view_instructor(student_id)));
                },
                child: Text('Instructor Profile',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
          ]),
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
        ],
      ),
    );
  }
}
