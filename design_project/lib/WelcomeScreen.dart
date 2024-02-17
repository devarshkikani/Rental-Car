import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:design_project/LoginPage.dart';
import 'package:design_project/RegisterPage.dart';
import 'package:design_project/constant.dart';
import 'package:design_project/ui/no_internet.dart';
import 'package:design_project/utils/util_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'RegisterPage.dart';
import 'constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  Timer? _timer;
  bool isSwipe = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      setState(() {});
    });
  }

  Widget first() {
    return Hero(
      tag: 'abcd',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 270,
          ),
          const Text(
            'RENT\nA CAR\nANYWHERE',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Find the ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
                TextSpan(
                    text: 'PERFECT CAR,',
                    style: TextStyle(
                        color: AppColor.themecolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400))
              ],
            ),
          ),
          animatedText(
            'Courtesy of local car owners',
            const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget second() {
    return Hero(
      tag: 'abcd',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 270,
          ),
          animatedText(
            'BEST CAR\nFOR ALL',
            const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          animatedText(
            'BEST & PERFECT ,',
            TextStyle(
              color: AppColor.themecolor,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          animatedText(
            'cars for everything',
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget third() {
    return Hero(
      tag: 'abcd',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 270,
          ),
          animatedText(
            'Earn RM10,000',
            const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
          ),
          animatedText(
            'MONTHLY',
            const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
          ),
          animatedText(
            'PERFECT,',
            TextStyle(
              color: AppColor.themecolor,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          animatedText(
            'Part time job',
            const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget four() {
    return Hero(
      tag: 'abcd',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 270,
          ),
          animatedText(
            'LET YOUR CAR,',
            const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          animatedText(
            'WORK FOR YOU',
            const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: animatedText(
              'Click estimate to find out how much you can earn.',
              const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.themecolor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                  child: Text(
                    'ESTIMENT CAR VALUE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text animatedText(String title, TextStyle textStyle) {
    return Text(
      title,
      style: textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        onHorizontalDragUpdate(details);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assests/car_woman.png'),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: [first(), second(), third(), four()][_currentPage],
          ),
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
          //   child: Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     color: Colors.lightGreen.withOpacity(0.15),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 580.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.themecolor,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RagisterPage(),
                        ));
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              children: List.generate(4, (index) {
                return Container(
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == _currentPage
                          ? Colors.white
                          : Colors.white.withOpacity(0.5)),
                );
              }),
            ),
          )
        ],
      ),
    ));
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    if (isSwipe) {
      isSwipe = false;
      if (details.delta.dx < 0) {
        if (_currentPage < 3) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
      }
      if (details.delta.dx > 0) {
        if (_currentPage != 0) {
          _currentPage--;
        } else {
          _currentPage = 3;
        }
      }
    }
    Timer(const Duration(milliseconds: 200), () {
      isSwipe = true;
    });
    setState(() {});
  }
}
