import 'dart:developer';
import 'dart:ui';
import 'package:design_project/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'NavDrawer.dart';
import 'constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  String location = "";
  String address = "Select an address";
  String MedicaleShopName = " ";
  String prefAddress = " ";
  bool isVisibleCross = false;
  bool isMedicalShopClicked = true;
  bool isDoctorSearchClicked = false;
  bool isCategoryClicked = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(

        statusBarColor: Colors.transparent,*/ /* set Status bar color in Android devices. */ /*

        statusBarIconBrightness: Brightness.dark,*/ /* set Status bar icons color in Android devices.*/ /*

        statusBarBrightness: Brightness.dark)*/ /* set Status bar icon color in iOS. */ /*
    );*/
 
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black26, // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.light, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        title: Text(
          dataStorage.read('name').toString(),
        ),
        backgroundColor: AppColor.themecolor,
      ),
      body: Center(
        child: Text(
          'Email: ${dataStorage.read('email')}',
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
