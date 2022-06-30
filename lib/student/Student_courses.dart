import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/student/Student_code_course.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:svu_beta/student/student_course_name.dart';

class Student_courses extends StatefulWidget {
  String currentUser;
  var year;
  var std_id;
  Student_courses(this.currentUser, this.year, this.std_id);

  @override
  State<StatefulWidget> createState() {
    return Student_coursesstate(this.currentUser, this.year, this.std_id);
  }
}

class Student_coursesstate extends State<Student_courses> {
  String currentUser;
  var year;
  var std_id;

  Student_coursesstate(this.currentUser, this.year, this.std_id);

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
    var res = await conn.execute(
        "select coursecode,coursename,instructor,instructor_id from courses,courses_enrollments where enrolled_student = $std_id and (courses_enrollments.course_id=courses.courseid) ");
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
                        builder: (context) => Student_code_course(std_id),
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
                    'Join Course',
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
          Container(
              margin: EdgeInsets.only(top: displayWidth(context) * 0.43),
              child: FutureBuilder(
                  future: availableCourses(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      List datalist = data;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: datalist.length,
                          itemBuilder: (BuildContext context, int index) {
                            var cname = data[index]['coursename'];
                            var ccode = data[index]['coursecode'];
                            var instructor_id = data[index]['instructor_id'];

                            return Card(
                                elevation: 8,
                                shadowColor: Colors.white70,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  student_course_name(
                                                      cname: cname,
                                                      ccode: ccode,
                                                      student_id: std_id,
                                                      instructor_id:
                                                          instructor_id)));
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
                                          '${data[index]['coursecode'] + '\n' + data[index]['coursename'] + '\n' + data[index]['instructor']}',
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
