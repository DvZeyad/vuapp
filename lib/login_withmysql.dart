import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:svu_beta/constants.dart';
import 'package:svu_beta/instructor/Instructor_dashboard.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:svu_beta/student_dashboard.dart';
import 'package:mysql_client/mysql_client.dart';

class login_screen extends StatefulWidget {
  login_screen({
    Key? key,
  }) : super(key: key);

  @override
  login_screenstate createState() => login_screenstate();
}

class login_screenstate extends State<login_screen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var username;
  var password;
  var year;
  var std_id;

  Future<void> login() async {
    username = usernameController.text;
    password = passwordController.text;
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
    try {
      await conn.connect();
    } on Exception {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Error',
        desc: 'Error Connecting to Database',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    }

    print("Connected");

    var res = await conn.execute(
        "SELECT id,year FROM userstest where username = '$username' and password = '$password'");
    if (res.rows.isEmpty == true) {
      print("Empty");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Error',
        desc: 'Invalid Username or Password',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    }
    for (final row in res.rows) {
      var count = row.assoc();
      year = count['year'];
      std_id = count['id'];
      print(count.length);
      if (count.length == 2) {
        showDialog(
            context: context,
            builder: (context) {
              return SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              );
            });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => student_dashboard(username, year, std_id),
          ),
        );
      }

      // print all rows as Map<String, String>
      print(row.assoc());
      print(year);
    }
    // close all connections
    await conn.close();
  }

  Future<void> loginAsInstructor() async {
    username = usernameController.text;
    password = passwordController.text;
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
        "SELECT id FROM instructorstest where username = '$username' and password = '$password'");
    if (res.rows.isEmpty == true) {
      print("Empty");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Error',
        desc: 'Invalid Username or Password',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    }
    for (final row in res.rows) {
      var count = row.assoc();
      if (count.length == 1) {
        showDialog(
            context: context,
            builder: (context) {
              return SizedBox(
                width: 60,
                height: 60,
              );
            });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Instructor_dashboard(username),
          ),
        );
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Invalid Username or Password"),
              );
            });
      }

      // print all rows as Map<String, String>
      print(row.assoc());
    }

    // close all connections
    await conn.close();
  }

  getUsername() {
    final username = usernameController.text;
    return username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                image: new AssetImage("assets/images/svbg2.gif"),
                fit: BoxFit.fill,
              )))
            ],
          ),
          Pinned.fromPins(
              Pin(start: 26.0, end: 25.0), Pin(size: 43.0, middle: 0.4632),
              child: Container(
                child: TextField(
                  controller: usernameController,
                  style: TextStyle(),
                  cursorColor: svcursorcolor,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: svborderfocuscolor),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: svbordercolor),
                ),
              )), //username
          Pinned.fromPins(
              Pin(start: 26.0, end: 25.0), Pin(size: 43.0, middle: 0.5922),
              child: Container(
                child: TextField(
                  controller: passwordController,
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
                    fillColor: svbordercolor,
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              )), //password
          Align(
            alignment: Alignment(-0.607, -0.173),
            child: SizedBox(
              child: Text(
                'Username',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w800,
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.613, 0.074),
            child: SizedBox(
              child: Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w800,
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.417),
            child: Container(
                width: displayWidth(context) * 0.6,
                height: 44.0,
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  child: Text(
                    'Login As Student',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )),
          ),

          Align(
            alignment: Alignment(0, -0.575),
            child: SizedBox(
              child: Text(
                'Welcome To\n The Virtual University',
                style: TextStyle(
                  height: 1.8,
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
            alignment: Alignment(0, 0.628),
            child: SizedBox(
                width: displayWidth(context) * 0.6,
                height: 44.0,
                child: ElevatedButton(
                  onPressed: () {
                    //loginAsInstructor
                    loginAsInstructor();
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  child: Text(
                    'Login As Instructor',
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
