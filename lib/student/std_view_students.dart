import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';
import './oth_student_profile.dart';

class std_view_students extends StatefulWidget {
  var ccode;
  std_view_students(this.ccode);
  State<StatefulWidget> createState() {
    return std_view_studentsstate(this.ccode);
  }
}

class std_view_studentsstate extends State<std_view_students> {
  var ccode;
  std_view_studentsstate(this.ccode);
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
                                                                    oth_student_profile(
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
                                                      )))
                                            ]));
                                  });
                            },
                            child: Text(
                                '${data[index]['first_name']} ${data[index]['last_name']}',
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
          ),
          Align(
            alignment: Alignment(0, displayHeight(context) * 0.001),
            child: SizedBox(
                width: displayWidth(context) * 0.55,
                height: 44.0,
                child: ElevatedButton(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                )));*/
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  child: Text(
                    'Message',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
