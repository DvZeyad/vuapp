import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';

import 'package:svu_beta/sizehelper.dart';
import 'package:svu_beta/student/student_assignments_uploadN.dart';

class Student_Assigments extends StatefulWidget {
  String currentUser;
  var year;
  Student_Assigments(this.currentUser, this.year);
  @override
  State<StatefulWidget> createState() {
    return Student_Assigmentsstate(this.currentUser, this.year);
  }
}

class Student_Assigmentsstate extends State<Student_Assigments> {
  String currentUser;
  var year;
  Student_Assigmentsstate(this.currentUser, this.year);

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
              'Assignments',
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
              margin: EdgeInsets.only(top: displayWidth(context) * 0.25),
              alignment: Alignment(0.0, 0.0),
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
                  })),
        ],
      ),
    );
  }
}
