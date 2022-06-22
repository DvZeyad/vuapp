import 'package:svu_beta/sizehelper.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:svu_beta/sizehelper.dart';
import 'package:adobe_xd/page_link.dart';
import './Instructor_create_assignments.dart';
import './Instructor_evaluate_assignment.dart';

class Instructor_assignment extends StatefulWidget {
  String currentUser;
  Instructor_assignment(this.currentUser);
  State<StatefulWidget> createState() {
    return Instructor_assignmentstate(this.currentUser);
  }
}

class Instructor_assignmentstate extends State<Instructor_assignment> {
  String currentUser;
  Instructor_assignmentstate(this.currentUser);
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
              'Assignments',
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
            alignment: Alignment(0.0, displayWidth(context) * -0.0014),
            child: Text(
              'Choose Whether To Create\nOr Evaluate Uploaded\nAssignments',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 24,
                color: const Color(0xfffffafa),
                fontWeight: FontWeight.w800,
                height: 1.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 300, start: 40.9),
            Pin(size: 33.0, middle: 0.4484),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Instructor_create_assignments(currentUser),
                ),
              ],
              child: Text(
                'Create Assignments',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 20,
                  color: const Color(0xfffffcfc),
                  fontWeight: FontWeight.w300,
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 300.0, start: 41.0),
            Pin(size: 33.0, middle: 0.5224),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Instructor_evaluate_assignment(currentUser),
                ),
              ],
              child: Text(
                'Evaluate Assignments',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 20,
                  color: const Color(0xfffffcfc),
                  fontWeight: FontWeight.w300,
                ),
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
