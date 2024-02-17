import 'dart:developer';
import 'dart:io';

import 'package:design_project/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class MyListingMangeScreen extends StatefulWidget {
  const MyListingMangeScreen({Key? key}) : super(key: key);

  @override
  State<MyListingMangeScreen> createState() => _MyListingMangeScreenState();
}

class _MyListingMangeScreenState extends State<MyListingMangeScreen> {
  List imageUrl = [];
  final _picker = ImagePicker();
  bool isLocation = true;
  bool isCarDetail = true;
  bool isPrice = true;
  bool isDelivery = true;
  bool isInstantBooking = true;
  bool isCalender = true;

  Future<void> getImage(bool isGallery) async {
    if (isGallery == true) {
      final pickedFile = await _picker.pickMultiImage();
      if (pickedFile != null) {
        for (var i = 0; i < pickedFile.length; i++) {
          imageUrl.add(File(pickedFile[i].path));
        }

        Navigator.pop(context);
      } else {
        print('No image selected.');
      }
    } else {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );
      imageUrl.add(File(pickedFile!.path));
      Navigator.pop(context);
    }
  }

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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
          'My Listing',
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
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 0, 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: showMultipleImage(
              imageList: imageUrl,
              onTap: () async {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            )),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Select Image Frome",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.08,
                                color: const Color(0xff4D4D4D),
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await getImage(false);
                                        setState(() {});
                                        // uploadImage(context: context);
                                        // Get.back();
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffF5F4F8)),
                                        child:
                                            Center(child: Icon(Icons.camera)),
                                      ),
                                    ),
                                    Text(
                                      "Camera",
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
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await getImage(true);
                                        setState(() {});
                                        // uploadImage(context: context);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffF5F4F8)),
                                        child: Center(child: Icon(Icons.photo)),
                                      ),
                                    ),
                                    Text(
                                      "Gallery",
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
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    });
              },
              removeIconColor: Colors.white,
              removeIconBgColor: AppColor.themecolor,
              isAddStore: true,
              isEditStore: false,
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${imageUrl.length} Photos',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.08,
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
          checkbox(
              icon: Icons.location_on_outlined,
              text: 'Car Location',
              value: isLocation,
              onchange: (value) {
                isLocation = value!;
                setState(() {});
              }),
          const Divider(
            color: Color(0xff4D4D4D),
          ),
          checkbox(
              icon: Icons.car_rental_outlined,
              text: 'Car Details',
              value: isCarDetail,
              onchange: (value) {
                isCarDetail = value!;
                setState(() {});
              }),
          const Divider(
            color: Color(0xff4D4D4D),
          ),
          checkbox(
              icon: Icons.money_rounded,
              text: 'Price',
              value: isPrice,
              onchange: (value) {
                isPrice = value!;
                setState(() {});
              }),
          const Divider(
            color: Color(0xff4D4D4D),
          ),
          checkbox(
              icon: Icons.fire_truck,
              text: 'Delivery Option',
              value: isDelivery,
              onchange: (value) {
                isDelivery = value!;
                setState(() {});
              }),
          const Divider(
            color: Color(0xff4D4D4D),
          ),
          checkbox(
              icon: Icons.flash_on,
              text: 'Instant Booking',
              value: isInstantBooking,
              onchange: (value) {
                isInstantBooking = value!;
                setState(() {});
              }),
          const Divider(
            color: Color(0xff4D4D4D),
          ),
          checkbox(
              icon: Icons.calendar_month,
              text: 'Calendar (optional)',
              value: isCalender,
              onchange: (value) {
                isCalender = value!;
                setState(() {});
              }),
        ],
      )),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.themecolor,
              borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: Text(
              '6 Steps Left',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }

  Widget checkbox(
      {IconData? icon,
      String? text,
      bool? value,
      void Function(bool?)? onchange}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon!,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text!,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.08,
              color: const Color(0xff4D4D4D),
              fontSize: 16,
              fontStyle: FontStyle.normal,
            ),
          ),
          const Spacer(),
          Checkbox(
              activeColor: AppColor.themecolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: value,
              onChanged: onchange)
        ],
      ),
    );
  }

  Widget showMultipleImage({
    Function()? onTap,
    List? imageList,
    Color? removeIconColor,
    Color? removeIconBgColor,
    bool? isAddStore = false,
    bool? isEditStore = false,
  }) {
    return imageList!.isEmpty
        ? Container(
            height: 150,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: isAddStore != true
                      ? Colors.grey.shade200
                      : Colors.transparent),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              radius: 30,
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Add Photos',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08,
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 50,
                    color: Colors.grey.shade500,
                  )
                ],
              ),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: imageList.length + 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            itemBuilder: (context, index) {
              return index == imageList.length
                  ? Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                          onPressed: onTap,
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.grey,
                          )),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              imageList[index],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            )),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              imageList.removeAt(index);
                              setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.close,
                                  color: removeIconColor ?? Colors.black,
                                  size: 14,
                                ),
                                radius: 10,
                                backgroundColor:
                                    removeIconBgColor ?? Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
            },
          );
  }
}
