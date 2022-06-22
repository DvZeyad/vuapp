import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';

class Inst_upload_material extends StatefulWidget {
  var cname;
  var ccode;
  var currentUser;
  Inst_upload_material(this.cname, this.ccode, this.currentUser);
  State<StatefulWidget> createState() {
    return Inst_upload_materialstate(this.cname, this.ccode, this.currentUser);
  }
}

class Inst_upload_materialstate extends State<Inst_upload_material> {
  var cname;
  var ccode;
  var currentUser;
  Inst_upload_materialstate(this.cname, this.ccode, this.currentUser);

  var mat_desc = TextEditingController();
  var mat_link = TextEditingController();

  Future<void> dbconnectandupload() async {
    var mat_descT = mat_desc.text;
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
          "Insert into courses_materials(title,material_course_id,file_link,uploaded_inst_id) values ('$mat_descT',(select courseid from courses where coursecode = '$ccode'),'$mat_linkT',(select id from instructorstest where username ='$currentUser'))");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Success',
        desc: 'Material Added Successfully',
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
              'Courses Materials',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.0, displayWidth(context) * -0.0015),
            child: SizedBox(
              child: Text(
                'Add A Link And A Description To The Material',
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
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            children: [
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.4),
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
                child: TextFormField(
                  controller: mat_desc,
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
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
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
            ],
          ),
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
