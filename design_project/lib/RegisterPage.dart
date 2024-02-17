import 'dart:developer';
import 'dart:ui';
import 'package:design_project/HomePage.dart';
import 'package:design_project/LoginPage.dart';
import 'package:design_project/WelcomeScreen.dart';
import 'package:design_project/utils/repository/network_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validators/validators.dart';
import 'constant.dart';

class RagisterPage extends StatefulWidget {
  const RagisterPage({Key? key}) : super(key: key);

  @override
  State<RagisterPage> createState() => _RagisterPageState();
}

class _RagisterPageState extends State<RagisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController companynumber = TextEditingController();
  TextEditingController referController = TextEditingController();
  final NetworkRepository _networkRepository = NetworkRepository();
  String? token;
  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    log(token.toString());
    setState(() {});
  }

  signUp({context}) async {
    try {
      Map data = {
        "first_name": firstname.text.toString().trim(),
        "last_name": lastname.text.toString().trim(),
        "email": emailController.text.toString().trim(),
        "password": passwordController.text.toString().trim(),
        "refer_code": referController.text.toString().trim(),
        "device_token": token.toString(),
        "account_type": _radiovalue == 1 ? 'Private Account' : 'Company Account'
      };
      var response = await _networkRepository.signup(data, context);

      if (response != null &&
          response['error'] == null &&
          response['data'] != null) {
        dataStorage.write('isLogin', true);
        dataStorage.write('id', response['data']['userRegistered']['id']);
        dataStorage.write('name', response['data']['userRegistered']['name']);
        dataStorage.write(
            'device_token', response['data']['userRegistered']['device_token']);
        dataStorage.write(
            'user_token', response['data']['userRegistered']['user_token']);
        dataStorage.write('email', response['data']['userRegistered']['email']);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(title: "title"),
            ));
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

  onPressLogin() async {
    var email = emailController.text.toString();
    var password = passwordController.text.toString();

    if (email == "" || !isEmail(email)) {
      Fluttertoast.showToast(
        msg: "Email is required",
        backgroundColor: AppColor.themecolor, // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location// duration
      );
      return;
    } else if (password == "") {
      Fluttertoast.showToast(
        msg: "Password is required", // message
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: AppColor.themecolor, // length
        gravity: ToastGravity.CENTER, // location// duration
      );
      return;
    } else {
      signUp(context: context);
    }
  }

  _showrefercodemassage() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: AlignmentDirectional.center,
          contentPadding: EdgeInsets.all(10),
          title: Text(
            'What is Referral Code?',
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  'A referral code is a unique code that is assigned to every user.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                'If you have been invited to join Kwikcar by your friends, you must input their code or use their direct link in order for both you and your friend to receive the referral bonus.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.themecolor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                  child: Text(
                    'GOT IT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  final _formkey = GlobalKey<FormState>();
  bool passhide = true;
  bool value1 = false;
  bool checkedValue = false;
  String dropdownvalue = 'Private Account';

  // List of items in our dropdown menu
  var items = [
    'Private Account',
    'Company Account',
  ];

  String _selectedGender = 'male';

  bool safe = false;
  bool approach = false;
  var _radiovalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.themecolor,
        centerTitle: true,
        title: Text(
          'SIGN UP',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomeScreen(),
              ),
            );
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
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                image: AssetImage('assests/sign_up_bg.jpg'),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xff3b5b98),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                              Image.asset(
                                'assests/Facebook-Logo-Inverted-Feature-Image-Indigo.png',
                                scale: 15.r,
                              ),
                              SizedBox(
                                width: 40.w,
                              ),
                              Text(
                                'Log in with Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(30.r)),
                          child: Center(
                            child: Text(
                              'or',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          //      height: 40,
                          child: TextFormField(
                            controller: firstname,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              //    hintText: 'FirstName(Real name is compulsory)',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              label: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'First Name (Real name is compulsory)',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
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
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: lastname,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            // hintText: 'LastName(Real name is compulsory)',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Last Name (Real name is compulsory)',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
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
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            // hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
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
                          height: 15.h,
                        ),
                        TextFormField(
                          obscureText: passhide,
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            //  hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),

                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            suffixIcon: passhide == true
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        passhide = false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ))
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        passhide = true;
                                      });
                                    },
                                    child: Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    )),
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
                          height: 15.h,
                        ),
                        TextFormField(
                          obscureText: passhide,
                          controller: referController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            //  hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: const Text(
                                'Referral Code (Optional)',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _showrefercodemassage();
                                  // _buildPopupDialog();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.info_outline,
                                  size: 25,
                                  color: Colors.white,
                                )),
                            border: InputBorder.none,
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            disabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Account Type',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       border:
                        //           Border.all(width: 1, color: Colors.white)),
                        //   child: Padding(
                        //     padding:
                        //         const EdgeInsets.symmetric(horizontal: 4.0),
                        //     child: DropdownButtonHideUnderline(
                        //       child: DropdownButton(
                        //         // Initial Value
                        //         value: dropdownvalue,
                        //         dropdownColor: Colors.black38,
                        //
                        //         // Down Arrow Icon
                        //         /* icon: const Icon(
                        //           Icons.keyboard_arrow_down,
                        //           color: Colors.white,
                        //         ),*/
                        //         isExpanded: true,
                        //         // Array list of items
                        //         items: items.map((String items) {
                        //           return DropdownMenuItem(
                        //             value: items,
                        //             child: Text(
                        //               items,
                        //               style: TextStyle(color: Colors.white),
                        //             ),
                        //           );
                        //         }).toList(),
                        //         // After selecting the desired option,it will
                        //         // change button value to selected value
                        //         onChanged: (String? newValue) {
                        //           setState(() {
                        //             dropdownvalue = newValue!;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: SizedBox(
                                      height: 155.h,
                                      width: double.infinity,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey.shade900,
                                        ),
                                        child: Material(
                                          color: Colors.blueGrey.shade900,
                                          child: Column(
                                            children: [
                                              // SizedBox(height: 5.h),
                                              // Padding(
                                              //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                              //   child: Row(
                                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //     children: [
                                              //       Text(
                                              //         'Private Account',
                                              //         style: TextStyle(
                                              //           color: Colors.white,
                                              //           fontSize: 18.sp,
                                              //         ),
                                              //       ),
                                              //       Radio(
                                              //         value: 1,
                                              //         groupValue: _radiovalue,
                                              //         onChanged: (value) {
                                              //           setState(() {
                                              //             _radiovalue = value;
                                              //           });
                                              //         },
                                              //         fillColor: MaterialStateProperty.all(Colors.cyan),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // )

                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _radiovalue = 1;
                                                    Navigator.pop(
                                                        context, false);
                                                  });
                                                },
                                                child: ListTile(
                                                  title: Text(
                                                    "Private Account",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.sp,
                                                    ),
                                                  ),
                                                  trailing: Radio(
                                                    value: 1,
                                                    groupValue: _radiovalue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _radiovalue = value;
                                                      });
                                                    },
                                                    fillColor:
                                                        MaterialStateProperty
                                                            .all(Colors.cyan),
                                                  ),
                                                ),
                                              ),
                                              Divider(color: Colors.white),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _radiovalue = 2;
                                                    Navigator.pop(
                                                        context, false);
                                                  });
                                                },
                                                child: ListTile(
                                                  title: Text(
                                                    "Company Account",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.sp,
                                                    ),
                                                  ),
                                                  trailing: Radio(
                                                    value: 2,
                                                    groupValue: _radiovalue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _radiovalue = value;
                                                        Navigator.pop(
                                                            context, false);
                                                      });
                                                    },
                                                    fillColor:
                                                        MaterialStateProperty
                                                            .all(Colors.cyan),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: Center(
                              child: Text(
                                _radiovalue == 1
                                    ? "Private Account"
                                    : "Company Account",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        dropdownvalue == 'Company Account'
                            ? TextFormField(
                                controller: companynumber,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      'Company Registration Number',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
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
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                              child: Checkbox(
                                fillColor: MaterialStateProperty.all(
                                    Colors.blueAccent),
                                activeColor: Colors.white,
                                checkColor: Colors.white,
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                value: checkedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                  overflow: TextOverflow.visible,
                                  maxLines: 2,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'I agree with the ',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white)),
                                    TextSpan(
                                        text:
                                            'Terms of Service, Privacy Policy, and Personal Data Protection Act',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: AppColor.themecolor))
                                  ])),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            onPressLogin();
                          },
                          child: Container(
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: checkedValue == true
                                    ? AppColor.themecolor
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
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

  Dialog errorDialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    //this right here
    child: Container(
      height: 300.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Cool',
              style: TextStyle(color: Colors.red),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Awesome',
              style: TextStyle(color: Colors.red),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 50.0)),
          TextButton(
              onPressed: () {
                //  Navigator.of(context).pop();
              },
              child: Text(
                'Got It!',
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
              ))
        ],
      ),
    ),
  );

  _showrefercodemassage1() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: AlignmentDirectional.center,
          contentPadding: EdgeInsets.all(10),
          title: Text(
            'What is Referral Code?',
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  'A referral code is a unique code that is assigned to every user.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                'If you have been invited to join Kwikcar by your friends, you must input their code or use their direct link in order for both you and your friend to receive the referral bonus.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.themecolor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                  child: Text(
                    'GOT IT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomPopup extends StatefulWidget {
  @override
  _CustomPopupState createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup> {
  bool safe = false;
  bool approach = false;
  var _radiovalue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          height: 125.h,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
            ),
            child: Material(
              color: Colors.blueGrey.shade900,
              child: Column(
                children: [
                  // SizedBox(height: 5.h),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Private Account',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 18.sp,
                  //         ),
                  //       ),
                  //       Radio(
                  //         value: 1,
                  //         groupValue: _radiovalue,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _radiovalue = value;
                  //           });
                  //         },
                  //         fillColor: MaterialStateProperty.all(Colors.cyan),
                  //       ),
                  //     ],
                  //   ),
                  // )

                  ListTile(
                    title: Text(
                      "Private Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                    trailing: Radio(
                      value: 1,
                      groupValue: _radiovalue,
                      onChanged: (value) {
                        setState(() {
                          _radiovalue = value;
                        });
                      },
                      fillColor: MaterialStateProperty.all(Colors.cyan),
                    ),
                  ),
                  Divider(color: Colors.white),
                  ListTile(
                    title: Text(
                      "Company Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                    trailing: Radio(
                      value: 1,
                      groupValue: _radiovalue,
                      onChanged: (value) {
                        setState(() {
                          _radiovalue = value;
                        });
                      },
                      fillColor: MaterialStateProperty.all(Colors.cyan),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRadio extends StatefulWidget {
  final int value;
  var groupValue;
  final void Function(int) onChanged;

  CustomRadio(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? Colors.white : const Color(0xFF447695),
          border: Border.all(
            width: 2.w,
            color: selected ? Colors.deepPurple : const Color(0xFFFFFFFF),
          ),
        ),
        child: Icon(
          Icons.circle,
          size: 20,
          color: selected ? Colors.deepPurple : const Color(0xFF447695),
        ),
      ),
    );
  }
}
