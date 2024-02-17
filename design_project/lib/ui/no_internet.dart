import 'package:design_project/constant.dart';
import 'package:design_project/utils/internet_connectivity_change_notifier.dart';
import 'package:design_project/utils/util_functions.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  bool isRetry = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: AppColor.themecolor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4,
                    size: 150,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Unable to connect to internet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.5,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isRetry
                      ? Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : InkWell(
                          onTap: () async {
                            setState(() {
                              isRetry = true;
                            });
                            // if (await isInternetAvailable()) {
                            //   if (InternetConnectivityChangeNotifier
                            //       .isNoInternetConnectedScreenDisplayed) {
                            //     InternetConnectivityChangeNotifier
                            //             .isNoInternetConnectedScreenDisplayed =
                            //         false;
                            //     isRetry = false;
                            //     Navigator.pop(context);
                            //   }
                            // } else {
                            //   setState(() {
                            //     isRetry = false;
                            //   });
                            // }
                          },
                          child: Container(
                            height: 55,
                            width: 150,
                            decoration: BoxDecoration(
                                color: AppColor.themecolor,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Center(
                              child: Text(
                                'Retry',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
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
  }
}
