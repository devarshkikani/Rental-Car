import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NavDrawer.dart';
import '../constant.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(

        statusBarColor: Colors.transparent,*/ /* set Status bar color in Android devices. */ /*

        statusBarIconBrightness: Brightness.dark,*/ /* set Status bar icons color in Android devices.*/ /*

        statusBarBrightness: Brightness.dark)*/ /* set Status bar icon color in iOS. */ /*
    );*/

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black26, // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.light, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        leading: IconButton(
            icon: Row(
              children: [
                Icon(Icons.menu, color: Colors.white),
                Align(
                  alignment: Alignment(-0.6, -0.6),
                  child: Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 10.0,
                  ),
                ),
              ],
            ), // set your color here
            onPressed: () => scaffoldKey.currentState?.openDrawer()),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'HELP',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF),
            letterSpacing: 0.08,
            fontSize: 18,
            fontStyle: FontStyle.normal,
          ),
        ),
        backgroundColor: AppColor.themecolor,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xffFFFF),
                child: Column(
                  children: [
                    Container(
                        color: Color(0xff5dc1c1),
                        child: Column(
                          children: [
                            Container(
                              color: Color(0xffF1F1F1),
                              child: const Divider(
                                color: Color(0xffF1F1F1),
                                height: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Image.asset(
                                'assests/images/light.png',
                                width: 75.0,
                                height: 75.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                'HELP SECTION',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                  letterSpacing: 0.08,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Column(
                      children: [
                        const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 0.0),
                                child: Text(
                                  'FAQ (Frequently Asked Questions)',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                            const Flexible(
                                fit: FlexFit.tight, child: SizedBox()),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Text(
                                  '24-Hours Road Side Assistance',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Text(
                                  'Renter\'s Agreement',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Text(
                                  'Owner\'s Agreement',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Text(
                                  'Terms of Services',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Text(
                                  'Privacy & Policy',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Text(
                                  'Contact Us!',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Text(
                                  'Rate Us!',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 17,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
