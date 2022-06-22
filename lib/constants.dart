import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:svu_beta/sizehelper.dart';

const svbordercolor = Color(0xffffffff);
const svborderfocuscolor = Color.fromARGB(255, 255, 0, 0);
const svcursorcolor = Color(0xff000000);

Widget svtextfield = Container(
  padding: EdgeInsets.all(20),
  child: TextField(
    style: TextStyle(),
    cursorColor: svcursorcolor,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: svborderfocuscolor),
            borderRadius: BorderRadius.circular(20.0)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        filled: true,
        fillColor: svbordercolor),
  ),
);

Widget svtextfield2 = Container(
  child: TextField(
    style: TextStyle(),
    cursorColor: svcursorcolor,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: svborderfocuscolor),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        filled: true,
        fillColor: svbordercolor),
  ),
);

Widget svbutton = Container(
    width: 172.0,
    height: 44.0,
    child: ElevatedButton(
      onPressed: () {},
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
    ));
