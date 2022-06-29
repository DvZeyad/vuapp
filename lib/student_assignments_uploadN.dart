import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';

class student_assignments_upload extends StatefulWidget {
  String currentUser;
  var assignment_desc;
  var assignment_id;
  var instructor;
  student_assignments_upload(this.currentUser, this.assignment_desc,
      this.assignment_id, this.instructor);
  @override
  State<StatefulWidget> createState() {
    return student_assignments_uploadstate(this.currentUser,
        this.assignment_desc, this.assignment_id, this.instructor);
  }
}

class student_assignments_uploadstate
    extends State<student_assignments_upload> {
  var mat_link = TextEditingController();
  String currentUser;
  var assignment_desc;
  var assignment_id;
  var instructor;
  student_assignments_uploadstate(this.currentUser, this.assignment_desc,
      this.assignment_id, this.instructor);

  Future<void> dbconnectandupload() async {
    var mat_linkT = mat_link.text;

    print("Connecting to mysql server...");
    // create connection
    final conn = await MySQLConnection.createConnection(
        host: "192.168.1.5",
        port: 3306,
        userName: "root",
        password: "zeyad123!",
        databaseName: "svu_db",
        secure: false);
    await conn.connect();
    print("Connected");
    try {
      var res = await conn.execute(
          "Insert into uploaded_assignments(assign_link,uploaded_assignments_student,uploaded_assignments_instructor,theuploaded_assignment_id) values ('$mat_linkT','$currentUser','$instructor','$assignment_id')");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Success',
        desc: 'Assignment Sent Successfully',
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

  Future getDegree() async {
    print("Connecting to mysql server...");
    // create connection
    final conn = await MySQLConnection.createConnection(
        host: "192.168.1.5",
        port: 3306,
        userName: "root",
        password: "zeyad123!",
        databaseName: "svu_db",
        secure: false);
    await conn.connect();
    print("Connected");
    List jsondetails = [];
    var res = await conn.execute(
        "select degree from uploaded_assignments where uploaded_assignments_student='$currentUser' and theuploaded_assignment_id = '$assignment_id'");
    for (final row in res.rows) {
      var details = row.assoc();
      jsondetails.add(details);
    }
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
              'Upload Your Work',
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
            alignment: Alignment(0.0, displayWidth(context) * -0.0015),
            child: SizedBox(
              child: Text(
                'Add A Link For Your Work Here',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 23,
                  color: const Color(0xfffffcfc),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          Container(
            alignment: Alignment(0.0, displayWidth(context) * -0.001),
            padding: EdgeInsets.only(
                right: displayWidth(context) * 0.03,
                left: displayWidth(context) * 0.03),
            child: TextFormField(
              controller: mat_link,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  hintText: "Material link",
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
          Align(
            alignment: Alignment(0.0, displayWidth(context) * -0.0006),
            child: SizedBox(
              child: Text(
                '$assignment_desc',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 18,
                  color: const Color(0xfffffcfc),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0),
            child: SizedBox(
              child: Text(
                'Your Degree / 10',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 23,
                  color: const Color(0xfffffcfc),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Container(
              alignment: Alignment(0, displayWidth(context) * 0.0008),
              child: FutureBuilder(
                  future: getDegree(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      print(data);
                      return Text(
                        'Your Degree is ${data[0]['degree']}',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      );
                    } else {
                      return Text(
                        'Instructor Did not review your work yet',
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  })),
          Container(
              margin: EdgeInsets.only(
                  top: displayHeight(context) * 0.85,
                  left: displayWidth(context) * 0.255),
              width: 200.0,
              height: 44.0,
              child: ElevatedButton(
                onPressed: () {
                  dbconnectandupload();
                },
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 129, 120)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 20,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              )),
        ],
      ),
    );
  }
}
