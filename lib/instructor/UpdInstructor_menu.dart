import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:svu_beta/chat/stream_chat_instructor.dart';
import 'package:svu_beta/login_withmysql.dart';
import 'package:svu_beta/sizehelper.dart';
import './Instructor_dashboard.dart';
import './Instructor_profile.dart';
import './Instructor_assignment.dart';
import './Instructor_notifications.dart';
import './Instructor_courses.dart';
import './Instructor_calender.dart';
import './Instructor_Examination.dart';

class UpdInstructor_menu extends StatefulWidget {
  String currentUser;
  UpdInstructor_menu(this.currentUser);
  State<StatefulWidget> createState() {
    return UpdInstructor_menustate(this.currentUser);
  }
}

class UpdInstructor_menustate extends State<UpdInstructor_menu> {
  String currentUser;
  final client = StreamChatClient(
    '4hw3tn7rpac3',
    logLevel: Level.INFO,
  );
  UpdInstructor_menustate(this.currentUser);

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
        "select first_name,last_name,inst_description from instructorstest where username = '$currentUser'");
    for (final row in res.rows) {
      var details = row.assoc();
      jsondetails.addAll(details);
    }
    var dashdetails = (jsondetails['first_name'] +
        ' ' +
        jsondetails['last_name'] +
        '\n' +
        jsondetails['inst_description']);
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
                EdgeInsets.fromLTRB(25, displayHeight(context) * 0.16, 25, 0.0),
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
                                    builder: (context) =>
                                        Instructor_dashboard(currentUser)));
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
                                        Instructor_assignment(currentUser)));
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
                                        Instructor_courses(currentUser)));
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
                                    builder: (context) =>
                                        Instructor_Calender()));
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
                                        Instructor_notifications()));
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
                                    builder: (context) =>
                                        Instructor_Examination()));
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
                                        Instructor_profile(currentUser)));
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
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
            ]));
  }
}
