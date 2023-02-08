import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zeedapp/dashboard/home/jewel_flow/jewel_store_screen.dart';
import 'package:zeedapp/profile/profile_screen.dart';

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
      location = '${place!.subLocality}, ${place!.locality}';
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

  List<Widget> cslider = [
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        "assets/images/banner_1.png",
        fit: BoxFit.cover,
      ),
    ),
    Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: const BoxDecoration(
            color: Colors.grey,
            //  border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        // height: MediaQuery.of(context).size.height * 0.145,
        // //width: MediaQuery.of(context).size.width / 2.2,
        child: Image.asset(
          "assets/images/banner_3.png",
          fit: BoxFit.cover,
        )),
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        "assets/images/banner_3.png",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.deepOrange,
                            ),
                            Text(
                              location,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          sublocation,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
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
                    child: const CircleAvatar(
                      child: Icon(Icons.person_outline),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 20),
              child: Container(
                height: 50,
                child: TextFormField(
                    decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search stores, plans",
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                )),
              ),
            ),
            CarouselSlider(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.199,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPos = index;
                      });
                    }),
                items: cslider),
            Center(
              child: CarouselIndicator(
                color: Colors.grey,
                activeColor: Colors.deepOrange,
                count: cslider.length,
                index: currentPos,
              ),
            ),
            const SizedBox(
              height: 10,
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
                        decoration: const BoxDecoration(
                            // color: Colors.green,
                            //  border: Border.all(),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffFEF6DC),
                                Color(0xffFEE4CC),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: MediaQuery.of(context).size.height * 0.145,
                        //width: MediaQuery.of(context).size.width / 2.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text(
                                    "Gold",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              "assets/images/gold.png",
                              height: size.height / 13,
                              width: size.width / 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JewelStoreScreen(
                                    title: "Diamond",
                                  )),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xffF3F3F3),
                                    Color(0xffE5F6FC),
                                  ],
                                ),
                                // color: Colors.red,
                                //  border: Border.all(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            height: MediaQuery.of(context).size.height * 0.145,
                            //width: MediaQuery.of(context).size.width / 2.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Diamond",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/diamond.png",
                                      height: size.height / 10,
                                      width: size.width / 5,
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 15),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffFFEFEB),
                                Color(0xffF1EEFF),
                              ],
                            ),
                            //  border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        //height: MediaQuery.of(context).size.height * 0.11,
                        //width: MediaQuery.of(context).size.width / 2.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Platinum",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/platinum.png",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xffE5E2FD),
                              Color(0xffF1BDDE),
                            ],
                          ), //  border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      //height: MediaQuery.of(context).size.height * 0.11,
                      //width: MediaQuery.of(context).size.width / 2.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Silver",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset("assets/images/silver.png"),
                            ],
                          )
                        ],
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffFEEADC),
                                Color(0xffFFE8F5),
                              ],
                            ), //  border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        // height: MediaQuery.of(context).size.height * 0.11,
                        //width: MediaQuery.of(context).size.width / 2.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Gold Coin",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset("assets/images/gold_coin.png"),
                                ],
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xffBB558B),
                              Color(0xffE86D6D),
                            ],
                          ), //  border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      //   height: MediaQuery.of(context).size.height * 0.21,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 185, 99, 145),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                child: Text(
                                  "Offer zone",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Flat",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "10% off",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Savings plan",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "starts from",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/images/platinum.png",
                                    fit: BoxFit.fitHeight,
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "*conditions apply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xff5570BB),
                              Color(0xff452797),
                            ],
                          ), //  border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      // height: MediaQuery.of(context).size.height * 0.21,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 185, 99, 145),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                child: Text(
                                  "Savings",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Savings plan",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "starts from",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "500/-",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/images/silver_necklece.png",
                                    fit: BoxFit.fitHeight,
                                    //   height: 100,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "*conditions apply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
