import 'package:design_project/constant.dart';
import 'package:design_project/ui/my_listing_manage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MycarListingScreen extends StatefulWidget {
  const MycarListingScreen({Key? key}) : super(key: key);

  @override
  State<MycarListingScreen> createState() => _MycarListingScreenState();
}

class _MycarListingScreenState extends State<MycarListingScreen> {
  int selectedIndex = 0;

  List carList = [
    {
      'Car': "assests/car.jpg",
      'Name': 'Mazda CX-5 (2013)',
      'isVisible': false,
      'Price': '59/day'
    },
    {
      'Car': "assests/car-2.jpg",
      'Name': 'ND Rover RANGE ROVER SP',
      'isVisible': true,
      'Price': '150/day'
    },
    {
      'Car': "assests/car.jpg",
      'Name': 'Tata Safari',
      'isVisible': true,
      'Price': '100/day'
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assests/images/back.png',
                    width: 18.0,
                    height: 18.0,
                  ),
                ),
              ],
            ), // set your color here
            onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'My Listing',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectedIndex = 0;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      color: selectedIndex == 0
                          ? AppColor.themecolor
                          : Colors.grey.shade300,
                      child: Center(
                        child: Text(
                          'Cars',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.08,
                            color: selectedIndex == 0
                                ? Colors.white
                                : const Color(0xff4D4D4D),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Color(0xff4D4D4D),
                  width: 1,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectedIndex = 1;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      color: selectedIndex == 1
                          ? AppColor.themecolor
                          : Colors.grey.shade300,
                      child: Center(
                        child: Text(
                          'Pending',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.08,
                            color: selectedIndex == 1
                                ? Colors.white
                                : const Color(0xff4D4D4D),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Color(0xff4D4D4D),
                  width: 1,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectedIndex = 2;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      color: selectedIndex == 2
                          ? AppColor.themecolor
                          : Colors.grey.shade300,
                      child: Center(
                        child: Text(
                          'Booking History',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.08,
                            color: selectedIndex == 2
                                ? Colors.white
                                : const Color(0xff4D4D4D),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
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
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xff4D4D4D)),
                                  image: DecorationImage(
                                      image: AssetImage(carList[index]['Car']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                child: Container(
                                  height: 35,
                                  width: 120,
                                  color: Colors.grey.shade900,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        carList[index]['isVisible'] == true
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off_rounded,
                                        color:
                                            carList[index]['isVisible'] == true
                                                ? Colors.white
                                                : Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Invisible',
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.08,
                                          color: carList[index]['isVisible'] ==
                                                  true
                                              ? Colors.white
                                              : Colors.grey,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    carList[index]['Name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.08,
                                      color: const Color(0xff4D4D4D),
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'MYR',
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.08,
                                      color: const Color(0xff4D4D4D),
                                      fontSize: 12,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  Text(
                                    carList[index]['Price'],
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.08,
                                      color: const Color(0xff4D4D4D),
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MyListingMangeScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppColor.themecolor)),
                                  child: Center(
                                    child: Text(
                                      'Manage',
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.08,
                                        color: AppColor.themecolor,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: AppColor.themecolor)),
                                child: Center(
                                  child: Text(
                                    'Earning',
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
                                      color: AppColor.themecolor,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
