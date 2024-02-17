import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../NavDrawer.dart';
import '../constant.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        drawer: NavDrawer(),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black26, // <-- SEE HERE
            statusBarIconBrightness:
                Brightness.light, //<-- For Android SEE HERE (dark icons)
            statusBarBrightness:
                Brightness.dark, //<-- For iOS SEE HERE (dark icons)
          ),
          leading: IconButton(
              icon: Row(
                children: const [
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
          elevation: 4,
          title: Text(
            'RESERVATIONS',
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.08,
              fontSize: 18,
              fontStyle: FontStyle.normal,
            ),
          ),
          backgroundColor: AppColor.themecolor,
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white38,
            tabs: [
              Tab(
                child: Text(
                  'PENDING',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.08,
                    fontSize: 13,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'APPROVED',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.08,
                    fontSize: 13,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'PAST',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.08,
                    fontSize: 13,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'No Pending Reservations',
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          height: 1.4,
                          letterSpacing: 0.08,
                          color: Color(0Xff454545),
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Reservations approved.',
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          letterSpacing: 0.08,
                          color: Color(0Xff454545),
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'No past reservations yet.',
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          letterSpacing: 0.08,
                          color: Color(0Xff454545),
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
