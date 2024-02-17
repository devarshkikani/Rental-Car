// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:design_project/ui/no_internet.dart';
// import 'package:design_project/utils/navigation_service.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class InternetConnectivityChangeNotifier {
//   static late StreamSubscription subscription;
//   static bool isConnected = false;
//   static bool isNoInternetConnectedScreenDisplayed = false;

//   static getConnectivity() =>
//       subscription = Connectivity().onConnectivityChanged.listen((event) async {
//         isConnected = await InternetConnectionChecker().hasConnection;
//         if (!isConnected && !isNoInternetConnectedScreenDisplayed) {
//           isNoInternetConnectedScreenDisplayed = true;
//           Navigator.push(NavigationService.navigatorKey.currentContext!,
//               MaterialPageRoute(builder: (context) => NoInternet()));
//         } else {
//           if (isNoInternetConnectedScreenDisplayed) {
//             isNoInternetConnectedScreenDisplayed = false;
//             Navigator.pop(NavigationService.navigatorKey.currentContext!);
//           }
//         }
//       });
// }
