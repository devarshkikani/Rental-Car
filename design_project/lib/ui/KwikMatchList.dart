import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:design_project/ui/BankDetails.dart';
import 'package:design_project/ui/ChangePassword.dart';
import 'package:design_project/ui/Identification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NavDrawer.dart';
import '../constant.dart';





class KwikMatchListPage extends StatefulWidget {
  const KwikMatchListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<KwikMatchListPage> createState() => _KwikMatchListPageState();
}

class _KwikMatchListPageState extends State<KwikMatchListPage> {
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
                Icon(Icons.menu, color: Colors.white),
                Align(
                  alignment: Alignment(-0.6, -0.6),
                  child: Icon(Icons.circle, color: Colors.red,size: 10.0,),
                ),
              ],
            ), // set your color here
            onPressed: () => scaffoldKey.currentState?.openDrawer()
        ),
        centerTitle: true,
        elevation: 0,
        title: Text('KWIKMATCH LIST',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(fontWeight: FontWeight.w500, color: Color(0xffFFFFFF),letterSpacing: 0.08, fontSize: 18,fontStyle: FontStyle.normal,),),
        backgroundColor: AppColor.themecolor,
        actions: [
          //const Flexible(fit: FlexFit.tight, child: SizedBox()),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                    },
                    child: Image.asset(
                      'assests/images/plus.png',
                      width: 18.0,
                      height: 18.0,
                    ),

                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xffFFFF),
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left:20.0,right: 20.0,top:0.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'You have not submitted any Kwikmatch request.',
                                textAlign: TextAlign.center,
                                //overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.08, color: Color(0Xff000000), fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 70.0,
                      width: 70.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                            elevation: 0.0,
                            child: Image.asset(
                              'assests/images/plus.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                            backgroundColor: Color(0xff5dc1c1),
                            onPressed: (){}
                        ),
                      ),
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

