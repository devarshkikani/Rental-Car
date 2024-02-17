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





class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
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
                Image.asset(
                  'assests/images/back_arrow.png',
                  width: 18.0,
                  height: 18.0,
                ),
              ],
            ), // set your color here
            onPressed: () => Navigator.pop(context)
        ),
        centerTitle: true,
        elevation: 0,
        title: Text('BANK DETAILS',
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
              child:ScrollConfiguration(
                behavior: ScrollBehavior(),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Container(
                    //height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              color: const Color(0xfffffec5),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'Please provide your personal saving\'s account in order to recieve your earnings or refunds if necessary.',
                                          textAlign: TextAlign.center,
                                          //overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w500, fontSize: 16.5,height: 1.2, letterSpacing: 0.08, color: Color(0Xff757575), fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ),),
                                ],
                              )

                          ),
                        ),
                        const SizedBox(height: 15),
                        Align(alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right:10,),
                            child: Text(
                              'Bank Name',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,letterSpacing: 0.08, fontSize: 16, color: Color(0Xff000000), fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right:10,top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                border: Border.all(color: const Color(0xffcdcdcd),)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:5,right: 5),
                                    child: TextFormField(
                                      cursorColor: const Color(0xff333333),
                                      decoration:  InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                                        hintText: "",
                                        focusColor: Color(0xff828282),
                                        hintStyle: GoogleFonts.lato( fontWeight: FontWeight.w400, color: Color(0xff828282), fontSize: 18,fontStyle: FontStyle.normal),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      style:const TextStyle(
                                        fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 18,fontStyle: FontStyle.normal,
                                      ),


                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right:10,),
                            child: Text(
                              'Account Holder Name',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,letterSpacing: 0.08, fontSize: 16, color: Color(0Xff000000), fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right:10,top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                border: Border.all(color: const Color(0xffcdcdcd),)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:5,right: 5),
                                    child: TextFormField(
                                      cursorColor: const Color(0xff333333),
                                      decoration:  InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                                        hintText: "",
                                        focusColor: Color(0xff828282),
                                        hintStyle: GoogleFonts.lato( fontWeight: FontWeight.w400, color: Color(0xff828282), fontSize: 18,fontStyle: FontStyle.normal),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      style:const TextStyle(
                                        fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 18,fontStyle: FontStyle.normal,
                                      ),


                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right:10,),
                            child: Text(
                              'Account Number',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,letterSpacing: 0.08, fontSize: 16, color: Color(0Xff000000), fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right:10,top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                border: Border.all(color: const Color(0xffcdcdcd),)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:5,right: 5),
                                    child: TextFormField(
                                      cursorColor: const Color(0xff333333),
                                      decoration:  InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                                        hintText: "",
                                        focusColor: Color(0xff828282),
                                        hintStyle: GoogleFonts.lato( fontWeight: FontWeight.w400, color: Color(0xff828282), fontSize: 18,fontStyle: FontStyle.normal),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                      style:const TextStyle(
                                        fontWeight: FontWeight.w400, color: Color(0xff333333), fontSize: 18,fontStyle: FontStyle.normal,
                                      ),


                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 90),
                      ],
                    ),
                  ),
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
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff5dc1c1),
                        border: Border.all(color: Color(0xff5dc1c1))

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'SAVE',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(fontWeight: FontWeight.w500, color: Color(0xffFFFFFF), fontSize: 16,fontStyle: FontStyle.normal,),
                            ),
                          ),

                        ],
                      ),
                    )
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

