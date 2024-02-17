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

import '../constant.dart';

class ReferEarnPage extends StatefulWidget {
  const ReferEarnPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ReferEarnPage> createState() => _ReferEarnPageState();
}

class _ReferEarnPageState extends State<ReferEarnPage> {
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
                Image.asset(
                  'assests/images/back.png',
                  width: 18.0,
                  height: 18.0,
                ),
              ],
            ), // set your color here
            onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'REFER & EARN',
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                  child: Text(
                    'Give RM40, get RM30',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.08,
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                  child: Text.rich(TextSpan(
                      text:
                          'When someone signs up with your link, they will recieve ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.06,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'RM40 ',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'in rental credit.',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.06,
                                ),
                              )
                            ])
                      ])),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                  child: Text.rich(TextSpan(
                      text:
                          'Once they completed their first booking, you will get ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.06,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                            text: 'RM30 ',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'in rental credit.',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.06,
                                ),
                              )
                            ])
                      ])),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                  child: Text.rich(TextSpan(
                    text:
                        'Rental credit expires 60 days from the date it is credited.',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.06,
                    ),
                  )),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            border: Border.all(color: Color(0xff808080))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'NS1uh5jg',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff808080),
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 10.0),
                                  // child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 15 ,),
                                  child: Image.asset(
                                    'assests/images/copy.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff5dc1c1),
                            border: Border.all(color: Color(0xff5dc1c1))),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'SHARE YOUR LINK',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF),
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 0.0),
                          child: Text(
                            'Your Referrals',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.08,
                              color: Color(0xff060606),
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      const Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25.0, top: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assests/images/next.png',
                                    width: 18.0,
                                    height: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 0.0),
                          child: Text(
                            'Your Rental Credit',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.08,
                              color: Color(0xff060606),
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      const Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25.0, top: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assests/images/next.png',
                                    width: 18.0,
                                    height: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 0.0),
                          child: Text(
                            'How It Works',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.08,
                              color: Color(0xff060606),
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      const Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25.0, top: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assests/images/next.png',
                                    width: 18.0,
                                    height: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
