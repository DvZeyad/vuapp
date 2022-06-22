import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';

class Inst_student_attendance extends StatefulWidget {
  String currentUser;
  Inst_student_attendance(this.currentUser);
  @override
  State<StatefulWidget> createState() {
    return Inst_student_attendancestate(this.currentUser);
  }
}

class Inst_student_attendancestate extends State<Inst_student_attendance> {
  String currentUser;
  Inst_student_attendancestate(this.currentUser);
  var datetime = DateTime.now();
  var counter = 0;
  var jsondetails = new Map();
  List attendanceDetails = [];

  @override
  void initState() {
    getAttendance();
  }

  void refreshList() {
    setState(() {
      jsondetails = jsondetails;
    });
  }

  Future<List> getAttendance() async {
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
        "select MONTH(attendance_date) as Month,COUNT(attendance_date) as Count from attendance where attendance_user_id = '$currentUser' and MONTH(attendance_date) IS NOT NULL");
    for (final row in res.rows) {
      var details = row.assoc();
      attendanceDetails.add(details);
    }
    print(jsondetails);
    await conn.close();
    return attendanceDetails;
  }

  @override
  Widget build(BuildContext context) {
    getAttendance();
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
              'Attendance',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Stack(
            children: [
              Align(
                  alignment: Alignment(displayWidth(context) * -0.002,
                      displayWidth(context) * -0.0014),
                  child: Text(
                    'Year ${datetime.year}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  )),
              Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.only(top: displayWidth(context) * 0.52),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                            future: getAttendance(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data;
                                var abnumber = int.parse(data[index]["Count"]);
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: displayWidth(context) *
                                                    0.05),
                                            height: 60,
                                            width: 60,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.red,
                                            ),
                                            child: Text(
                                              '${data[index]["Month"]}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: displayWidth(context) *
                                                    0.06),
                                            height: 60,
                                            width: 130,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Text(
                                                '${data[index]["Count"]}\nPresent',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        Colors.greenAccent))),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: displayWidth(context) *
                                                    0.06),
                                            height: 60,
                                            width: 130,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Color.fromARGB(
                                                  255, 246, 182, 177),
                                            ),
                                            child: Text(
                                              '${(datetime.day - abnumber)}\nAbscent',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.redAccent),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                );
                              }
                              return Container(
                                child: CircularProgressIndicator(),
                              );
                            });
                      })),
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
            ],
          )
        ],
      ),
    );
  }
}
