import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:design_project/constant.dart';
import 'package:design_project/utils/network_dio/network_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../app_constants.dart';
import '../process_indicator.dart';

class NetworkRepository {
  static NetworkRepository networkRepository = NetworkRepository._internal();
  static final dataStorage = GetStorage();
  static Circle processIndicator = Circle();

  factory NetworkRepository() {
    return networkRepository;
  }
  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();

  login(data, context) async {
    log(data.toString());
    try {
      Map response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: '${AppConstants.apiEndPoint}${AppConstants.login}',
        data: data,
      );
      return checkResponse(response, context);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  forgetPassword(data, context) async {
    log(data.toString());
    try {
      Map response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: '${AppConstants.apiEndPoint}${AppConstants.forgetPassword}',
        data: data,
      );
      return checkResponse(response, context);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  changePassword(data, context) async {
    try {
      Map response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: '${AppConstants.apiEndPoint}${AppConstants.changePassword}',
        data: data,
        header: Options(
          headers: {
            "Authorization":
                'Bearer ' + dataStorage.read("user_token").toString()
          },
        ),
      );
      return checkResponse(response, context);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  signup(data, context) async {
    log(data.toString());
    try {
      Map response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: '${AppConstants.apiEndPoint}${AppConstants.signup}',
        data: data,
      );
      return checkResponse(response, context);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  socialLogin(data, context) async {
    log(data.toString());
    try {
      Map response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: '${AppConstants.apiEndPoint}${AppConstants.socialLogin}',
        data: data,
      );
      return checkResponse(response, context);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> editProfile(
    File? imageFile,
    String apiEndPoint,
    String paramName, {
    String? firstname,
    String? lastname,
    String? email,
    String? phonecode,
    String? mobileno,
  }) async {
    print('\nToken :${dataStorage.read("user_token")}');
    String token = 'Bearer ' + await dataStorage.read("user_token");
    Map<String, String> headers = {"Authorization": token};
    var uri = Uri.parse(apiEndPoint);
    var request = http.MultipartRequest("POST", uri);
    if (imageFile != null) {
      var stream = http.ByteStream(Stream.castFrom(imageFile.openRead()));
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
        paramName,
        stream,
        length,
        filename: imageFile.path.split('/').last,
      );
      request.files.add(multipartFile);
    }
    request.headers.addAll(headers);
    request.fields.addAll({
      if (firstname != null) 'first_name': firstname,
      if (lastname != null) 'last_name': lastname,
      if (email != null) 'email': email,
      if (phonecode != null) 'phone_code': phonecode,
      if (mobileno != null) 'mobile_no': mobileno

      // "image_ids": image_ids
    });
    var response = await request.send();
    print(response);
    return response.stream.transform(utf8.decoder);
  }

  // ignore: unused_element
  // Future<void> checkResponse(response, modelResponse,
  //     {BuildContext? context}) async {
  //   if (response["error_description"] == null ||
  //       response["error_description"] == 'null') {
  //     if (response['body']['status'] == 200 ||
  //         response['body']['status'] == "200") {
  //       return modelResponse;
  //     } else if (response['body']['status'] == 500 ||
  //         response['body']['status'] == "500") {
  //       return modelResponse;
  //     } else {
  //       showErrorDialog(
  //           context: context!, message: response['body']['message']);
  //     }
  //   } else {
  //     if (response['body']['status'] == 401 ||
  //         response['body']['status'] == '401') {
  //       // Get.to(LoginScreen());
  //     } else {
  //       showErrorDialog(
  //           context: context!, message: response['body']['message']);
  //     }
  //   }
  // }
}

void showErrorDialog({
  required BuildContext context,
  required String message,
}) {
  // final snackBar = SnackBar(
  //     backgroundColor: Colors.transparent,
  //     content: Container(
  //       width: MediaQuery.of(context).size.width,
  //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //       decoration: BoxDecoration(
  //           color: AppColor.themecolor,
  //           borderRadius: BorderRadius.circular(30)),
  //       child: Text(
  //         message.toString(),
  //         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
  //       ),
  //     ));
  CommonMethod().showSnackBar(context, message.toString());
  // CommonMethod().getXSnackBar("Error", message.toString(), red);
}

Future<void> checkResponse(response, context) async {
  if (response["error"] == null || response["error"] == 'null') {
    if (response['body'] != null) {
      return response['body'];
    } else {
      showErrorDialog(context: context, message: response['body']['message']);
    }
  } else {
    if (response['body']['status'] == 401 ||
        response['body']['status'] == '401') {
      showErrorDialog(context: context, message: response['body']['message']);
    } else {
      showErrorDialog(
          context: context, message: response['body']['error']['message']);
    }
  }
}

checkResponse2(dynamic response, BuildContext context) {
  if (response["error_description"] == null) {
    if (response['body']['code'] == 200 || response['body']['code'] == "200") {
      return response['body'];
    } else if (response['body']['code'] == 500 ||
        response['body']['code'] == "500") {
      // showErrorDialog(response['body']['message'], context);
      return response['body'];
    } else {
      // showErrorDialog(response['body']['message'], context);
      return response['body'];
    }
  }
}

class CommonMethod {
  void showSnackBar(BuildContext context, String title) {
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  title.toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
