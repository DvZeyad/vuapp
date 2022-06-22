import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';

class Instructor_edit_course_info extends StatefulWidget {
  var ccode;
  Instructor_edit_course_info(this.ccode);
  State<StatefulWidget> createState() {
    return Instructor_edit_course_infostate(this.ccode);
  }
}

class Instructor_edit_course_infostate
    extends State<Instructor_edit_course_info> {
  var ccode;
  Instructor_edit_course_infostate(this.ccode);
  final coursename = TextEditingController();
  final coursecode = TextEditingController();
  final coursedesc = TextEditingController();
  final accesscode = TextEditingController();
  final courseduration = TextEditingController();

  var coursenameT;
  var coursecodeT;
  var coursedescT;
  var accesscodeT;
  var coursedurationT;

  Future<void> updateData() async {
    coursenameT = coursename.text;
    coursecodeT = coursecode.text;
    coursedescT = coursedesc.text;
    accesscodeT = accesscode.text;
    coursedurationT = courseduration.text;

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
        "update courses set (coursecode='$coursecodeT',coursename='$coursenameT',course_description='$coursedescT',course_accesscode='$accesscodeT',duration=$coursedurationT) where coursecode = '$ccode'");
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
              'Edit Course Info.',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          ListView(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.19),
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
                child: TextFormField(
                  controller: coursename,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Course Name",
                      hintStyle: TextStyle(color: Colors.white54),
                      contentPadding: const EdgeInsets.all(14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(),
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
                child: TextFormField(
                  controller: coursecode,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Course Code",
                      hintStyle: TextStyle(color: Colors.white54),
                      contentPadding: const EdgeInsets.all(14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(),
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
                child: TextFormField(
                  controller: coursedesc,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Description",
                      hintStyle: TextStyle(color: Colors.white54),
                      contentPadding: const EdgeInsets.all(14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(),
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
                child: TextFormField(
                  controller: accesscode,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Access Code",
                      hintStyle: TextStyle(color: Colors.white54),
                      contentPadding: const EdgeInsets.all(14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(),
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
                child: TextFormField(
                  controller: courseduration,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Course Duration in Weeks",
                      hintStyle: TextStyle(color: Colors.white54),
                      contentPadding: const EdgeInsets.all(14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.black),
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.1),
              Container(
                  margin: EdgeInsets.only(left: 120, right: 120),
                  child: ElevatedButton(
                    onPressed: () {
                      updateData();
                    },
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.red),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0)))),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ))
            ],
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
        ],
      ),
    );
  }
}
