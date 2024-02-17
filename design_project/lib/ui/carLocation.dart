import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:design_project/ui/car_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../NavDrawer.dart';
import '../constant.dart';

class CarLocation extends StatefulWidget {
  const CarLocation({Key? key}) : super(key: key);

  @override
  State<CarLocation> createState() => _CarLocationState();
}

class _CarLocationState extends State<CarLocation> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Set<Marker> markers = Set(); //markers for google map

  LatLng startLocation = LatLng(4.2105, 101.9758);
  LatLng endLocation = LatLng(4.1940, 101.9673);

  //location to show in map
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(4.2105, 101.9758),
    zoom: 12,
  );

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: NavDrawer(),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black26, // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.light, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        leading: IconButton(
          icon: Row(
            children: [
              Icon(Icons.menu, color: Colors.white),
              Align(
                alignment: Alignment(-0.6, -0.6),
                child: Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 10.0,
                ),
              ),
            ],
          ), // set your color here
          //onPressed: () => scaffoldKey.currentState?.openDrawer()
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'CAR LOCATIONS',
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFFFF),
            letterSpacing: 0.08,
            fontSize: 18,
            fontStyle: FontStyle.normal,
          ),
        ),
        backgroundColor: AppColor.themecolor,
      ),
      body: Stack(children: [
        GoogleMap(
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 13.0, right: 13.0, top: 15.0),
              child: SizedBox(
                height: 65,
                child: Container(
                  child: Card(
                    elevation: 4,
                    //shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //color: Colors.white.withOpacity(0),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Image.asset(
                              'assests/images/search_icon_34.png',
                              width: 22,
                              height: 18,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 5, bottom: 2),
                              child: TextFormField(
                                cursorColor: Color(0xff333333),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 0),
                                  hintText: "Rent a car now!",
                                  focusColor: Color(0xffcdcdcd),
                                  hintStyle: GoogleFonts.lato(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff333333),
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        //shape: CircleBorder,

        onPressed: () {},

        // label: Text(''),
        child: Image.asset(
          'assests/images/send.png',
          height: 16,
        ),
      ),
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(20, 20)),
      "assests/images/marker.png",
    );
    final Uint8List markerIcon =
        await getBytesFromAsset('assests/images/marker.png', 75);
    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      onTap: () {
        showMyDialog(context);
      },
      infoWindow: InfoWindow(
        //popup info
        title: 'Address1',
        snippet: 'Marker1',
      ),
      icon: BitmapDescriptor.fromBytes(markerIcon), //Icon for Marker
    ));

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(endLocation.toString()),
      onTap: () {
        showMyDialog(context);
      },
      position: endLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Address2',
        snippet: 'Marker2',
      ),
      icon: BitmapDescriptor.fromBytes(markerIcon), //Icon for Marker
    ));

    setState(() {
      //refresh UI
    });
  }

  void showMyDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Colors.white.withOpacity(0.5),
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff4D4D4D),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assests/images/close.png',
                            height: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  'Car(S) Offered to You:',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.08,
                    color: Color(0xff4D4D4D),
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff4D4D4D))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assests/car.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'PERODUA BEZZA',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.08,
                                  color: AppColor.themecolor,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '2018',
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
                          Text(
                            'BY SANI',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.08,
                              color: Color(0xff4D4D4D),
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: AppColor.themecolor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Text(
                          'RM93',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.08,
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CarListScreen()));
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: AppColor.themecolor,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Center(
                          child: Text(
                            'VIEW ALL ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -8,
                      right: 5,
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow.shade800,
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.08,
                              color: Colors.white,
                              fontSize: 30,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
