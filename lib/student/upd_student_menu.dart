import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/student/Student_Assigments.dart';
import 'package:svu_beta/student/Student_Calender.dart';
import 'package:svu_beta/student/Student_Examination.dart';
import 'package:svu_beta/chat/stream_chat_student.dart';
import 'package:svu_beta/student/Student_courses.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:svu_beta/student/reportcards.dart';
import 'package:svu_beta/student/student_attendance.dart';
import 'package:svu_beta/student/student_profile.dart';
import './student_dashboard.dart';
import '../login_withmysql.dart';
import 'Student_notifications.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Updstudent_menu extends StatefulWidget {
  String currentUser;
  var year;
  var std_id;
  Updstudent_menu(this.currentUser, this.year, this.std_id);
  @override
  State<StatefulWidget> createState() {
    return Updstudent_menustate(this.currentUser, this.year, this.std_id);
  }
}

class Updstudent_menustate extends State<Updstudent_menu> {
  var currentUser;
  var year;
  var std_id;
  final client = StreamChatClient(
    '4hw3tn7rpac3',
    logLevel: Level.INFO,
  );
  Updstudent_menustate(this.currentUser, this.year, this.std_id);
  Future<void> dashboarddata() async {
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
    var jsondetails = new Map();
    var res = await conn.execute(
        "select first_name,last_name,year from userstest where username = '$currentUser'");
    for (final row in res.rows) {
      var details = row.assoc();
      jsondetails.addAll(details);
    }
    var dashdetails = (jsondetails['first_name'] +
        ' ' +
        jsondetails['last_name'] +
        '\n' +
        'Year ' +
        jsondetails['year']);
    //print(dashdetails);
    await conn.close();
    return dashdetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff000000),
        body: ListView(
          padding:
              EdgeInsets.fromLTRB(25, displayHeight(context) * 0.10, 25, 0.0),
          shrinkWrap: true,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 50,
                child: FutureBuilder(
                  future: dashboarddata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print('${snapshot.data}');
                      return Text(
                        '${snapshot.data}',
                        style: TextStyle(color: Colors.white),
                      );
                    }
                    return Container(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => student_dashboard(
                                      currentUser, year, std_id)));
                        },
                        icon: Image.asset('assets/images/dashboard.png')),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Student_Assigments(currentUser, year)));
                        },
                        icon: Image.asset('assets/images/assignments.png')),
                    Text(
                      'Assignments',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      student_attendance(currentUser)));
                        },
                        icon: Image.asset('assets/images/attendance.png')),
                    Text(
                      'Attendance',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          // To be added
                        },
                        icon: Image.asset('assets/images/fees.png')),
                    Text(
                      'Fee Details',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Student_Examination()));
                        },
                        icon: Image.asset('assets/images/exams.png')),
                    Text(
                      'Examination',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment(0.0, 2.3),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      reportcards(currentUser)));
                        },
                        icon: Image.asset('assets/images/report-cards.png')),
                    Text(
                      'Report\nCards',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Student_Calender()));
                        },
                        icon: Image.asset('assets/images/calendar.png')),
                    Text(
                      'Calendar',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Student_notifications(currentUser)));
                        },
                        icon: Image.asset('assets/images/notifications.png')),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Student_courses(
                                      currentUser, year, std_id)));
                        },
                        icon: Image.asset('assets/images/courses.png')),
                    Text(
                      'Courses',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => chatApp(
                                  currentUser: currentUser,
                                  year: year,
                                  std_id: std_id,
                                  client: client,
                                  channel: client.channel('messaging',
                                      id: 'mehoz',
                                      extraData: {
                                        "name": "Meho'Z",
                                        "image":
                                            "https://robertbrunhage.com/logo.png",
                                      }),
                                ),
                              ));
                        },
                        icon: Image.asset('assets/images/communi.png')),
                    Text(
                      'Communicate',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                ),
                SizedBox(width: 50),
                Stack(
                  alignment: Alignment(0.0, 1.5),
                  children: [
                    IconButton(
                        iconSize: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      student_profile(currentUser)));
                        },
                        icon: Image.asset('assets/images/profile.png')),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.09),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 172.0,
                    height: 44.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login_screen()),
                            ((route) => false));
                      },
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 255, 129, 120)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)))),
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 30)
          ],
        ));
  }
}
