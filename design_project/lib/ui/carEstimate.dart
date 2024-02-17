import 'package:design_project/ui/helper/CustomRadio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class CarEstimate extends StatefulWidget {
  const CarEstimate({Key? key}) : super(key: key);

  @override
  State<CarEstimate> createState() => _CarEstimateState();
}

class _CarEstimateState extends State<CarEstimate> {
  String dropdownValue = 'Perodua';
  List<String> spinnerItems = ['Perodua', 'Two', 'Three', 'Four', 'Five'];
  String dropdownValue1 = 'Myvi';
  List<String> spinnerItems1 = ['Myvi', 'Two', 'Three', 'Four', 'Five'];

  String dropdownValue2 = '2014';
  List<String> spinnerItems2 = ['2014', '2015', '2016', '2017', '2018'];

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'Auto';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            /* set Status bar color in Android devices. */

            statusBarIconBrightness: Brightness.light,
            /* set Status bar icons color in Android devices.*/

            statusBarBrightness:
                Brightness.dark) /* set Status bar icon color in iOS. */
        );

    return Scaffold(
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
                  'assests/images/back_arrow.png',
                  width: 18.0,
                  height: 18.0,
                ),

                // Icon(Icons.arrow_back_outlined,color: Colors.white,)
              ],
            ), // set your color here
            onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'ESTIMATE CAR VALUE',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFFFF),
            letterSpacing: 0.08,
            fontSize: 18,
            fontStyle: FontStyle.normal,
          ),
        ),
        backgroundColor: AppColor.themecolor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 30),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  border: Border.all(
                    color: Color(0xffcdcdcd),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                          style:
                              TextStyle(color: Color(0xff333333), fontSize: 17),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: spinnerItems
                              .map<DropdownMenuItem<String>>((String value) {
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
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  border: Border.all(
                    color: Color(0xffcdcdcd),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                          value: dropdownValue1,
                          icon: Image.asset(
                            'assests/images/dropdown_arrow.png',
                            width: 16,
                            height: 16,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style:
                              TextStyle(color: Color(0xff333333), fontSize: 17),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue1 = newValue!;
                            });
                          },
                          items: spinnerItems1
                              .map<DropdownMenuItem<String>>((String value) {
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
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  border: Border.all(
                    color: Color(0xffcdcdcd),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                          value: dropdownValue2,
                          icon: Image.asset(
                            'assests/images/dropdown_arrow.png',
                            width: 16,
                            height: 16,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style:
                              TextStyle(color: Color(0xff333333), fontSize: 17),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          items: spinnerItems2
                              .map<DropdownMenuItem<String>>((String value) {
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 19.0, top: 30, bottom: 5),
                child: Text(
                  'Transmission',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff5dc1c1),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, top: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilledRadio(
                  //activeColor:Color(0xff5dc1c1) ,
                  //fillColor:Color(0xff5dc1c1) ,
                  color: Color(0xff5dc1c1),
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'Auto';
                      id = 1;
                    });
                  },
                ),
                Text(
                  'Auto',
                  style: new TextStyle(fontSize: 17.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 88.0),
                  child: FilledRadio(
                    // activeColor:Color(0xff5dc1c1)
                    // ,
                    color: Color(0xff5dc1c1),
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Manual';
                        id = 2;
                      });
                    },
                  ),
                ),
                Text(
                  'Manual',
                  style: new TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 25, bottom: 30),
            child: Container(
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff5dc1c1),
                    border: Border.all(color: Color(0xff5dc1c1))),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'ESTIMATE',
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
          Center(
              child: Text(
            'Estimated earnings:',
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  border: Border.all(
                    color: Color(0xffcdcdcd),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1 day',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'RM 87',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5dc1c1),
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '7 days',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'RM 428',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5dc1c1),
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '30 days',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'RM 1070',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5dc1c1),
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
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
