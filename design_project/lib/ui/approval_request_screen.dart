import 'package:design_project/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ApprovalRequestScreen extends StatefulWidget {
  const ApprovalRequestScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalRequestScreen> createState() => _ApprovalRequestScreenState();
}

class _ApprovalRequestScreenState extends State<ApprovalRequestScreen> {
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
          'APPROVAL REQUEST',
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
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: AppColor.themecolor,
          child: approvedApproval()),
    );
  }

  Widget approvedApproval() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2)),
          child: const Center(
              child: Icon(
            Icons.check,
            color: Colors.white,
            size: 40,
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Congratulation!',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            letterSpacing: 0.08,
            color: Colors.white,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Your reservation is confirmed. \n we've emailed your itinerary to \n ikzuquan@gmail.com",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.08,
            color: Colors.white,
            fontStyle: FontStyle.normal,
          ),
        )
      ],
    );
  }
}
