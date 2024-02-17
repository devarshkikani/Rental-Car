import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:design_project/constant.dart';
import 'package:design_project/utils/app_constants.dart';
import 'package:design_project/utils/repository/network_repository.dart';
import 'package:design_project/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  XFile? selectedImage;
  final ImagePicker _picker = ImagePicker();
  String? phoneCode;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastNameeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  NetworkRepository networkRepository = NetworkRepository();
  editProfile({context}) async {
    var response = await networkRepository.editProfile(
        selectedImage != null ? File(selectedImage!.path) : null,
        '${AppConstants.apiEndPoint}${AppConstants.updateProfile}',
        'profile_picture',
        email: emailController.text.toString().trim(),
        firstname: firstnameController.text.toString().trim(),
        lastname: lastNameeController.text.toString().trim(),
        mobileno: mobileNumberController.text.toString().trim(),
        phonecode: phoneCode);
    response.listen(
      (value) {
        dynamic imageUploadResponse = jsonDecode(value);
        log(imageUploadResponse.toString());

        if (imageUploadResponse != null && imageUploadResponse['code'] == 200) {
          Navigator.pop(context);
          CommonMethod().showSnackBar(
              context, imageUploadResponse['data']['message'].toString());
        } else {
          CommonMethod()
              .showSnackBar(context, imageUploadResponse['error'].toString());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
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
          'ACCOUNT',
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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 260.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  'Choose Photo',
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                    color: Color(0xff4D4D4D),
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            Navigator.pop(context);

                                            // Pick an image
                                            selectedImage =
                                                await _picker.pickImage(
                                                    source: ImageSource.camera);
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xff4D4D4D),
                                                ),
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.camera,
                                              size: 40,
                                              color: AppColor.themecolor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Camera',
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
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            Navigator.pop(context);

                                            selectedImage =
                                                await _picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xff4D4D4D),
                                                ),
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.photo_library,
                                              size: 30,
                                              color: AppColor.themecolor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Text(
                                          'Gallery',
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.08,
                                            color: Color(0xff4D4D4D),
                                            fontSize: 14,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: selectedImage == null
                        ? Image.asset(
                            "assests/images/personal-identyfication.png",
                            height: 150,
                            width: 150,
                            color: AppColor.themecolor,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: Image.file(
                              File(
                                selectedImage!.path,
                              ),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Change Photo',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08,
                      color: Color(0xff4D4D4D),
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Personal Information',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.08,
                    color: Color(0xff4D4D4D),
                    fontSize: 26,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 2),
                          child: customTextfield(
                              hintText: 'First Name',
                              controller: firstnameController,
                              validator: (value) => Validators.validateName(
                                  value.toString(), 'First Name'))),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 2),
                          child: customTextfield(
                              hintText: 'Last Name',
                              controller: lastNameeController,
                              validator: (value) => Validators.validateName(
                                  value.toString(), 'Last Name'))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                customTextfield(
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) =>
                        Validators.validateEmail(value.toString())),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                          exclude: <String>['KN', 'MF'],
                          favorite: <String>['SE'],
                          //Optional. Shows phone code before the country name.
                          showPhoneCode: true,

                          onSelect: (Country country) {
                            // print('Select country: ${country.displayName}');
                            phoneCode = '+' + country.phoneCode.toString();
                            setState(() {});
                          },
                          // Optional. Sets the theme for the country list picker.
                          countryListTheme: CountryListThemeData(
                            // Optional. Sets the border radius for the bottomsheet.
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                            // Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        // width: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                            child: Text(phoneCode == null
                                ? "+01"
                                : phoneCode.toString())),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: customTextfield(
                          hintText: 'Phone Number',
                          keyboardType: TextInputType.phone,
                          validator: (value) =>
                              Validators.validateMobile(value.toString()),
                          controller: mobileNumberController),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: AppColor.themecolor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.lock_sharp,
                      color: AppColor.themecolor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Password',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff808080),
                          fontSize: 18,
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: AppColor.themecolor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: AppColor.themecolor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add Credit Card',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff808080),
                          fontSize: 18,
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: AppColor.themecolor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: AppColor.themecolor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add Personal Identification',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff808080),
                          fontSize: 18,
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (formKey.currentState!.validate()) {
            log('dfvdfvdfv');
            editProfile(context: context);
          }
        },
        child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.themecolor,
              borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              'SAVE',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
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
