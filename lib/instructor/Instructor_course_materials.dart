import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:svu_beta/instructor/Inst_upload_material.dart';
import 'package:svu_beta/sizehelper.dart';

class Instructor_course_materials extends StatefulWidget {
  var cname;
  var ccode;
  var currentUser;
  Instructor_course_materials(this.cname, this.ccode, this.currentUser);
  State<StatefulWidget> createState() {
    return Instructor_course_materialsstate(
        this.cname, this.ccode, this.currentUser);
  }
}

class Instructor_course_materialsstate
    extends State<Instructor_course_materials> {
  var cname;
  var ccode;
  var currentUser;
  Instructor_course_materialsstate(this.cname, this.ccode, this.currentUser);

  Future<List> availableMaterials() async {
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
    List jsondetails = [];
    var res = await conn.execute(
        "select title,file_link from courses_materials where material_course_id = (select courseid from courses where coursecode = '$ccode')");
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
                width: displayWidth(context) * 0.44,
                height: displayHeight(context) * 0.045,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Inst_upload_material(
                                cname, ccode, currentUser))));
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 17, 0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  child: Text(
                    'Add Materials',
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
              margin: EdgeInsets.only(top: displayWidth(context) * 0.45),
              alignment: Alignment(0.0, 0.0),
              child: FutureBuilder(
                  future: availableMaterials(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      List dataList = data;
                      return ListView.builder(
                          itemCount: dataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(),
                                  child: Text(
                                    '${data[index]['title']}\n',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                    height: 120,
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: AnyLinkPreview(
                                      link: "${data[index]['file_link']}",
                                      displayDirection:
                                          UIDirection.uiDirectionHorizontal,
                                      showMultimedia: true,
                                      bodyMaxLines: 5,
                                      bodyTextOverflow: TextOverflow.ellipsis,
                                      backgroundColor:
                                          Color.fromARGB(255, 247, 233, 233),
                                      titleStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      bodyStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      errorBody:
                                          'There may be an an error with the link',
                                      errorTitle: 'Loading Error',
                                      errorWidget: Container(
                                        color: Colors.grey[900],
                                        child: Text('Oops!'),
                                      ),
                                      //errorImage: "https://google.com/",
                                      cache: Duration(days: 7),
                                      borderRadius: 12,
                                      removeElevation: false,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3, color: Colors.grey)
                                      ],
                                      onTap: () {
                                        launchURL(context,
                                            '${data[index]['file_link']}');
                                      },
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          });
                    }
                    return Container();
                  })),
        ],
      ),
    );
  }
}
