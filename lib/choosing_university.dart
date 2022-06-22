import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/constants.dart';
import 'package:svu_beta/login_withmysql.dart';
import 'package:svu_beta/sizehelper.dart';

class choosing_university extends StatefulWidget {
  choosing_university({
    Key? key,
  }) : super(key: key);

  @override
  choosing_universitystate createState() => choosing_universitystate();
}

class choosing_universitystate extends State<choosing_university> {
  final choosingController = TextEditingController();
  var university;

  Future<void> choosingUniversity() async {
    university = choosingController.text;
    final conn = await MySQLConnection.createConnection(
        host: "192.168.1.5",
        port: 3306,
        userName: "root",
        password: "zeyad123!",
        databaseName: university,
        secure: false // optional
        );
    try {
      Container(
          alignment: Alignment.center, child: CircularProgressIndicator());
      await conn.connect(timeoutMs: 5000);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => login_screen()));
    } on Exception {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Error',
        desc: 'University name may be not correct',
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
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
            image: new AssetImage("assets/images/svbg2.gif"),
            fit: BoxFit.fill,
          ))),
          Center(
              child: Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: choosingController,
              style: TextStyle(),
              cursorColor: svcursorcolor,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(14),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: svborderfocuscolor),
                      borderRadius: BorderRadius.circular(20.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  filled: true,
                  fillColor: svbordercolor),
            ),
          )),
          Align(
            alignment: Alignment(0.0, displayWidth(context) * -0.0003),
            child: SizedBox(
              child: Text(
                'Type Your University',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 24,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w800,
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, displayWidth(context) * -0.0015),
            child: SizedBox(
              child: Text(
                'Welcome To\n\n The Virtual University',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w800,
                  shadows: [
                    Shadow(
                      color: const Color(0x29ffffff),
                      offset: Offset(1, 6),
                      blurRadius: 12,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, displayWidth(context) * 0.0015),
            child: Container(
                width: displayWidth(context) * 0.33,
                height: displayHeight(context) * 0.055,
                child: ElevatedButton(
                  onPressed: () {
                    choosingUniversity();
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  child: Text(
                    'Next',
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
