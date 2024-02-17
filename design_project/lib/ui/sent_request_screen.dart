import 'package:design_project/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SentRequestScreen extends StatefulWidget {
  const SentRequestScreen({Key? key}) : super(key: key);

  @override
  State<SentRequestScreen> createState() => _SentRequestScreenState();
}

class _SentRequestScreenState extends State<SentRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black26,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
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
          'SENT REQUEST',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            color: const Color(0xffFFFFFF),
            letterSpacing: 0.08,
            fontSize: 18,
            fontStyle: FontStyle.normal,
          ),
        ),
        backgroundColor: AppColor.themecolor,
      ),
      body: sentApproval(),
    );
  }

  Widget sentApproval() {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Your request has been sent',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w900,
            letterSpacing: 0.08,
            color: Color(0xff4D4D4D),
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "This isn't a confirmed booking. You'll get a response within 24 hours. We'll let you know once it is official.",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.08,
            color: Color(0xff4D4D4D),
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      const Spacer(),
      InkWell(
        onTap: () {},
        child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.themecolor,
              borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              'NEXT',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ),
      ),
    ]);
  }
}
