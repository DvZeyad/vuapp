import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/instructor/Instructor_evaluate_assignment_confirm.dart';
import 'package:svu_beta/sizehelper.dart';

class Instructor_evaluate_assignment extends StatefulWidget {
  var currentUser;
  Instructor_evaluate_assignment(this.currentUser);
  State<StatefulWidget> createState() {
    return Instructor_evaluate_assignmentstate(this.currentUser);
  }
}

class Instructor_evaluate_assignmentstate
    extends State<Instructor_evaluate_assignment> {
  var currentUser;
  Instructor_evaluate_assignmentstate(this.currentUser);
  Future<List> getStudentsAssignments() async {
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
        "select first_name,last_name,iduploaded_assignments,theuploaded_assignment_id,assign_link,course_name,assign_subject from uploaded_assignments,assignments,userstest where (uploaded_assignments_instructor = '$currentUser') and (theuploaded_assignment_id = assignment_id) and (uploaded_assignments_student = username)");
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
              'Evaluate Assignment',
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
              alignment: Alignment(0, displayWidth(context) * -0.0016),
              child: FutureBuilder(
                  future: getStudentsAssignments(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      List datalist = data;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: datalist.length,
                          itemBuilder: (BuildContext context, int index) {
                            var assignLink = data[index]['assign_link'];
                            var iduploaded_assignments =
                                data[index]['iduploaded_assignments'];
                            var theuploaded_assignment_id =
                                data[index]['theuploaded_assignment_id'];
                            var studentName = data[index]['first_name'] +
                                ' ' +
                                data[index]['last_name'];
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
                                                      Instructor_evaluate_assignment_confirm(
                                                          assignLink,
                                                          iduploaded_assignments,
                                                          theuploaded_assignment_id,
                                                          studentName))));
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
                                              '${data[index]['assign_subject']}\n${data[index]['course_name']}\n${data[index]['first_name']} ${data[index]['last_name']}',
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
