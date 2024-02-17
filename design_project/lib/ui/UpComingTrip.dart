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





class UpComingTripPage extends StatefulWidget {
  const UpComingTripPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<UpComingTripPage> createState() => _UpComingTripPageState();
}

class _UpComingTripPageState extends State<UpComingTripPage> {
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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset:true,
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
          elevation: 4,
          title: Text('UPCOMING TRIPS',
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(fontWeight: FontWeight.w500, letterSpacing: 0.08, fontSize: 18,fontStyle: FontStyle.normal,),),
          backgroundColor: AppColor.themecolor,
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white38,

            tabs: [
              Tab(child: Text('UPCOMING',
              style: GoogleFonts.lato(fontWeight: FontWeight.w500,letterSpacing: 0.08, fontSize: 13,fontStyle: FontStyle.normal,),),),
              Tab(child: Text('ONGOING',
                style: GoogleFonts.lato(fontWeight: FontWeight.w500,letterSpacing: 0.08, fontSize: 13,fontStyle: FontStyle.normal,),),),
              Tab(child: Text('HISTORY',style: GoogleFonts.lato(fontWeight: FontWeight.w500,letterSpacing: 0.08, fontSize: 13,fontStyle: FontStyle.normal,),),),
            ],
          ),

        ),
        body: TabBarView(
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 20.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'No trips yet.\nBook a car and start your next adventure!',
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 17,height: 1.4, letterSpacing: 0.08, color: Color(0Xff454545), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 20.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Trips are ongoing.',
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 17, letterSpacing: 0.08, color: Color(0Xff454545), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 20.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'No history yet.',
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 17, letterSpacing: 0.08, color: Color(0Xff454545), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),),
              ],
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

