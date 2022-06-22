import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import './Instructor_exam_form_q.dart';
import 'package:svu_beta/sizehelper.dart';

class Instructor_addexam extends StatefulWidget {
  State<StatefulWidget> createState() {
    return Instructor_addexamstate();
  }
}

class Instructor_addexamstate extends State<Instructor_addexam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Examination',
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
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.15),
                child: Text(
                  'Please, Fill These Information',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w800,
                    shadows: [
                      Shadow(
                        color: const Color(0x29ffffff),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.035),
                alignment: Alignment(0.0, displayWidth(context) * -0.001),
                width: displayWidth(context) * 0.92,
                child: TextFormField(
                  //controller: coursename,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Exam Title",
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
                  //controller: coursecode,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Exam Score",
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
                  //controller: courseyear,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Exam Duration In Minutes",
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
                  //controller: coursedesc,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Number of Questions",
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
                  margin: EdgeInsets.only(left: 120, right: 120),
                  child: ElevatedButton(
                    onPressed: () {
                      //
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
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )),
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
