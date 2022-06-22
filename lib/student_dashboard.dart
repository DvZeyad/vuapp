import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:svu_beta/student_assignments_uploadN.dart';
import 'package:svu_beta/upd_student_menu.dart';

class student_dashboard extends StatefulWidget {
  String currentUser;
  var year;
  var std_id;
  student_dashboard(this.currentUser, this.year, this.std_id);
  @override
  State<StatefulWidget> createState() {
    return student_dashboardstate(this.currentUser, this.year, this.std_id);
  }
}

class student_dashboardstate extends State<student_dashboard> {
  var currentUser;
  var year;
  var std_id;
  student_dashboardstate(this.currentUser, this.year, this.std_id);

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
    return dashdetails;
  }

  Future<List> availableAssignments() async {
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
        "select * from assignments,courses_enrollments where (enrolled_student = (select id from userstest where username = '$currentUser')) and (assignments.assigncourse_id = courses_enrollments.course_id)");
    List assignmentsList = [];
    for (final row in res.rows) {
      var details = row.assoc();

      assignmentsList.add(details);
    }
    print(assignmentsList);
    await conn.close();
    return assignmentsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 25.0, start: -1.0),
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
          Transform.translate(
            offset: Offset(
                displayWidth(context) * 0, displayHeight(context) * 0.1351),
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
            alignment: Alignment.topLeft,
            width: displayWidth(context) * 0.11,
            height: displayHeight(context) * 0.135,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            ),
          ),
          Container(
            alignment: Alignment(displayWidth(context) * -0.0023,
                displayWidth(context) * -0.00209),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Updstudent_menu(currentUser, year, std_id)));
              },
              icon: const Icon(Icons.apps_rounded, size: 35.0),
              color: Color(0xff000000),
            ),
          ),
          Align(
              alignment: Alignment(0.0, -0.851),
              child: SizedBox(
                child: FutureBuilder(
                  future: dashboarddata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print('${snapshot.data}');
                      return Text('${snapshot.data}');
                    }
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )),
          Container(),
          Align(
            alignment: Alignment(displayWidth(context) * -0.002, -0.615),
            child: Text(
              'Latest Notification',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xfffffafa),
                fontWeight: FontWeight.w500,
              ),
              softWrap: true,
            ),
          ),
          Align(
            alignment: Alignment(displayWidth(context) * -0.0019, -0.050),
            child: Text(
              'Latest Assignments',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xfffffafa),
                fontWeight: FontWeight.w500,
              ),
              softWrap: true,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: displayWidth(context) * 1.01),
              child: FutureBuilder(
                  future: availableAssignments(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      List datalist = data;
                      return ListView.builder(
                          itemCount: datalist.length,
                          itemBuilder: (BuildContext context, int index) {
                            var assignment_desc = data[index]['assign_desc'];
                            var assignment_id = data[index]['assignment_id'];
                            var instructor = data[index]['instructor'];
                            return Center(
                                child: Card(
                                    elevation: 4,
                                    shadowColor: Colors.white70,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      student_assignments_upload(
                                                          currentUser,
                                                          assignment_desc,
                                                          assignment_id,
                                                          instructor))));
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(15)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    Size.fromWidth(
                                                        displayWidth(context) *
                                                            0.91))),
                                        child: Container(
                                          alignment: Alignment(
                                              displayWidth(context) * -0.0002,
                                              0.0),
                                          child: Text(
                                              '${data[index]['assign_subject']}\n${data[index]['course_name']}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600)),
                                        ))));
                          });
                    }
                    return Container();
                  }))
        ],
      ),
    );
  }
}
