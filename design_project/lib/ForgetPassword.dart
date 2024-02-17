import 'dart:developer';
import 'dart:ui';

import 'package:design_project/utils/repository/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final NetworkRepository _networkRepository = NetworkRepository();
  TextEditingController emailController = TextEditingController();

  forgetPassword({context}) async {
    try {
      Map data = {
        'email': emailController.text.toString().trim(),
      };
      var response = await _networkRepository.forgetPassword(data, context);

      log(response['result'].toString());
      if (response != null && response['result'] != null) {
        final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: AppColor.themecolor,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                response['result'].toString(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: AppColor.themecolor,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                response['data']['message'].toString(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.themecolor,
        centerTitle: true,
        title: Text(
          'FORGOT PASSWORD?',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                //filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
                image: AssetImage(
                    'assests/alex-motoc-8ySdsqmhikM-unsplash (1).jpg'),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              //key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            label: Text(
                              'Email',
                              style: TextStyle(color: Colors.white),
                            ),
                            border: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        InkWell(
                          onTap: () {
                            forgetPassword(context: context);
                          },
                          child: Container(
                            height: 55.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColor.themecolor,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                              child: Text(
                                'RESET PASSWORD',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 55.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                // color: AppColor.themecolor,
                                borderRadius: BorderRadius.circular(5.r),
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: Center(
                              child: Text(
                                'CANCEL',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
