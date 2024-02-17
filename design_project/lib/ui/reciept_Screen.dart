import 'package:design_project/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RecieptScreen extends StatefulWidget {
  const RecieptScreen({Key? key}) : super(key: key);

  @override
  State<RecieptScreen> createState() => _RecieptScreenState();
}

class _RecieptScreenState extends State<RecieptScreen> {
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
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
          'RECIEPT SCREEN',
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'PERODUA AXIA 2015',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.08,
                  color: Color(0xff4D4D4D),
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              customTextTile(title: 'Total Booking Days', value: '2 Day(s)'),
              const SizedBox(
                height: 10,
              ),
              customTextTile(title: 'Subtotal', value: 'RM 126'),
              const SizedBox(
                height: 10,
              ),
              // help
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Service Fee (5%)',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.08,
                          color: const Color(0xff4D4D4D),
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColor.themecolor),
                        child: Image.asset(
                          'assests/images/help.png',
                          height: 14,
                          width: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Text(
                    '+ RM 6.3',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08,
                      color: const Color(0xff4D4D4D),
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Color(0xff4D4D4D),
                thickness: 1,
              ),
              customTextTile(title: 'Trip Amount', value: 'RM 132.3'),
              const SizedBox(
                height: 10,
              ),
              customTextTile(
                  title: 'Promo Code',
                  value: 'WELCOME15',
                  color: Colors.green.shade500),
              const SizedBox(
                height: 10,
              ),
              customTextTile(
                  title: 'Discount Price',
                  value: '- RM 19.85',
                  color: Colors.green.shade500),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Color(0xff4D4D4D),
                thickness: 1,
              ),
              customTextTile(
                  title: 'Total Trip Amount',
                  value: 'RM 112.45',
                  fontsize: 20.0,
                  fontweight: FontWeight.w700),

              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Petrol:\nRon95',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.08,
                            color: Color(0xff4D4D4D),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assests/images/car_fill.png',
                        ),
                        Text(
                          'Hatchback',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.08,
                            color: Color(0xff4D4D4D),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Transmission:\nAuto',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.08,
                            color: Color(0xff4D4D4D),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Container(
                width: 250,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: Text(
                    'Plate Number: BSS3424',
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
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Know Before You Rent',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.08,
                    color: Color(0xff4D4D4D),
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset('assests/images/fulltank.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Full to full tank',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.08,
                      color: Color(0xff4D4D4D),
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset('assests/images/nopets.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'No pets',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.08,
                      color: Color(0xff4D4D4D),
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset('assests/images/nosmoking.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'No smoking',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.08,
                      color: Color(0xff4D4D4D),
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextTile(
      {String? title, String? value, color, fontsize, fontweight}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Text(
            title.toString(),
            style: GoogleFonts.lato(
              fontWeight: fontweight ?? FontWeight.w500,
              letterSpacing: 0.08,
              color: color ?? Color(0xff4D4D4D),
              fontSize: fontsize ?? 16,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
      Text(
        value.toString(),
        style: GoogleFonts.lato(
          fontWeight: fontweight ?? FontWeight.w500,
          letterSpacing: 0.08,
          color: color ?? Color(0xff4D4D4D),
          fontSize: fontsize ?? 16,
          fontStyle: FontStyle.normal,
        ),
      )
    ]);
  }
}
