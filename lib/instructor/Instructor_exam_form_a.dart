import 'package:svu_beta/sizehelper.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Instructor_exam_form_q.dart';
import 'package:adobe_xd/page_link.dart';
import './Instructor_Examination.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Instructor_exam_form_a extends StatelessWidget {
  Instructor_exam_form_a({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(displayWidth(context) * 0, displayHeight(context) * 0.1351),
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
          Pinned.fromPins(
            Pin(size: 49.0, start: 0.0),
            Pin(size: 49.0, start: 46.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Instructor_exam_form_q(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, middle: 0.1815),
            Pin(size: 23.0, start: 57.0),
            child: Text(
              'Exam',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Container(),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 391.0, start: 154.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 95.0,
                    height: 23.0,
                    child: Text(
                      'Question 1',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 115.0, start: 39.0),
                  child: SvgPicture.string(
                    _svg_z057jp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 18.0, end: 8.0),
                  Pin(size: 94.0, start: 52.0),
                  child: Text(
                    'Praesent ultricies mauris eu eros malesuada, accumsan lacinia risus commodo. In vestibulum tortor in magna condimentum pharetra. Praesent ultricies mauris eu eros malesuada, accumsan lacinia risus commodo?',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 36.0, end: 48.0),
                  Pin(size: 192.0, end: 16.0),
                  child: Text(
                    'Suspendisse egestas tellu\nMorbi et diam vulputate\nPraesent ut tellus consectetur\nIn vestibulum tortor in magna pharetra.\nMaecenas ut ex vehicula, efficitur ',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      height: 3.142857142857143,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 24.0, start: 5.0),
                  Pin(size: 211.0, end: 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [{}, {}, {}, {}, {}].map((itemData) {
                        return SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  border: Border.all(
                                      width: 2.0,
                                      color: const Color(0xff707070)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 12.0, start: 11.0),
                  Pin(size: 12.0, middle: 0.6069),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff000000),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 391.0, middle: 0.5217),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 104.0,
                    height: 23.0,
                    child: Text(
                      'Question 2 ',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 115.0, start: 39.0),
                  child: SvgPicture.string(
                    _svg_z057jp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 18.0, end: 8.0),
                  Pin(size: 94.0, start: 52.0),
                  child: Text(
                    'Praesent ultricies mauris eu eros malesuada, accumsan lacinia risus commodo. In vestibulum tortor in magna condimentum pharetra. Praesent ultricies mauris eu eros malesuada, accumsan lacinia risus commodo?',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 36.0, end: 48.0),
                  Pin(size: 192.0, end: 16.0),
                  child: Text(
                    'Suspendisse egestas tellu\nMorbi et diam vulputate\nPraesent ut tellus consectetur\nIn vestibulum tortor in magna pharetra.\nMaecenas ut ex vehicula, efficitur ',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      height: 3.142857142857143,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 24.0, start: 5.0),
                  Pin(size: 211.0, end: 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [{}, {}, {}, {}, {}].map((itemData) {
                        return SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  border: Border.all(
                                      width: 2.0,
                                      color: const Color(0xff707070)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 391.0, end: 107.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 104.0,
                    height: 23.0,
                    child: Text(
                      'Question 3 ',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 115.0, start: 39.0),
                  child: SvgPicture.string(
                    _svg_z057jp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 18.0, end: 8.0),
                  Pin(size: 94.0, start: 52.0),
                  child: Text(
                    'Praesent ultricies mauris eu eros malesuada, accumsan lacinia risus commodo. In vestibulum tortor in magna condimentum pharetra. Praesent ultricies mauris eu eros malesuada, accumsan lacinia risus commodo?',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 36.0, end: 48.0),
                  Pin(size: 192.0, end: 16.0),
                  child: Text(
                    'Suspendisse egestas tellu\nMorbi et diam vulputate\nPraesent ut tellus consectetur\nIn vestibulum tortor in magna pharetra.\nMaecenas ut ex vehicula, efficitur ',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      height: 3.142857142857143,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 24.0, start: 5.0),
                  Pin(size: 211.0, end: 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [{}, {}, {}, {}, {}].map((itemData) {
                        return SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  border: Border.all(
                                      width: 2.0,
                                      color: const Color(0xff707070)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 50.0, end: 19.0),
            Pin(size: 35.7, middle: 0.2274),
            child: SvgPicture.string(
              _svg_n29qj8,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 51.0, end: 18.0),
            Pin(size: 35.7, middle: 0.5138),
            child: SvgPicture.string(
              _svg_d7abs2,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 52.0, end: 17.0),
            Pin(size: 35.7, middle: 0.7996),
            child: SvgPicture.string(
              _svg_cojabm,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 50.0, end: 19.0),
            Pin(size: 35.7, middle: 0.2579),
            child: SvgPicture.string(
              _svg_qku932,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 51.0, end: 18.0),
            Pin(size: 35.7, middle: 0.5444),
            child: SvgPicture.string(
              _svg_opt88,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 52.0, end: 17.0),
            Pin(size: 35.7, end: 244.3),
            child: SvgPicture.string(
              _svg_rih0xq,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 50.0, end: 19.0),
            Pin(size: 35.7, middle: 0.2885),
            child: SvgPicture.string(
              _svg_yjaodo,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 51.0, end: 18.0),
            Pin(size: 35.7, middle: 0.575),
            child: SvgPicture.string(
              _svg_ba6,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 52.0, end: 17.0),
            Pin(size: 35.7, end: 200.3),
            child: SvgPicture.string(
              _svg_h58e,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 50.0, end: 19.0),
            Pin(size: 35.7, middle: 0.3191),
            child: SvgPicture.string(
              _svg_tl72ss,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 51.0, end: 18.0),
            Pin(size: 35.7, middle: 0.6056),
            child: SvgPicture.string(
              _svg_qttu0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 52.0, end: 17.0),
            Pin(size: 35.7, end: 156.3),
            child: SvgPicture.string(
              _svg_neftha,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 49.0, end: 20.0),
            Pin(size: 35.7, middle: 0.3497),
            child: SvgPicture.string(
              _svg_p51ul0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 50.0, end: 19.0),
            Pin(size: 35.7, middle: 0.6362),
            child: SvgPicture.string(
              _svg_v0e7vm,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 51.0, end: 18.0),
            Pin(size: 35.7, end: 112.3),
            child: SvgPicture.string(
              _svg_hyfqh0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 237.0, middle: 0.5),
            Pin(size: 24.0, start: 112.0),
            child: Text(
              'Choose The Right Answer',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w800,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 107.0, middle: 0.5522),
            Pin(size: 21.0, start: 156.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 48.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Marks',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 55.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffffffff)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 16.0, middle: 0.7912),
                  Pin(start: 2.0, end: 1.0),
                  child: Text(
                    '33',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w300,
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.104, -0.222),
            child: SizedBox(
              width: 107.0,
              height: 21.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 48.0, start: 0.0),
                    Pin(start: 0.0, end: 1.0),
                    child: Text(
                      'Marks',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 55.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffffffff)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 16.0, middle: 0.7912),
                    Pin(start: 2.0, end: 1.0),
                    child: Text(
                      '33',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.104, 0.343),
            child: SizedBox(
              width: 107.0,
              height: 21.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 48.0, start: 0.0),
                    Pin(start: 0.0, end: 1.0),
                    child: Text(
                      'Marks',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 55.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffffffff)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 16.0, middle: 0.7912),
                    Pin(start: 2.0, end: 1.0),
                    child: Text(
                      '33',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 31.0),
            Pin(size: 12.0, middle: 0.604),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff000000),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.0, start: 31.0),
            Pin(size: 12.0, middle: 0.7948),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff000000),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 155.0, middle: 0.5),
            Pin(size: 39.0, end: 37.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Instructor_Examination(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.011, 0.059),
                    child: SizedBox(
                      width: 66.0,
                      height: 22.0,
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 18,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w800,
                          height: 1.3333333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
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
const String _svg_z057jp =
    '<svg viewBox="20.0 193.0 335.0 115.0" ><path transform="translate(20.0, 193.0)" d="M 10 0 L 325 0 C 330.5228576660156 0 335 4.477152347564697 335 10 L 335 105 C 335 110.5228500366211 330.5228576660156 115 325 115 L 10 115 C 4.477152347564697 115 0 110.5228500366211 0 105 L 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n29qj8 =
    '<svg viewBox="50.0 327.0 306.0 35.7" ><path transform="translate(50.0, 327.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d7abs2 =
    '<svg viewBox="51.0 739.0 306.0 35.7" ><path transform="translate(51.0, 739.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cojabm =
    '<svg viewBox="52.0 1150.0 306.0 35.7" ><path transform="translate(52.0, 1150.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qku932 =
    '<svg viewBox="50.0 371.0 306.0 35.7" ><path transform="translate(50.0, 371.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_opt88 =
    '<svg viewBox="51.0 783.0 306.0 35.7" ><path transform="translate(51.0, 783.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rih0xq =
    '<svg viewBox="52.0 1194.0 306.0 35.7" ><path transform="translate(52.0, 1194.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yjaodo =
    '<svg viewBox="50.0 415.0 306.0 35.7" ><path transform="translate(50.0, 415.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ba6 =
    '<svg viewBox="51.0 827.0 306.0 35.7" ><path transform="translate(51.0, 827.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h58e =
    '<svg viewBox="52.0 1238.0 306.0 35.7" ><path transform="translate(52.0, 1238.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tl72ss =
    '<svg viewBox="50.0 459.0 306.0 35.7" ><path transform="translate(50.0, 459.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qttu0 =
    '<svg viewBox="51.0 871.0 306.0 35.7" ><path transform="translate(51.0, 871.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_neftha =
    '<svg viewBox="52.0 1282.0 306.0 35.7" ><path transform="translate(52.0, 1282.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p51ul0 =
    '<svg viewBox="49.0 503.0 306.0 35.7" ><path transform="translate(49.0, 503.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v0e7vm =
    '<svg viewBox="50.0 915.0 306.0 35.7" ><path transform="translate(50.0, 915.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hyfqh0 =
    '<svg viewBox="51.0 1326.0 306.0 35.7" ><path transform="translate(51.0, 1326.0)" d="M 9.134328842163086 0 L 296.8656616210938 0 C 301.9104309082031 0 306 1.391259074211121 306 3.10746431350708 L 306 32.62837600708008 C 306 34.34458160400391 301.9104309082031 35.73583984375 296.8656616210938 35.73583984375 L 9.134328842163086 35.73583984375 C 4.089578151702881 35.73583984375 0 34.34458160400391 0 32.62837600708008 L 0 3.10746431350708 C 0 1.391259074211121 4.089578151702881 0 9.134328842163086 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
