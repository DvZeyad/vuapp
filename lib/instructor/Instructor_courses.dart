import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/instructor/Instructor_course_options.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Instructor_add_course_1st.dart';

class Instructor_courses extends StatefulWidget {
  String currentUser;

  Instructor_courses(this.currentUser);

  State<StatefulWidget> createState() {
    return Instructor_coursesstate(this.currentUser);
  }
}

class Instructor_coursesstate extends State<Instructor_courses> {
  String currentUser;

  Instructor_coursesstate(this.currentUser);

  Future<List> availableCourses() async {
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
    List courseslist = [];
    var res =
        await conn.execute("select coursecode,coursename,year from courses");
    for (final row in res.rows) {
      var details = row.assoc();
      courseslist.add(details);
    }
    print(courseslist);
    await conn.close();
    return courseslist;
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
              'Courses',
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
            alignment: Alignment(displayWidth(context) * 0.0021,
                displayWidth(context) * -0.0016),
            child: Container(
                width: 165,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Instructor_add_course_1st(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 17, 0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  child: Text(
                    'Add Course',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                )),
          ),
          Align(
            alignment: Alignment(displayWidth(context) * -0.002,
                displayWidth(context) * -0.0013),
            child: Text(
              'Courses I Teach',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 24,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w800,
                shadows: [
                  Shadow(
                    color: const Color(0x29f2f2f2),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              softWrap: false,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: displayWidth(context) * 0.55),
              child: FutureBuilder(
                  future: availableCourses(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      List datalist = data;
                      return ListView.builder(
                          padding: EdgeInsets.all(25),
                          shrinkWrap: true,
                          itemCount: datalist.length,
                          itemBuilder: (BuildContext context, int index) {
                            var cname = data[index]['coursename'];
                            var ccode = data[index]['coursecode'];
                            return Card(
                                elevation: 8,
                                shadowColor: Colors.white70,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Instructor_course_options(
                                                    cname: cname,
                                                    ccode: ccode,
                                                    currentUser: currentUser,
                                                  )));
                                    },
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          Size.fromWidth(
                                              displayWidth(context) * 0.85)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                    ),
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            right:
                                                displayWidth(context) * 0.25),
                                        child: Text(
                                          '${data[index]['coursecode'] + '\n' + data[index]['coursename'] + '\n' + 'Year ' + data[index]['year']}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              height: 1.7),
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
