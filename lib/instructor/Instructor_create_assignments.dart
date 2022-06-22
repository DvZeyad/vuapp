import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';


class Instructor_create_assignments extends StatefulWidget {
  String currentUser;
  Instructor_create_assignments(this.currentUser);
  State<StatefulWidget> createState() {
    return Instructor_create_assignmentsstate(this.currentUser);
  }
}

class Instructor_create_assignmentsstate
    extends State<Instructor_create_assignments> {
  String currentUser;
  Instructor_create_assignmentsstate(this.currentUser);
  final coursename = TextEditingController();
  final assignsubject = TextEditingController();
  final assigndesc = TextEditingController();

  var coursenameT;
  var assignsubjectT;
  var assigndescT;
  Future<void> sendData() async {
    coursenameT = coursename.text;
    assignsubjectT = assignsubject.text;
    assigndescT = assigndesc.text;

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
          "Insert into assignments(course_name,assign_subject,assign_desc,instructor,year) values ('$coursenameT','$assignsubjectT','$assigndescT','$currentUser',(select year from courses where coursename = '$coursenameT'))");

      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Success',
        desc: 'Assignment Has Been Created Successfuly',
        btnOkOnPress: () {
          Navigator.pop(context
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
        desc: 'An Error Occured While Creating Assignment',
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
              'Create Assignment',
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
                      hintText: "Course Name / ID",
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
                  maxLength: 35,
                  controller: assignsubject,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Assignment Title",
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
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(),
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
                child: TextFormField(
                  controller: assigndesc,
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
              SizedBox(height: displayHeight(context) * 0.35),
              Container(
                  margin: EdgeInsets.only(left: 120, right: 120),
                  child: ElevatedButton(
                    onPressed: () {
                      sendData();
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
