import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:design_project/ui/Identification2.dart';

import '../NavDrawer.dart';
import '../constant.dart';





class IdentificationPage extends StatefulWidget {
  const IdentificationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<IdentificationPage> createState() => _IdentificationPageState();
}

class _IdentificationPageState extends State<IdentificationPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(

        statusBarColor: Colors.transparent,*//* set Status bar color in Android devices. *//*

        statusBarIconBrightness: Brightness.dark,*//* set Status bar icons color in Android devices.*//*

        statusBarBrightness: Brightness.dark)*//* set Status bar icon color in iOS. *//*
    );*/

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black26, // <-- SEE HERE
          statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
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
            onPressed: () => Navigator.pop(context)
        ),
        centerTitle: true,
        elevation: 0,
        title: Text('IDENTIFICATION',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(fontWeight: FontWeight.w500, color: Color(0xffFFFFFF),letterSpacing: 0.08, fontSize: 18,fontStyle: FontStyle.normal,),),
        backgroundColor: AppColor.themecolor,

      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left:30.0,right: 30.0,top:20.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'A clear image of your driver\'s licence',
                                  textAlign: TextAlign.center,
                                  //overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: 0.08, color: Color(0Xff000000), fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left:30.0,right:30.0),
                      child: Image.asset('assests/images/image.jpg',
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(left:30.0,right: 30.0, top: 15.0),
                        child: Text.rich(
                            TextSpan(
                                text: 'Unable to upload your picture? ',
                                style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w500,letterSpacing: 0.06,),
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: 'Tap ',
                                      style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w500,letterSpacing: 0.06,),
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: 'here',
                                          style: TextStyle(fontSize: 16.5,decoration: TextDecoration.underline,fontWeight: FontWeight.w400,letterSpacing: 0.06,color: Color(0xff5dc1c1)),

                                        )
                                      ]
                                  )
                                ]
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Disclaimer: These photos are for verification purposes only and will not be shown publicly. Your photos will be water marked'
                                    ' automatically by the system.',
                                textAlign: TextAlign.start,
                                //overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300, fontSize: 13.5,height: 1.5, letterSpacing: 0.08, color: Color(0Xff323232), fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 90.0),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffcdcdcd),
                        border: Border.all(color: Color(0xffcdcdcd))

                    ),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '(1/3)NEXT',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(fontWeight: FontWeight.w500, color: Color(0xffFFFFFF), fontSize: 16,fontStyle: FontStyle.normal,),
                              ),
                            ),

                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Identification2Page(title: "title"),));
                      },
                    ),
                ),
              ),
            )
          ],
        ),
      ),




    );
  }
  @override
  void dispose() {

    super.dispose();
  }
}

