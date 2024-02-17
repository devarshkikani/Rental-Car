import 'dart:developer';

import 'package:design_project/HomePage.dart';
import 'package:design_project/LoginPage.dart';
import 'package:design_project/utils/repository/network_repository.dart';
import 'package:design_project/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../NavDrawer.dart';
import '../constant.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final NetworkRepository _networkRepository = NetworkRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  changePassword({context}) async {
    try {
      Map data = {
        "old_password": currentPassword.text.toString().trim(),
        "new_password": newpassword.text.toString().trim(),
        "confirm_password": confirmpassword.text.toString().trim()
      };
      var response = await _networkRepository.changePassword(data, context);

      if (response != null && response['code'] == 200) {
        Navigator.pop(context);
        CommonMethod()
            .showSnackBar(context, response['data']['message'].toString());
      } else {
        CommonMethod()
            .showSnackBar(context, response['error']['message'].toString());
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
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
          'CHANGE PASSWORD',
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
      ),
      body: Form(
        key: formKey,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Container(
                child: ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      //height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Text(
                                'Current Password',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.08,
                                  fontSize: 16,
                                  color: Color(0Xff000000),
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: customTextfield(
                              controller: currentPassword,
                              hintText: '',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Text(
                                'New Password',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.08,
                                  fontSize: 16,
                                  color: Color(0Xff000000),
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: customTextfield(
                              controller: newpassword,
                              validator: (value) =>
                                  Validators.validatePassword(value.toString()),
                              hintText: '',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Text(
                                'Confirm New Password',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.08,
                                  fontSize: 16,
                                  color: Color(0Xff000000),
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: customTextfield(
                              controller: confirmpassword,
                              hintText: '',
                              validator: (value) =>
                                  Validators.validatePassword(value.toString()),
                            ),
                          ),
                          const SizedBox(height: 90),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonTheme(
                  minWidth: double.infinity,
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate() &&
                          confirmpassword.text == newpassword.text) {
                        changePassword(context: context);
                      } else {
                        CommonMethod().showSnackBar(context,
                            "Password and Confirm password dosn't match");
                      }
                    },
                    child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff5dc1c1),
                            border: Border.all(color: Color(0xff5dc1c1))),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'SAVE',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF),
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              )
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

  Widget customTextfield(
      {String? hintText,
      TextEditingController? controller,
      String? Function(String?)? validator,
      TextInputType? keyboardType,
      Widget? prefixIcon}) {
    return TextFormField(
      validator: validator,
      scrollPadding: EdgeInsets.only(bottom: 20),
      controller: controller,
      cursorColor: Color(0xff333333),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        hintText: hintText,
        prefixIcon: prefixIcon,
        focusColor: Color(0xffcdcdcd),
        hintStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            color: const Color(0xff808080),
            fontSize: 18,
            fontStyle: FontStyle.normal),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.themecolor)),
      ),
      keyboardType: keyboardType,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Color(0xff333333),
        fontSize: 18,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
