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

class CarPricingPage extends StatefulWidget {
  const CarPricingPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CarPricingPage> createState() => _CarPricingPageState();
}

class _CarPricingPageState extends State<CarPricingPage> {
  String dropdownValue = 'Select Car Make';
  List<String> spinnerItems = [
    'Select Car Make',
    'Two',
    'Three',
    'Four',
    'Five'
  ];
  String modeldropdownValue = 'Select Car Model';
  List<String> modelspinnerItems = [
    'Select Car Model',
    'Carmy',
    'Tata Tiago',
    'Tata Punch',
    'Mahindra XUV700'
  ];
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
          'CAR PRICING',
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
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            border: Border.all(
                              color: Color(0xffcdcdcd),
                            )),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    value: dropdownValue,
                                    icon: Image.asset(
                                      'assests/images/dropdown_arrow.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(
                                        color: Color(0xff333333), fontSize: 17),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: spinnerItems
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.08,
                                            color: Color(0xff4D4D4D),
                                            fontSize: 17,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            border: Border.all(
                              color: Color(0xffcdcdcd),
                            )),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    value: modeldropdownValue,
                                    icon: Image.asset(
                                      'assests/images/dropdown_arrow.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(
                                        color: Color(0xff333333), fontSize: 17),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        modeldropdownValue = newValue!;
                                      });
                                    },
                                    items: modelspinnerItems
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.08,
                                            color: Color(0xff4D4D4D),
                                            fontSize: 17,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 20),
                      child: Container(
                          height: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff5dc1c1),
                              border: Border.all(color: Color(0xff5dc1c1))),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'VIEW PRICING',
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
