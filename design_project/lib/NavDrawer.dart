import 'package:design_project/LoginPage.dart';
import 'package:design_project/ui/BankDetails.dart';
import 'package:design_project/ui/CarPricing.dart';
import 'package:design_project/ui/Checkout.dart';
import 'package:design_project/ui/Identification.dart';
import 'package:design_project/ui/KwikMatchList.dart';
import 'package:design_project/ui/UpComingTrip.dart';
import 'package:design_project/ui/approval_request_screen.dart';
import 'package:design_project/ui/carEstimate.dart';
import 'package:design_project/ui/carLocation.dart';
import 'package:design_project/ui/Reservations.dart';
import 'package:design_project/ui/help.dart';
import 'package:design_project/ui/menuSearchFilter.dart';
import 'package:design_project/ui/my_listing_screen.dart';
import 'package:design_project/ui/pending_request_screen.dart';
import 'package:design_project/ui/reciept_Screen.dart';
import 'package:design_project/ui/referEarn.dart';
import 'package:design_project/WelcomeScreen.dart';
import 'package:design_project/ui/sent_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Account.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Color(0xff5dc1c1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {Navigator.of(context).pop()},
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0, right: 15.0),
                      child: Image.asset(
                        'assests/images/close.png',
                        width: 18.0,
                        height: 18.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assests/images/user-icon.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Chung Min Choong',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFFFFF),
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 1,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 2.0, top: 0.0),
                      child: Image.asset(
                        'assests/images/search-icon.png',
                        width: 20.5,
                        height: 20.5,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                      child: Text(
                        'Search',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.08,
                          color: Color(0xffFFFFFF),
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                menuSearchFilterPage(title: "title"),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountPage(title: "title"),
                      ));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 0.0),
                        child: Image.asset(
                          'assests/images/user_2.png',
                          width: 22.0,
                          height: 22.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 37.0, top: 0.0),
                        child: Text(
                          'Account',
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AccountPage(title: "title"),
                                      ));
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Image.asset(
                'assests/images/mail_2.png',
                width: 23.0,
                height: 23.0,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Inbox',
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
            onTap: () => {Navigator.of(context).pop()},
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/link_1.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Refer & Earn',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReferEarnPage(title: "title"),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: const Icon(
              Icons.payment,
              size: 30,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Recipt',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecieptScreen(),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: const Icon(
              Icons.pending_actions,
              size: 30,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Pending Request',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PendingRequestScreen(),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: const Icon(
              Icons.approval_sharp,
              size: 30,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Approval Request',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApprovalRequestScreen(),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: const Icon(
              Icons.send_rounded,
              size: 30,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Sent Request',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SentRequestScreen(),
                  ));
            },
          ),
          const SizedBox(height: 5),
          Container(
            color: Color(0xffe7f7f7),
            height: 50.0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, top: 14.0, bottom: 14.0),
              child: Text(
                'RENTER',
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4D4D4D),
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/link_2.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Kwickmatch',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KwikMatchListPage(title: "title"),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/calendar.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'My Trips',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpComingTripPage(title: "title"),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: SvgPicture.asset(
              "assests/images/favourite.svg",
              height: 22.0,
              width: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'My Favourites',
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
            onTap: () => {Navigator.of(context).pop()},
          ),
          const SizedBox(height: 5),
          Container(
            color: Color(0xffe7f7f7),
            height: 50.0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, top: 14.0, bottom: 14.0),
              child: Text(
                'OWNER',
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4D4D4D),
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/car.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'My Cars',
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
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MycarListingScreen()))
            },
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 17.0, top: 0.0),
                        child: Image.asset(
                          'assests/images/bell.png',
                          width: 22.0,
                          height: 22.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 38.0, top: 0.0),
                        child: Text(
                          'Notifications',
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {},
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Image.asset(
              'assests/images/car_price.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Car Pricing',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarPricingPage(title: "title"),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/car_estimate.png',
              width: 30.0,
              height: 30.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Estimate Car Value',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarEstimate(),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/map_location.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Car Locations',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarLocation(),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/help.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Helps',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpPage(title: "title"),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/checkout.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Checkout',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(title: "title"),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/calendar.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Reservations',
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
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservationsPage(title: "title"),
                  ));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: Image.asset(
              'assests/images/calendar.png',
              width: 22.0,
              height: 22.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Logout',
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
            onTap: () {
              Navigator.pop(context);
              dataStorage.erase();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ));
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
