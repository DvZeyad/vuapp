import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import '../sizehelper.dart';

class student_view_instructor extends StatefulWidget {
  var instructor_id;
  student_view_instructor(this.instructor_id);
  State<StatefulWidget> createState() {
    return student_view_instructorstate(this.instructor_id);
  }
}

class student_view_instructorstate extends State<student_view_instructor> {
  var instructor_id;
  student_view_instructorstate(this.instructor_id);

  Future<List> profiledetails() async {
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
        "select first_name,last_name,phone_number,date_of_birth,email,state from instructorstest where id = '$instructor_id'");
    for (final row in res.rows) {
      var details = row.assoc();
      jsondetails.add(details);
    }
    print(jsondetails);
    await conn.close();
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
            offset: Offset(0, displayHeight(context) * 0.453),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff000000),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1.0, -0.118),
            child: SizedBox(
              width: 25.0,
              height: 25.0,
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
          ),
          Align(
            alignment: Alignment(-1.0, -0.160),
            child: Container(
              width: displayWidth(context) * 0.13,
              height: displayHeight(context) * 0.057,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Container(
            alignment: Alignment(displayWidth(context) * -0.0013,
                displayWidth(context) * -0.00203),
            child: Text(
              'Profile',
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
          Align(
              alignment: Alignment(0.0, displayWidth(context) * -0.001),
              child: SizedBox(
                height: 28.0,
                child: FutureBuilder(
                  future: profiledetails(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return Text(
                        '${data[0]['first_name']} ${data[0]['last_name']}\nYear ${data[0]['year']}',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 24,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )),
          Align(
              alignment: Alignment(0, displayWidth(context) * 0.001),
              child: FutureBuilder(
                  future: profiledetails(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.06),
                          children: [
                            Text(
                              'Phone Number: ${data[0]['phone_number']}\nDate of Birth: ${data[0]['date_of_birth']}\nE-mail Address: ${data[0]['email']}\nState: ${data[0]['state']}',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                                color: const Color(0xfffcefef),
                                fontWeight: FontWeight.w500,
                                height: 2.875,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ]);
                    }
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  })),
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
