import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import '../NavDrawer.dart';
import '../constant.dart';





class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 220.0;
  int _currentPage = 0;
  Timer? _timer;
  final _pageController = PageController(initialPage: 0,);
  static dynamic currentPageValue = 0.0;
  String dropdownValue = '12 OCT 2018';
  var startdateinput="Select Date";
  var enddateinput="Select Date";
  List <String> spinnerItems = [
    '12 OCT 2018',
    '13 OCT 2018',
    '14 OCT 2018',
    '15 OCT 2018',
    '16 OCT 2018'
  ] ;
  var list = ["assests/images/car.jpeg","assests/images/car4.jpeg", "assests/images/car1.jpeg", "assests/images/car4.jpeg","assests/images/car1.jpeg","assests/images/car4.jpeg"];
  @override
  void initState() {
    super.initState();
    /*_timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });*/
    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMM yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    setState(() {
      startdateinput = formattedDate;
      enddateinput = formattedDate;
    });
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    //_timer?.cancel();
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
        title: Text('CHECKOUT',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(fontWeight: FontWeight.w500, color: Color(0xffFFFFFF),letterSpacing: 0.08, fontSize: 18,fontStyle: FontStyle.normal,),),
        backgroundColor: AppColor.themecolor,

      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  _buildPageView(),
                  _buildCircleIndicator(),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                  color: Color(0xffFFFFFF),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                                children:[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Pickup',
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 15.5, color: Color(0xff5dc1c1), fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context, initialDate: DateTime.now(),
                                          firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2101)
                                      );

                                      if(pickedDate != null ){
                                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
                                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                        //you can implement different kind of Date Format here according to your requirement

                                        setState(() {
                                          startdateinput = formattedDate; //set output date to TextField value.
                                        });
                                      }else{
                                        print("Date is not selected");
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:10.0,top:5.0),
                                      child: Container(
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                              color:  Color(0xffFFFFFF),
                                              border: Border.all(color:  Color(0xffcdcdcd),)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding:  EdgeInsets.only(left:5.0,right: 5.0, top: 0.0),
                                                  child: Text('$startdateinput',
                                                    textAlign: TextAlign.center,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: GoogleFonts.lato(fontWeight: FontWeight.w500,letterSpacing: 0.08, color: Color(0xff5dc1c1), fontSize: 17,fontStyle: FontStyle.normal,),),
                                                ),
                                              ),

                                              const Flexible(fit: FlexFit.tight, child: SizedBox()),
                                              Padding(
                                                padding:  EdgeInsets.only(left:5.0,right: 5.0, top: 0.0),
                                                child: Align(alignment: Alignment.center,
                                                  child:  InkWell(
                                                    onTap: (){
                                                    },
                                                    child: Image.asset(
                                                      'assests/images/dropdown_arrow.png',
                                                      width: 18.0,
                                                      height: 18.0,
                                                    ),

                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                  children:[
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Return',
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 15.5, color: Color(0xff5dc1c1), fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context, initialDate: DateTime.now(),
                                            firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2101)
                                        );

                                        if(pickedDate != null ){
                                          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
                                          print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                          //you can implement different kind of Date Format here according to your requirement

                                          setState(() {
                                            enddateinput = formattedDate; //set output date to TextField value.
                                          });
                                        }else{
                                          print("Date is not selected");
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:10.0,top:5.0),
                                        child: Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                                color:  Color(0xffFFFFFF),
                                                border: Border.all(color:  Color(0xffcdcdcd),)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:  EdgeInsets.only(left:5.0,right: 5.0, top: 0.0),
                                                    child: Text('$enddateinput',
                                                      textAlign: TextAlign.center,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.lato(fontWeight: FontWeight.w500,letterSpacing: 0.08, color: Color(0xff5dc1c1), fontSize: 17,fontStyle: FontStyle.normal,),),
                                                  ),
                                                ),

                                                const Flexible(fit: FlexFit.tight, child: SizedBox()),
                                                Padding(
                                                  padding:  EdgeInsets.only(left:5.0,right: 5.0, top: 0.0),
                                                  child: Align(alignment: Alignment.center,
                                                    child:  InkWell(
                                                      onTap: (){
                                                      },
                                                      child: Image.asset(
                                                        'assests/images/dropdown_arrow.png',
                                                        width: 18.0,
                                                        height: 18.0,
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      ),
                                    ),

                                  ]
                              ),
                            ),
                          ),


                        ],
                      )
                    ],
                  )
              ),
              const SizedBox(height: 15),
              Container(
                color: Color(0xffcdcdcd),
                child: const Divider(
                  color: Color(0xffcdcdcd),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 15),
              ButtonTheme(
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
                          Image.asset(
                            'assests/images/message.png',
                            width: 18.0,
                            height: 18.0,
                          ),
                          const SizedBox(width: 5),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'MESSAGE OWNER',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(fontWeight: FontWeight.w500, color: Color(0xffFFFFFF), fontSize: 15,fontStyle: FontStyle.normal,),
                            ),
                          ),

                        ],
                      ),
                    )
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: Color(0xffcdcdcd),
                child: const Divider(
                  color: Color(0xffcdcdcd),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left:10.0,right: 10.0, top: 0.0),
                child: Text.rich(
                    TextSpan(
                        text: 'PEUGEOT 408 ',
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.normal,color: Color(0xff5dc1c1),letterSpacing: 0.06,),
                        children: <InlineSpan>[
                          TextSpan(
                              text: ' 2015',
                              style: TextStyle(fontSize: 17,color: Color(0xff5000000),fontWeight: FontWeight.normal),

                          )
                        ]
                    )
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left:10.0,right: 10.0, top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Total Booking Days',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 16, color: Color(0xff000000), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '1 Day(s)',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 16, color: Color(0xff000000), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left:10.0,right: 10.0, top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Subtotal',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 16, color: Color(0xff000000), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'RM 216.00',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 16, color: Color(0xff000000), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left:10.0,right: 10.0, top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Service Fee(5%)',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 16, color: Color(0xff000000), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      'assests/images/service_fee.png',
                      width: 18.0,
                      height: 18.0,
                    ),
                    const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '+ RM 10.80',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 16, color: Color(0xff000000), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left:10.0,right: 10.0),
                child: Container(
                  color: Color(0xffcdcdcd),
                  child: const Divider(
                    color: Color(0xffcdcdcd),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left:10.0,right: 10.0, top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Total Trip Amount',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,letterSpacing: 0.04, fontSize: 16, color: Color(0xff000000), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'RM 226.80',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,letterSpacing: 0.04, fontSize: 16, color: Color(0xff000000), fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: Color(0xffcdcdcd),
                child: const Divider(
                  color: Color(0xffcdcdcd),
                  height: 1,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Have a promo code? Enter it below!',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 15.5, color: Color(0xff000000), fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 170,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 10.0,bottom: 10.0),
                    child: Text('Promo Code',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,letterSpacing: 0.04, fontSize: 15.5, color: Color(0xff5dc1c1), fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: Color(0xffcdcdcd),
                child: const Divider(
                  color: Color(0xffcdcdcd),
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0, top: 0.0),
                      child: Text('Cancellation Policy',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(fontWeight: FontWeight.w500,letterSpacing: 0.08, color: Color(0xff4D4D4D), fontSize: 18,fontStyle: FontStyle.normal,),),
                    ),
                  ),
                  const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0,top: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(alignment: Alignment.topLeft,
                            child:  InkWell(
                                onTap: (){

                                },
                                child: SvgPicture.asset("assests/images/arrow.svg",
                                  width: 18.0,
                                  height: 18.0,
                                )

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
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border(
                    left: BorderSide( //                   <--- left side
                      color: Colors.black12,
                      width: 1.5,
                    ),
                    top: BorderSide( //                    <--- top side
                      color: Colors.black12,
                      width: 1.5,
                    ),
                    right: BorderSide( //                    <--- right side
                      color: Colors.black12,
                      width: 1.5,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 25.0,bottom: 25.0,right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assests/images/info.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left:15.0,right: 0.0,top:0.0),
                          child: Text(
                            'We will hold RM 300 as security deposit until 2 week after your trip',
                            textAlign: TextAlign.start,
                            //overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, fontSize: 16, letterSpacing: 0.08, color: Color(0Xff000000), fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.60,
                    decoration: BoxDecoration(
                      color: Color(0xff5dc1c1),
                      border: Border.all(
                        width: 1.5,
                        color: Color(0xff5dc1c1),
                      ),
                    ),
                    child: Center(
                      child: Text('RM484 for 3 days',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(fontWeight: FontWeight.w600,letterSpacing: 0.08, color: Color(0xffFFFFFF), fontSize: 18,fontStyle: FontStyle.normal,),),
                    ),

                  ),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                        color: Color(0xff5dc1c1),
                        border: Border.all(
                          color: Color(0xff5dc1c1),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child:Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assests/images/charge.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left:5.0,right: 0.0,top:0.0),
                                child: Text(
                                  'CONFIRM',
                                  textAlign: TextAlign.center,
                                  //overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600, fontSize: 16, letterSpacing: 0.08, color: Color(0XffFFFFFF), fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),),
                          ],
                        ),
                      ),

                    ),
                  ),

                ],
              ),


            ],
          ),
        ),
      ),




    );
  }
  _buildPageView() {
    return Container(
      color: Colors.black87,
      height: _boxHeight,
      child: PageView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateZ(currentPageValue - index),
              child: Image.asset(list[index],
              ),
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }
          ),
    );
  }
  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CirclePageIndicator(
          size: 5.0,
          selectedSize: 8.0,
          dotSpacing: 35.0,
          itemCount: 6,
          dotColor: Colors.white24,
          selectedDotColor: Colors.white54,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }


}

