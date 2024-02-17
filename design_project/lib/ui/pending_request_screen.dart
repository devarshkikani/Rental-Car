import 'package:design_project/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingRequestScreen extends StatefulWidget {
  const PendingRequestScreen({Key? key}) : super(key: key);

  @override
  State<PendingRequestScreen> createState() => _PendingRequestScreenState();
}

class _PendingRequestScreenState extends State<PendingRequestScreen> {
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
          'PENDING REQUEST',
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
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: pendingApproval()),
      ),
    );
  }

  Widget pendingApproval() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Pending Approval',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w900,
            letterSpacing: 0.08,
            color: Color(0xff4D4D4D),
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "We're currently reviewing your information. Once approved, we will send an email with instruction to:",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.08,
            color: Color(0xff4D4D4D),
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "ikzuquan@gmail.com",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w400,
                letterSpacing: 0.08,
                color: Color(0xff4D4D4D),
                fontSize: 20,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        RichText(
          text: TextSpan(
              text: "If you have question or need help. please ",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w400,
                letterSpacing: 0.08,
                color: Color(0xff4D4D4D),
                fontSize: 20,
                fontStyle: FontStyle.normal,
              ),
              children: [
                TextSpan(
                  text: "contact us",
                  style: GoogleFonts.lato(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.08,
                    color: Colors.blue,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ]),
        )
      ],
    );
  }
}
