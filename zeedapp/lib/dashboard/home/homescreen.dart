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
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.green,
          //  border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      // height: MediaQuery.of(context).size.height * 0.145,
      // //width: MediaQuery.of(context).size.width / 2.2,
    ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.red,
          //  border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      // height: MediaQuery.of(context).size.height * 0.145,
      // //width: MediaQuery.of(context).size.width / 2.2,
    ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.grey,
          //  border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      // height: MediaQuery.of(context).size.height * 0.145,
      // //width: MediaQuery.of(context).size.width / 2.2,
    ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.blue,
          //  border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      // height: MediaQuery.of(context).size.height * 0.145,
      // //width: MediaQuery.of(context).size.width / 2.2,
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
                            Icon(
                              Icons.location_on,
                              color: Colors.deepOrange,
                            ),
                            Text(
                              location,
                              maxLines: 1,
                              style: TextStyle(
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
                    child: CircleAvatar(
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
                child: TextFormField(
                    decoration: InputDecoration(
                  prefixIcon: Icon(
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
            SizedBox(
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
                        decoration: BoxDecoration(
                            color: Colors.green,
                            //  border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: MediaQuery.of(context).size.height * 0.145,
                        //width: MediaQuery.of(context).size.width / 2.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Gold",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.network(
                                    "https://i.pinimg.com/736x/47/42/c7/4742c712595010ebb6cb6bb0aeff5aaf.jpg",
                                    height: 80,
                                    width: 80,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            //  border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: MediaQuery.of(context).size.height * 0.145,
                        //width: MediaQuery.of(context).size.width / 2.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Diamond",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx9r7IM-M5ixlX2HPkj-sm6Uzq5ck68so0yaa7JcHQzVXJ9GGauBenepdo1wNNtkzfUuY&usqp=CAU",
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          //  border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: MediaQuery.of(context).size.height * 0.11,
                      //width: MediaQuery.of(context).size.width / 2.2,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        //  border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    height: MediaQuery.of(context).size.height * 0.11,
                    //width: MediaQuery.of(context).size.width / 2.2,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          //  border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: MediaQuery.of(context).size.height * 0.11,
                      //width: MediaQuery.of(context).size.width / 2.2,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        //  border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    height: MediaQuery.of(context).size.height * 0.21,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        //  border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    height: MediaQuery.of(context).size.height * 0.21,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  fetchlocation();
                },
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}
