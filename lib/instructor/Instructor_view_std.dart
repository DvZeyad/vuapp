import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/instructor/Instructor_std_profile.dart';
import 'package:svu_beta/sizehelper.dart';

class Instructor_view_std extends StatefulWidget {
  var ccode;

  Instructor_view_std(this.ccode);
  State<StatefulWidget> createState() {
    return Instructor_view_stdstate(this.ccode);
  }
}

class Instructor_view_stdstate extends State<Instructor_view_std> {
  var ccode;

  Instructor_view_stdstate(this.ccode);
  Future<Map> getEnrolledStudentsCount() async {
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
        "select count(enrolled_coursecode) as Count from courses_enrollments where enrolled_coursecode = '$ccode'");
    for (final row in res.rows) {
      var details = row.assoc();
      jsondetails.addAll(details);
    }
    print(jsondetails);
    return jsondetails;
  }

  Future<List> getEnrolledStudents() async {
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
    List jsondetails = [];

    var res = await conn.execute(
        "select first_name,last_name,id from userstest,courses_enrollments where (userstest.id = courses_enrollments.enrolled_student) and (enrolled_coursecode = '$ccode')");
    for (final row in res.rows) {
      var details = row.assoc();
      jsondetails.add(details);
    }
    print(jsondetails);
    return jsondetails;
  }

  Future removeStudent(var student_id) async {
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
          "delete from courses_enrollments where enrolled_student = '$student_id' and enrolled_coursecode = '$ccode'");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Success',
        desc: 'Course Removed Successfully',
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
              'View Students',
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
              alignment: Alignment(displayWidth(context) * -0.002,
                  displayWidth(context) * -0.00165),
              child: FutureBuilder(
                  future: getEnrolledStudentsCount(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return Text(
                        'Number Of Students : ${data['Count']} ',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 21,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w800,
                        ),
                        softWrap: false,
                      );
                    }
                    return Container();
                  })),
          Container(
            alignment: Alignment(displayWidth(context) * -0.002,
                displayWidth(context) * -0.0013),
            child: FutureBuilder(
                future: getEnrolledStudents(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    List datalist = data;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: datalist.length,
                      itemBuilder: (BuildContext context, int index) {
                        var full_name =
                            '${data[index]['first_name']} ${data[index]['last_name']}';
                        var student_id = data[index]['id'];

                        return Card(
                          elevation: 1,
                          shadowColor: Colors.white60,
                          margin: EdgeInsets.only(
                              top: displayHeight(context) * 0.01),
                          color: Colors.black,
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        alignment: Alignment.center,
                                        child: ListView(
                                            padding: EdgeInsets.only(
                                                right: 30, left: 30),
                                            shrinkWrap: true,
                                            children: [
                                              Card(
                                                  elevation: 2,
                                                  color: Colors.white,
                                                  shadowColor: Colors.black,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: ((context) =>
                                                                    Instructor_std_profile(
                                                                        student_id))));
                                                      },
                                                      child: Text(
                                                        'View Profile',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ))),
                                              Card(
                                                  elevation: 2,
                                                  color: Colors.white,
                                                  shadowColor: Colors.black,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                  title: Text(
                                                                      'Confirm'),
                                                                  content:
                                                                      Container(
                                                                          height: displayHeight(context) *
                                                                              0.103,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                  child: Text(
                                                                                'Are you sure you want remove this student?',
                                                                                softWrap: true,
                                                                              )),
                                                                              Row(
                                                                                children: [
                                                                                  TextButton(
                                                                                      onPressed: () {
                                                                                        removeStudent(student_id);
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
                                                      child: Text(
                                                        'Remove Student',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ))),
                                            ]));
                                  });
                            },
                            child: Text('$full_name',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 18,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                }),
          )
        ],
      ),
    );
  }
}
