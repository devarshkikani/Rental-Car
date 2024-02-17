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
import 'package:intl/intl.dart';

import '../constant.dart';
import 'helper/CircleThumbShape.dart';

class menuSearchFilterPage extends StatefulWidget {
  menuSearchFilterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<menuSearchFilterPage> createState() => _menuSearchFilterPageState();
}

class _menuSearchFilterPageState extends State<menuSearchFilterPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var startdateinput = "Select Date";
  var enddateinput = "Select Date";
  String dropdownValue = 'Select Car Make(All)';
  List<String> spinnerItems = [
    'Select Car Make(All)',
    'Two',
    'Three',
    'Four',
    'Five'
  ];
  int _sliderValue = 100;
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
          'SEARCH FILTER',
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
        actions: [
          // Flexible(fit: FlexFit.tight, child: SizedBox()),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                right: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Clear',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFFFFFF),
                        letterSpacing: 0.08,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                  child: Text(
                    'Location',
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
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xffcdcdcd),
                      )),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Image.asset(
                          'assests/images/search_2.png',
                          width: 22,
                          height: 22,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 5, bottom: 2),
                          child: TextFormField(
                            cursorColor: Color(0xff333333),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
                              hintText: "Current location",
                              focusColor: Color(0xffcdcdcd),
                              hintStyle: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff808080),
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff333333),
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Image.asset(
                          'assests/images/close_2.png',
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                  child: Text(
                    'Booking Dates',
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
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xffcdcdcd),
                      )),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 2.0, top: 15.0, bottom: 20.0),
                        child: Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Start Date',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.08,
                                color: Color(0xff000000),
                                fontSize: 17,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime
                                      .now(), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  startdateinput =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Color(0xffcdcdcd),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assests/images/calender.png',
                                            width: 18.0,
                                            height: 18.0,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.0, right: 5.0, top: 0.0),
                                          child: Text(
                                            '$startdateinput',
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.08,
                                              color: Color(0xff4D4D4D),
                                              fontSize: 18,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2.0, right: 15.0, top: 15.0, bottom: 20.0),
                        child: Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'End Date',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.08,
                                color: Color(0xff000000),
                                fontSize: 17,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime
                                      .now(), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  enddateinput =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Color(0xffcdcdcd),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assests/images/calender.png',
                                            width: 18.0,
                                            height: 18.0,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.0, right: 5.0, top: 0.0),
                                          child: Text(
                                            '$enddateinput',
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.08,
                                              color: Color(0xff4D4D4D),
                                              fontSize: 18,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                  child: Text(
                    'Car Preference',
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                  child: Text(
                    'Car Make (Optional):',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.08,
                      color: Color(0xff000000),
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xffcdcdcd),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                                  color: Color(0xff333333), fontSize: 18),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: spinnerItems.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
                                      color: Color(0xff4D4D4D),
                                      fontSize: 18,
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                  child: Text(
                    'Body Type',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.08,
                      color: Color(0xff000000),
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xffcdcdcd),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 5.0, right: 5.0, top: 0),
                                    child: Image.asset(
                                      'assests/images/sedan2.png',
                                      width: 87,
                                      height: 50,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 5.0,
                                          bottom: 0.0),
                                      child: Text(
                                        'Sedan',
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
                              Flexible(fit: FlexFit.tight, child: SizedBox()),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 5.0, right: 5.0, top: 0),
                                    child: Image.asset(
                                      'assests/images/suv2.png',
                                      width: 87,
                                      height: 50,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 5.0,
                                          bottom: 0.0),
                                      child: Text(
                                        'SUV',
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
                              const Flexible(
                                  fit: FlexFit.tight, child: SizedBox()),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0, top: 0),
                                    child: Image.asset(
                                      'assests/images/pickup2.png',
                                      width: 87,
                                      height: 50,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 5.0,
                                          bottom: 0.0),
                                      child: Text(
                                        'Pickup',
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0, top: 0),
                                    child: Image.asset(
                                      'assests/images/mpv2.png',
                                      width: 84,
                                      height: 50,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 5.0,
                                          bottom: 0.0),
                                      child: Text(
                                        'MPV',
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
                              const Flexible(
                                  fit: FlexFit.tight, child: SizedBox()),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0, top: 0),
                                    child: Image.asset(
                                      'assests/images/hatchback2.png',
                                      width: 84,
                                      height: 50,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 5.0,
                                          bottom: 0.0),
                                      child: Text(
                                        'Hatchback',
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
                              const Flexible(
                                  fit: FlexFit.tight, child: SizedBox()),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0, top: 0),
                                    child: Image.asset(
                                      'assests/images/sport3.png',
                                      width: 83,
                                      height: 50,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 5.0,
                                          bottom: 0.0),
                                      child: Text(
                                        'Sports',
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
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, bottom: 20),
                          child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffFFFFFF),
                                  border: Border.all(color: Color(0xff5dc1c1))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'ANY',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff000000),
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
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                  child: Text(
                    'Price Range:',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.08,
                      color: Color(0xff000000),
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffcdcdcd),
                        )),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 15.0,
                                bottom: 15.0),
                            child: Text.rich(TextSpan(
                                text: 'Up to  ',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.06,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: 'RM ${_sliderValue.toString()}+ ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: 'per day',
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
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: SliderTheme(
                            data: const SliderThemeData(
                              activeTrackColor: Color(0xff5dc1c1),
                              inactiveTrackColor: Color(0xff5dc1c1),
                              trackHeight: 5,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 1),
                              thumbShape: CircleThumbShape(thumbRadius: 15),
                            ),
                            child: Slider(
                              value: _sliderValue.toDouble(),
                              min: 100.0,
                              max: 2000.0,
                              activeColor: Color(0xff5dc1c1),
                              inactiveColor: Color(0xff5dc1c1),
                              onChanged: (double newValue) {
                                setState(() {
                                  _sliderValue = newValue.round();
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 10.0,
                                    bottom: 15.0),
                                child: Text(
                                  'RM100',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                            const Flexible(
                                fit: FlexFit.tight, child: SizedBox()),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 10.0,
                                    bottom: 15.0),
                                child: Text(
                                  'RM2000',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff000000),
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              const SizedBox(height: 60),
              Align(
                child: Container(
                  height: 50,
                  width: 414,
                  decoration: const BoxDecoration(
                    color: Color(0xff5dc1c1),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'SEARCH',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
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
