import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:design_project/RegisterPage.dart';
import 'package:design_project/WelcomeScreen.dart';
import 'package:design_project/constant.dart';
import 'package:design_project/utils/repository/network_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:validators/validators.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'ForgetPassword.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final dataStorage = GetStorage();

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =
      TextEditingController(text: "user1@user.com");
  TextEditingController passwordController = TextEditingController(text: "123");
  bool passhide = true;
  final NetworkRepository _networkRepository = NetworkRepository();
  String? token;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {});
  }

  login({context}) async {
    try {
      Map data = {
        'email': emailController.text.toString().trim(),
        'password': passwordController.text.toString().trim(),
        'device_token': token
      };
      var response = await _networkRepository.login(data, context);

      if (response != null && response['code'] == 200) {
        dataStorage.write('isLogin', true);
        dataStorage.write('id', response['data']['userLoggedIn']['id']);
        dataStorage.write('name', response['data']['userLoggedIn']['name']);
        dataStorage.write(
            'device_token', response['data']['userLoggedIn']['device_token']);
        dataStorage.write(
            'user_token', response['data']['userLoggedIn']['user_token']);
        dataStorage.write('email', response['data']['userLoggedIn']['email']);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(title: "title"),
            ));
      } else {
        final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: AppColor.themecolor,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        response['error']['message'].toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )));

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
      login(context: context);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => HomePage(title: "title"),
      //     ));
    }
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.themecolor,
        centerTitle: true,
        title: Text(
          'LOG IN',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ));
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
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            facebookLogin(context);
                          },
                          child: Container(
                            height: 55.h,
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
                                  scale: 12.r,
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  'Log in with Facebook',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp),
                                )
                              ],
                            ),
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
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            // hintText: 'Email',
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

                            label: Text(
                              'Password',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                          height: 60.h,
                        ),
                        InkWell(
                          onTap: () {
                            onPressLogin();
                          },
                          child: Container(
                            height: 55.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColor.themecolor,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ));
                          },
                          child: Text(
                            'forgot password?',
                            style: TextStyle(
                                color: AppColor.themecolor, fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member yet?',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RagisterPage(),
                                    ));
                              },
                              child: Text(
                                'Join us now!',
                                style: TextStyle(
                                    color: AppColor.themecolor,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ],
                        )
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

  Future<void> facebookLogin(context) async {
    // await FacebookAuth.instance.logOut();
    FirebaseMessaging.instance.getToken().then((value) {
      token = value;
    });
    final LoginResult result = await FacebookAuth.instance.login(permissions: [
      'email',
      'public_profile',
    ], loginBehavior: LoginBehavior.webOnly);

    switch (result.status) {
      case LoginStatus.success:
        final AccessToken accessToken = result.accessToken!;
        log(accessToken.token.toString());
        log(accessToken.applicationId.toString());
        log(accessToken.userId.toString());
        final graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v3.3/me?fields=name,picture,friends,email&access_token=${accessToken.token}'));
        final profile = json.decode(graphResponse.body);
        facebookLoginApi(
            context: context,
            accessToken: accessToken.token,
            providerid: profile['id'].toString(),
            email: profile['email'].toString(),
            firstname: profile['name'].toString(),
            deviceToken: token);

        break;
      case LoginStatus.cancelled:
        final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Facebook login cancelled by user'.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        break;
      case LoginStatus.failed:
        final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Login Failed'.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        break;
      case LoginStatus.operationInProgress:
        final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Facebook login is in progress!'.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // CommonMethod().getXSnackBar(
        //     "Login in Progress", "Facebook login is in progress!", infoDialog);

        break;
    }
  }

  facebookLoginApi({
    context,
    accessToken,
    deviceToken,
    firstname,
    email,
    providerid,
  }) async {
    //     "first_name": "Sakib",
    // "last_name": "Ali",
    // "email": "customer013@gmail.com",
    // "password": "aa123422",
    // "device_token": "432rewfwefw",
    // "account_type": "Private Account",
    // "provider_id": "pI28787989s8d9assda2s",
    // "provider_type": "google"
    final data = {
      "first_name": firstname,
      "email": email,
      "account_type": "Private Account",
      "provider_id": providerid,
      "provider_type": "facebook",
      "device_token": deviceToken
    };
    log(data.toString());
    final response = await _networkRepository.socialLogin(data, context);
    if (response['code'] == 200 && response != null) {
      dataStorage.write('isLogin', true);
      dataStorage.write('id', response['data']['socialLoggedIn']['id']);
      dataStorage.write('name', response['data']['socialLoggedIn']['name']);
      dataStorage.write(
          'device_token', response['data']['socialLoggedIn']['device_token']);
      dataStorage.write(
          'user_token', response['data']['socialLoggedIn']['user_token']);
      dataStorage.write('email', response['data']['socialLoggedIn']['email']);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(title: "title"),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      response['error']['message'].toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
