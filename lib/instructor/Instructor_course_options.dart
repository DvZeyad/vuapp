import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/instructor/Instructor_course_materials.dart';
import 'package:svu_beta/instructor/Instructor_edit_course_info.dart';
import 'package:svu_beta/instructor/Instructor_view_std.dart';

import 'package:svu_beta/sizehelper.dart';

class Instructor_course_options extends StatefulWidget {
  var cname;
  var ccode;
  var currentUser;

  Instructor_course_options(
      {Key? key,
      required this.cname,
      required this.ccode,
      required this.currentUser})
      : super(key: key);

  @override
  Instructor_course_optionsstate createState() =>
      Instructor_course_optionsstate(this.cname, this.ccode, this.currentUser);
}

class Instructor_course_optionsstate extends State<Instructor_course_options> {
  var cname;
  var ccode;
  var currentUser;
  Instructor_course_optionsstate(this.cname, this.ccode, this.currentUser);

  Future removeACourse() async {
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
      var res =
          await conn.execute("delete from courses where coursecode = '$ccode'");
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

    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              '$cname',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          ListView(padding: const EdgeInsets.all(10), children: <Widget>[
            Card(
              elevation: 2,
              shadowColor: Colors.white60,
              margin: EdgeInsets.only(top: displayHeight(context) * 0.15),
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Instructor_course_materials(
                              cname, ccode, currentUser)));
                },
                child: Text('Course Materials',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            Card(
              elevation: 2,
              shadowColor: Colors.white60,
              margin: EdgeInsets.only(top: displayHeight(context) * 0.04),
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Instructor_view_std(ccode)));
                },
                child: Text('View Students',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            Card(
              elevation: 2,
              shadowColor: Colors.white60,
              margin: EdgeInsets.only(top: displayHeight(context) * 0.04),
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Instructor_edit_course_info(ccode)));
                },
                child: Text('Edit Course Info',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            Card(
              elevation: 2,
              shadowColor: Colors.white60,
              margin: EdgeInsets.only(top: displayHeight(context) * 0.04),
              color: Colors.black,
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text('Confirm'),
                            content: Container(
                                height: displayHeight(context) * 0.103,
                                child: Column(
                                  children: [
                                    Container(
                                        child: Text(
                                      'Are you sure you want remove this course?',
                                      softWrap: true,
                                    )),
                                    Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              removeACourse();
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
                child: Text('Remove Course',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
          ]),
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
        ],
      ),
    );
  }
}
