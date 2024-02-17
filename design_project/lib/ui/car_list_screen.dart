import 'package:design_project/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({Key? key}) : super(key: key);

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  bool isDistance = true;

  List carList = [
    {
      'Profile': "assests/user.jpg",
      'Car': "assests/car.jpg",
      'Name': 'ND Rover RANGE ROVER SP',
      "Distance": "ACK - 1.1 KM",
      "Model": "RM1308",
    },
    {
      'Profile': "assests/user-2.jpg",
      'Car': "assests/car-2.jpg",
      'Name': 'ND Rover RANGE ROVER SP',
      "Distance": "ACK - 1.1 KM",
      "Model": "RM1308",
    },
    {
      'Profile': "assests/600-07278923en_Masterfile.jpg",
      'Car': "assests/car.jpg",
      'Name': 'ND Rover RANGE ROVER SP',
      "Distance": "ACK - 1.1 KM",
      "Model": "RM1308",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
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
          'Car List',
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  'assests/images/search_icon_34.png',
                  height: 20,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Location',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.08,
                        color: const Color(0xff4D4D4D),
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '13 Oct 18 - 20 Oct 18',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.08,
                        color: const Color(0xff4D4D4D),
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  isDistance = true;
                  setState(() {});
                },
                child: Container(
                  height: 40.h,
                  width: 150,
                  decoration: BoxDecoration(
                      color: isDistance == true
                          ? AppColor.themecolor
                          : Colors.white,
                      border: Border.all(color: AppColor.themecolor),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DISTANCE ',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.08,
                          color: isDistance == true
                              ? Colors.white
                              : AppColor.themecolor,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        color: isDistance == true
                            ? Colors.white
                            : AppColor.themecolor,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  isDistance = false;
                  setState(() {});
                },
                child: Container(
                  height: 40.h,
                  width: 150,
                  decoration: BoxDecoration(
                      color: isDistance == false
                          ? AppColor.themecolor
                          : Colors.white,
                      border: Border.all(color: AppColor.themecolor),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PRICE ',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.08,
                          color: isDistance == false
                              ? Colors.white
                              : AppColor.themecolor,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        color: isDistance == false
                            ? Colors.white
                            : AppColor.themecolor,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: carList.length,
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xff4D4D4D))),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  carList[index]['Car'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: -30,
                              left: 0,
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(carList[index]['Profile']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -30,
                              left: 50,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.yellow.shade600,
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      carList[index]['Name'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.08,
                                        color: AppColor.themecolor,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    Text(
                                      carList[index]['Distance'],
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.08,
                                        color: const Color(0xff4D4D4D),
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: AppColor.themecolor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Text(
                                carList[index]['Model'],
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.08,
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
