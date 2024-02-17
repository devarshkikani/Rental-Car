import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:design_project/ui/BankDetails.dart';
import 'package:design_project/ui/ChangePassword.dart';
import 'package:design_project/ui/Identification.dart';
import 'package:design_project/ui/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'NavDrawer.dart';
import 'constant.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          'ACCOUNT',
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
          //const Flexible(fit: FlexFit.tight, child: SizedBox()),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          ));
                    },
                    child: Image.asset(
                      'assests/images/edit.png',
                      width: 18.0,
                      height: 18.0,
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
              Container(
                color: Color(0xffFFFF),
                child: Column(
                  children: [
                    Container(
                        color: Color(0xff5dc1c1),
                        child: Column(
                          children: [
                            Container(
                              color: Color(0xffF1F1F1),
                              child: const Divider(
                                color: Color(0xffF1F1F1),
                                height: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 53,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                      'assests/images/user-icon.jpg'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chung Min Choong',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.08,
                                  color: Color(0xffFFFFFF),
                                  fontSize: 32,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Align(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assests/images/phone.png',
                                            width: 15.0,
                                            height: 15.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '+60125721091',
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.08,
                                      color: Color(0xffFFFFFF),
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            const SizedBox(height: 5),
                            Align(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2.0),
                                            child: Image.asset(
                                              'assests/images/mail_white.png',
                                              width: 15.0,
                                              height: 15.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'bengsnail2002@yahoo.com',
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.08,
                                      color: Color(0xffFFFFFF),
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            const SizedBox(height: 20),
                          ],
                        )),
                    Container(
                        color: Color(0xffFFFFFF),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'Rating as Renter',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.08,
                                          color: Color(0xff4D4D4D),
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0.0, top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                'assests/images/rating.png',
                                                width: 18.0,
                                                height: 18.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(-0.6, -0.6),
                                            child: Icon(
                                              Icons.arrow_upward,
                                              color: Color(0xff5dc1c1),
                                              size: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                                const SizedBox(width: 10),
                                Container(
                                    height: 90,
                                    child: VerticalDivider(
                                        color: Color(0xff4D4D4D))),
                                const SizedBox(width: 10),
                                Column(children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'Rating as Owner',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.08,
                                          color: Color(0xff4D4D4D),
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0.0, top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                'assests/images/rating.png',
                                                width: 18.0,
                                                height: 18.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(-0.6, -0.6),
                                            child: Icon(
                                              Icons.arrow_upward,
                                              color: Color(0xff5dc1c1),
                                              size: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            )
                          ],
                        )),
                    Container(
                      color: Color(0xffF1F1F1),
                      child: const Divider(
                        color: Color(0xffF1F1F1),
                        height: 3,
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const IdentificationPage(
                                          title: '',
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 0.0),
                                  // child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 15 ,),
                                  child: Image.asset(
                                    'assests/images/personal-identyfication3.png',
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 0.0),
                                  child: Text(
                                    'Personal Identification',
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
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 5.0, top: 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const IdentificationPage(
                                                          title: '',
                                                        )));
                                          },
                                          child: Image.asset(
                                            'assests/images/error_2.png',
                                            width: 18.0,
                                            height: 18.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Flexible(
                                  fit: FlexFit.tight, child: SizedBox()),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, top: 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const IdentificationPage(
                                                            title: '',
                                                          )));
                                            },
                                            child: SvgPicture.asset(
                                              "assests/images/arrow.svg",
                                              width: 18.0,
                                              height: 18.0,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangePasswordPage(
                                      title: '',
                                    )));
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 0.0),
                                  child: Image.asset(
                                    'assests/images/password.png',
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 0.0),
                                  child: Text(
                                    'Change Password',
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
                              const Flexible(
                                  fit: FlexFit.tight, child: SizedBox()),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, top: 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ChangePasswordPage(
                                                            title: '',
                                                          )));
                                            },
                                            child: SvgPicture.asset(
                                              "assests/images/arrow.svg",
                                              width: 18.0,
                                              height: 18.0,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            color: Color(0xffF1F1F1),
                            child: const Divider(
                              color: Color(0xffF1F1F1),
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Image.asset(
                                  'assests/images/refered2.png',
                                  width: 30.0,
                                  height: 30.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                child: Text(
                                  'Refer & Earn',
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
                            const Flexible(
                                fit: FlexFit.tight, child: SizedBox()),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, top: 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: InkWell(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                            "assests/images/arrow.svg",
                                            width: 18.0,
                                            height: 18.0,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 0.0),
                                // child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 15 ,),
                                child: Image.asset(
                                  'assests/images/facebook3.png',
                                  width: 26.0,
                                  height: 26.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 19.0, top: 0.0),
                                child: Text(
                                  'Facebook',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff5dc1c1),
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                            const Flexible(
                                fit: FlexFit.tight, child: SizedBox()),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, top: 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Connect Now',
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.08,
                                            color: Color(0xff5dc1c1),
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
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BankDetailsPage(title: "title"),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 0.0),
                                  // child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 15 ,),
                                  child: Image.asset(
                                    'assests/images/bank-details3.png',
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 0.0),
                                  child: Text(
                                    'Bank Details',
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
                              const Flexible(
                                  fit: FlexFit.tight, child: SizedBox()),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, top: 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        BankDetailsPage(
                                                            title: "title"),
                                                  ));
                                            },
                                            child: SvgPicture.asset(
                                              "assests/images/arrow.svg",
                                              width: 18.0,
                                              height: 18.0,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          color: Color(0xffF1F1F1),
                          child: const Divider(
                            color: Color(0xffF1F1F1),
                            height: 2,
                          ),
                        ),
                      ],
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
