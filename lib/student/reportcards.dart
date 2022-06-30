import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:svu_beta/sizehelper.dart';

class reportcards extends StatefulWidget {
  String currentUser;
  reportcards(this.currentUser);
  @override
  State<StatefulWidget> createState() {
    return reportcardsstate(this.currentUser);
  }
}

class reportcardsstate extends State<reportcards> {
  String currentUser;
  reportcardsstate(this.currentUser);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Pinned.fromPins(
            Pin(size: 1.0, start: 0.0),
            Pin(size: 1.0, start: 82.0),
            child: SvgPicture.string(
              _svg_uz27rc,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
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
              'Report Cards',
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
            alignment: Alignment(-0.960, displayWidth(context) * -0.00211),
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
          Transform.translate(
            offset: Offset(150.0, 128.0),
            child: Text(
              'Culture and Science\nCity.\n',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          Transform.translate(
            offset: Offset(150.0, 177.0),
            child: Text(
              'High Institute of Computer \nScience and Information\nSystems.',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color: const Color(0xfffffdfd),
              ),
              softWrap: false,
            ),
          ),
          Transform.translate(
            offset: Offset(20.5, 390.5),
            child: SizedBox(
              width: 335.0,
              height: 37.0,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(59.3, 8.5),
                    child: SizedBox(
                      width: 217.0,
                      child: Text(
                        'ATTENDANCE',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 335.0,
                    height: 37.0,
                    child: SvgPicture.string(
                      _svg_wce3fh,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(20.5, 681.5),
            child: SizedBox(
              width: 335.0,
              height: 37.0,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(36.3, 8.5),
                    child: SizedBox(
                      width: 263.0,
                      child: Text(
                        'ACADMIC PERFORMANCE',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 335.0,
                    height: 37.0,
                    child: SvgPicture.string(
                      _svg_gsvowq,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(92.0, 313.0),
            child: Text(
              'Mahytab Adel',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Transform.translate(
            offset: Offset(92.0, 342.0),
            child: Text(
              'Year IV',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color: const Color(0x99ffffff),
              ),
              softWrap: false,
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 480.0),
            child: Container(
              width: 336.0,
              height: 64.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 582.0),
            child: SizedBox(
              width: 336.0,
              height: 64.0,
              child: SvgPicture.string(
                _svg_in2k3t,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(66.5, 492.0),
            child: SizedBox(
              width: 243.0,
              child: Text(
                '235 / 249 Days',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  color: const Color(0xffff0000),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(66.5, 594.0),
            child: SizedBox(
              width: 243.0,
              child: Text(
                '235 / 249 Days',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  color: const Color(0xffff0000),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(42.5, 516.0),
            child: SizedBox(
              width: 291.0,
              child: Text(
                'Total attendance of the student',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  color: const Color(0xffff0000),
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(42.5, 618.0),
            child: SizedBox(
              width: 291.0,
              child: Text(
                'Total attendance of the student',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  color: const Color(0xffff0000),
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 780.0),
            child: Text(
              'Term I',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 732.0),
            child: SizedBox(
              width: 336.0,
              height: 242.0,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0.0, 29.0),
                    child: Container(
                      width: 336.0,
                      height: 213.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffe8eaec),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Text(
                    'Term I',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      color: const Color(0xfffff7f7),
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: false,
                  ),
                  Transform.translate(
                    offset: Offset(20.0, 46.0),
                    child: Text(
                      'Subject',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0.0, 75.0),
                    child: SizedBox(
                      width: 336.0,
                      height: 155.0,
                      child: SingleChildScrollView(
                        primary: false,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          runSpacing: 27,
                          children: [{}, {}, {}].map((itemData) {
                            return SizedBox(
                              width: 336.0,
                              height: 25.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 336.0,
                                    height: 25.0,
                                    color: const Color(0x80ffffff),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(20.0, 79.0),
                    child: Text(
                      'English\nMath I\nProgramming\nIntro. to CS\nPhysics\nProbability',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        height: 1.8571428571428572,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(74.0, 79.0),
                    child: SizedBox(
                      width: 186.0,
                      child: Text(
                        'A+/96\nA/90\nA-/94\nA+/96\nA/90\nA-/94',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xff000000),
                          height: 1.8571428571428572,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(106.5, 79.0),
                    child: SizedBox(
                      width: 251.0,
                      child: Text(
                        'A+/96\nA/90\nA-/94\nA+/96\nA/90\nA-/94',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xff000000),
                          height: 1.8571428571428572,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(140.5, 79.0),
                    child: SizedBox(
                      width: 319.0,
                      child: Text(
                        'A+/96\nA/90\nA-/94\nA+/96\nA/90\nA-/94',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xffff0000),
                          fontWeight: FontWeight.w700,
                          height: 1.8571428571428572,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.007, -0.61),
                    child: SizedBox(
                      width: 30.0,
                      height: 32.0,
                      child: Text(
                        'Med\nTerm',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.464, -0.61),
                    child: SizedBox(
                      width: 60.0,
                      height: 32.0,
                      child: Text(
                        'Semester\nWork',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 30.0, end: 21.0),
                    Pin(size: 16.0, middle: 0.2168),
                    child: Text(
                      'Final',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 1024.0),
            child: SizedBox(
              width: 336.0,
              height: 239.0,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0.0, 26.0),
                    child: Container(
                      width: 336.0,
                      height: 213.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffe8eaec),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Text(
                    'Term II',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: false,
                  ),
                  Transform.translate(
                    offset: Offset(20.0, 43.0),
                    child: Text(
                      'Subject',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0.0, 72.0),
                    child: SizedBox(
                      width: 336.0,
                      height: 155.0,
                      child: SingleChildScrollView(
                        primary: false,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          runSpacing: 27,
                          children: [{}, {}, {}].map((itemData) {
                            return SizedBox(
                              width: 336.0,
                              height: 25.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 336.0,
                                    height: 25.0,
                                    color: const Color(0x80ffffff),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(74.0, 76.0),
                    child: SizedBox(
                      width: 186.0,
                      child: Text(
                        'A+/96\nA/90\nA-/94\nA+/96\nA/90\nA-/94',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xff000000),
                          height: 1.8571428571428572,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(106.5, 76.0),
                    child: SizedBox(
                      width: 251.0,
                      child: Text(
                        'A+/96\nA/90\nA-/94\nA+/96\nA/90\nA-/94',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xff000000),
                          height: 1.8571428571428572,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(140.5, 76.0),
                    child: SizedBox(
                      width: 319.0,
                      child: Text(
                        'A+/96\nA/90\nA-/94\nA+/96\nA/90\nA-/94',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xffff0000),
                          fontWeight: FontWeight.w700,
                          height: 1.8571428571428572,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 1317.0),
            child: SizedBox(
              width: 336.0,
              height: 242.0,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0.0, 29.0),
                    child: Container(
                      width: 336.0,
                      height: 213.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffe8eaec),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Text(
                    'Final',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: false,
                  ),
                  Transform.translate(
                    offset: Offset(20.0, 46.0),
                    child: Text(
                      'Subject',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0.0, 75.0),
                    child: SizedBox(
                      width: 336.0,
                      height: 155.0,
                      child: SingleChildScrollView(
                        primary: false,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          runSpacing: 27,
                          children: [{}, {}, {}].map((itemData) {
                            return SizedBox(
                              width: 336.0,
                              height: 25.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 336.0,
                                    height: 25.0,
                                    color: const Color(0x80ffffff),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(114.5, 79.0),
                    child: SizedBox(
                      width: 267.0,
                      child: Text(
                        'A+/96\nA/90\nA-/94\nA+/96\nA/90\nA-/94',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xffff0019),
                          fontWeight: FontWeight.w700,
                          height: 1.8571428571428572,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0.0, 46.0),
                    child: SizedBox(
                      width: 259.0,
                      child: Text(
                        'Total',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(22.0, 79.0),
                    child: Text(
                      'English\nMath I\nProgramming\nIntro. to CS\nPhysics\nProbability',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        height: 1.8571428571428572,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(21.0, 1017.0),
            child: Text(
              'Term II',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18,
                color: const Color(0xfffff0f0),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Transform.translate(
            offset: Offset(31.0, 134.0),
            child:
                // Adobe XD layer: 'images' (shape)
                Container(
              width: 103.0,
              height: 78.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 1100.0),
            child: Text(
              'English\nMath I\nProgramming\nIntro. to CS\nPhysics\nProbability',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                height: 1.8571428571428572,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, end: 40.0),
            Pin(size: 16.0, middle: 0.6753),
            child: Text(
              'Final',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.5, end: 19.5),
            Pin(size: 37.0, start: 248.5),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.0, -0.056),
                  child: SizedBox(
                    width: 60.0,
                    height: 19.0,
                    child: Text(
                      'PROFILE',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, start: 0.0),
                  child: SvgPicture.string(
                    _svg_e6fs5q,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_ciry,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-0.02, 0.354),
            child: SizedBox(
              width: 30.0,
              height: 32.0,
              child: Text(
                'Med\nTerm',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.39, 0.354),
            child: SizedBox(
              width: 60.0,
              height: 32.0,
              child: Text(
                'Semester\nWork',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 55.0, start: 26.0),
            Pin(size: 55.0, middle: 0.1969),
            child:
                // Adobe XD layer: 'profile_512(1)' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_uz27rc =
    '<svg viewBox="0.0 82.0 1.0 1.0" ><path transform="translate(104.0, -1460.0)" d="M -104 1542" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wce3fh =
    '<svg viewBox="20.5 237.5 335.0 37.0" ><path transform="translate(20.5, 237.5)" d="M 0 0 L 335 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(20.5, 274.5)" d="M 0 0 L 335 0" fill="#ffffff" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gsvowq =
    '<svg viewBox="20.5 237.5 335.0 37.0" ><path transform="translate(20.5, 237.5)" d="M 0 0 L 335 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(20.5, 274.5)" d="M 0 0 L 335 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_in2k3t =
    '<svg viewBox="20.0 582.0 336.0 64.0" ><path transform="translate(20.0, 582.0)" d="M 10 0 L 326 0 C 331.5228576660156 0 336 4.477152347564697 336 10 L 336 54 C 336 59.52284622192383 331.5228576660156 64 326 64 L 10 64 C 4.477152347564697 64 0 59.52284622192383 0 54 L 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e6fs5q =
    '<svg viewBox="20.5 237.5 335.0 1.0" ><path transform="translate(20.5, 237.5)" d="M 0 0 L 335 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ciry =
    '<svg viewBox="20.5 274.5 335.0 1.0" ><path transform="translate(20.5, 274.5)" d="M 0 0 L 335 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
