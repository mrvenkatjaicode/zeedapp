import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zeedapp/const/constant.dart';
import 'package:zeedapp/dashboard/home/jewel_flow/jewel_store_screen.dart';
import 'package:zeedapp/profile/profile_screen.dart';

import 'jewel_flow/sample.dart';
import 'model_homescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? serviceEnabled;
  LocationPermission? permission;
  String location = 'No Location Found';
  String sublocation = "";
  Placemark? place;
  bool getMaps = false;
  int currentPos = 0;
  Future<Position> getGeoLocationPosition() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  fetchlocation() async {
    Position position = await getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    place = placemarks[0];
    setState(() {
      location = ' ${place!.subLocality}  ${place!.locality}';
      sublocation =
          '${place!.street}, ${place!.subLocality}, ${place!.locality}, ${place!.postalCode}, ${place!.country}';
    });
    // adress ='${place!.street}, ${place!.subLocality}, ${place!.locality}, ${place!.postalCode}, ${place!.country}';
    // GetAddressFromLatLong(position);
    getMaps = true;
    debugPrint(place.toString());
    // rtoSearchController.text = place!.locality!;
    // Provider.of<TwoWheelerFlowdataNotifier>(context, listen: false)
    //     .twoWheelerFlowdata
    //     .rtotext = place!.locality!;
    // addressIDSelection = value!;
    // otheriddetcard = false;
    //city = flowdata.rtolistcity!.citylist;
    //foundcity = city;
    // hitrrtoapi(context);
    // notif/yListeners();
    /* Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TwoWheelerRtoFetch()));
    hitrtoapi(context, place!.locality!); */
    //runFilter(place!.locality!);
    //runFilter(context);
    //await Future.delayed(const Duration(seconds: 1));

    // return hitrtoapi(context, place!.locality!);
  }

  List<Widget> searchtext = [
    Text(
      "     Text one",
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
    ),
    Text(
      "     Text two",
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
    ),
    Text(
      "     Text three",
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
    ),
  ];
  List<Widget> cslider = [
    ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        "assets/images/slideone.png",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        "assets/images/slideone.png",
        fit: BoxFit.cover,
      ),
    ),
  ];

  List<ModelHomeScreen> jewellist = [
    ModelHomeScreen(
        linearcolorone: Colors.amber.shade50,
        linearcolortwo: Colors.amber.shade100,
        name: "Gold",
        image: ""),
    ModelHomeScreen(
        linearcolorone: Colors.blue.shade50,
        linearcolortwo: Colors.blue.shade100,
        name: "Diamond",
        image: ""),
  ];

  @override
  void initState() {
    super.initState();
    fetchlocation();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/location.png",
                          height: 12,
                        ),
                        Text(
                          location,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()),
                        );
                      },
                      child: Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                            color: maincolor,
                            borderRadius: BorderRadius.circular(9)),
                        child: Center(
                            child: Image.asset("assets/icons/profile.png")),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 4),
              child: Container(
                height: 50,
                child: Stack(
                  children: [
                    TextFormField(
                        onTap: () {},
                        decoration: InputDecoration(
                          suffixIcon: Image.asset("assets/icons/search.png"),
                          //hintText: "Search stores, plans",
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        )),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlayInterval: Duration(seconds: 2),
                                scrollDirection: Axis.vertical,
                                // height: 228,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentPos = index;
                                  });
                                }),
                            items: searchtext),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // height: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xffFC772A),
                                Colors.white,
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              color: greygreen,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "My Gold",
                                style: TextStyle(
                                    height: 1.3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("8 gram",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700)),
                              Text("22 karat",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Container(
                      // height: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xffFC772A),
                                Colors.white,
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              color: greygreen,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("\u{20B9} 42000",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700)),
                              Text("Total Amount",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 0.77,
                    height: 228,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPos = index;
                      });
                    }),
                items: cslider),
            // Center(
            //   child: CarouselIndicator(
            //     color: Colors.grey,
            //     activeColor: Colors.deepOrange,
            //     count: cslider.length,
            //     index: currentPos,
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: SizedBox(
            //     //  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            //     height: MediaQuery.of(context).size.height * 0.145,
            //     width: MediaQuery.of(context).size.width,
            //     child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemCount: jewellist.length,
            //       itemBuilder: (BuildContext context, i) {
            //         return Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(15)),
            //             gradient: LinearGradient(
            //               begin: Alignment.topLeft,
            //               end: Alignment.bottomRight,
            //               colors: <Color>[
            //                 jewellist[i].linearcolorone,
            //                 jewellist[i].linearcolortwo
            //               ],
            //             ),
            //           ),
            //           /*  decoration: BoxDecoration(
            //               color: Colors.green,
            //               //  border: Border.all(),
            //               borderRadius: BorderRadius.all(Radius.circular(15))), */
            //           height: MediaQuery.of(context).size.height * 0.145,
            //           width: MediaQuery.of(context).size.width / 2.2,
            //           child: Center(child: Text(jewellist[i].name)),
            //         );
            //       },
            //       separatorBuilder: (BuildContext context, i) => Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 5),
            //         // child: Divider(
            //         //   color: Colors.black,
            //         //   thickness: 1,
            //         // ),
            //       ),
            //     ),
            //   ),
            // ),
            Text(
              "Live Gold Rate.",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: berkshireSwash),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // height: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xffFC772A),
                                Colors.white,
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              color: greygreen,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "1 gram",
                                style: TextStyle(
                                    height: 1.3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("5816.00",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700)),
                              Text("24 karat",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Container(
                      // height: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xffFC772A),
                                Colors.white,
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              color: greygreen,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "1 gram",
                                style: TextStyle(
                                    height: 1.3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("5416.00",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700)),
                              Text("22 karat",
                                  style: TextStyle(
                                      height: 1.3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Curated plans.",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: berkshireSwash),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JewelStoreScreen(
                                    title: "Gold",
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: greycolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 133,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/gold.png",
                              height: 79,
                              width: 84,
                            ),
                            Text(
                              "Gold Saving Plan",
                              style: TextStyle(
                                  fontFamily: dMSans,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JewelStoreScreen(
                                    title: "Gold",
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: greycolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 133,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/diamond.png",
                              height: 79,
                              width: 84,
                            ),
                            Text(
                              "Diamond Saving Plan",
                              style: TextStyle(
                                  fontFamily: dMSans,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JewelStoreScreen(
                                    title: "Gold",
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: greycolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 133,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/goldbar.png",
                              height: 79,
                              width: 84,
                            ),
                            Text(
                              "Gold Coin & bars\nSaving Plan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: dMSans,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JewelStoreScreen(
                                    title: "Gold",
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: greycolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 133,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/platinum.png",
                              height: 79,
                              width: 84,
                            ),
                            Text(
                              "Silver Saving Plan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: dMSans,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Brands we love.",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: berkshireSwash),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      height: 209,
                      width: 190.59,
                      decoration: BoxDecoration(
                          color: greygreen,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                "assets/images/lalitha.jpg",
                                height: 99.63,
                                width: 175.43,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Flexi O Flexi",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: dMSans),
                                  ),
                                  Text(
                                    ". 100% No V.A. charges!",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: dMSans),
                                  ),
                                  Text(
                                    ". 50% off on one month's instalment",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: dMSans),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      height: 209,
                      width: 190.59,
                      decoration: BoxDecoration(
                          color: greygreen,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                "assets/images/lalitha.jpg",
                                height: 99.63,
                                width: 175.43,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Flexi O Flexi",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: dMSans),
                                  ),
                                  Text(
                                    ". 100% No V.A. charges!",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: dMSans),
                                  ),
                                  Text(
                                    ". 50% off on one month's instalment",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: dMSans),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      "assets/images/banner.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xffFB7D29),
                              Color(0xffFF682E),
                            ],
                          ),
                        ),
                        height: 45,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Explore Now",
                                style: TextStyle(
                                    fontFamily: dMSans,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                              Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(9)),
                                child: Center(
                                  child: Icon(Icons.keyboard_arrow_down),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: [
                  SizedBox(
                    height: 290,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Refer and earn",
                              style: TextStyle(
                                  fontFamily: dMSans,
                                  color: maincolor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                            Text(
                              "Invite your friends to zeed and\nget free Gold upto 500",
                              style: TextStyle(
                                  wordSpacing: 1.5,
                                  fontFamily: dMSans,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            Image.asset("assets/images/refer.png"),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xffFB7D29),
                                    Color(0xffFF682E),
                                  ],
                                ),
                              ),
                              height: 45,
                              width: 300,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Invite Now",
                                      style: TextStyle(
                                          fontFamily: dMSans,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      child: Center(
                                        child:
                                            Image.asset("assets/icons/wa.png"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 30,
                    child: Image.asset("assets/icons/help.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
