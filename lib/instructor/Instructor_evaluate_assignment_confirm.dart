import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:any_link_preview/any_link_preview.dart';

class Instructor_evaluate_assignment_confirm extends StatefulWidget {
  var assignLink;
  var iduploaded_assignments;
  var theuploaded_assignment_id;
  var studentName;
  Instructor_evaluate_assignment_confirm(
      this.assignLink,
      this.iduploaded_assignments,
      this.theuploaded_assignment_id,
      this.studentName);
  State<StatefulWidget> createState() {
    return Instructor_evaluate_assignment_confirmstate(
        this.assignLink,
        this.iduploaded_assignments,
        this.theuploaded_assignment_id,
        this.studentName);
  }
}

class Instructor_evaluate_assignment_confirmstate
    extends State<Instructor_evaluate_assignment_confirm> {
  var assignLink;
  var iduploaded_assignments;
  var theuploaded_assignment_id;
  var studentName;
  Instructor_evaluate_assignment_confirmstate(
      this.assignLink,
      this.iduploaded_assignments,
      this.theuploaded_assignment_id,
      this.studentName);
  var assign_degree = TextEditingController();
  Future sendDegree() async {
    var assign_degreeT = assign_degree.text;
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
          "update uploaded_assignments set degree = '$assign_degreeT' where iduploaded_assignments = '$iduploaded_assignments'");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Success',
        desc: 'Degree Assigned Successfully',
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
        body: Stack(children: <Widget>[
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
              'Evaluate Assignment',
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
              alignment: Alignment(0, displayWidth(context) * -0.0004),
              child: AnyLinkPreview(
                link: "$assignLink",
                displayDirection: UIDirection.uiDirectionHorizontal,
                showMultimedia: true,
                bodyMaxLines: 5,
                bodyTextOverflow: TextOverflow.ellipsis,
                backgroundColor: Color.fromARGB(255, 247, 233, 233),
                titleStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                bodyStyle: TextStyle(color: Colors.grey, fontSize: 12),
                errorBody: 'There may be an an error with the link',
                errorTitle: 'Loading Error',
                errorWidget: Container(
                  color: Colors.grey[900],
                  child: Text('Oops!'),
                ),
                //errorImage: "https://google.com/",
                cache: Duration(days: 7),
                borderRadius: 12,
                removeElevation: false,
                boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
                onTap: () {
                  launchURL(context, "$assignLink");
                },
              )),
          Container(
            padding: EdgeInsets.only(
                left: displayWidth(context) * 0.1,
                right: displayWidth(context) * 0.1),
            alignment: Alignment(0.0, displayWidth(context) * 0.0005),
            child: TextFormField(
              controller: assign_degree,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  hintText: "Assignment Degree / 10",
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
          Container(
            alignment: Alignment(0, displayWidth(context) * -0.001),
            child: Text('$studentName Assignment',
                softWrap: true,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: displayHeight(context) * 0.85,
                  left: displayWidth(context) * 0.255),
              width: 200.0,
              height: 44.0,
              child: ElevatedButton(
                onPressed: () {
                  sendDegree();
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
        ]));
  }
}
