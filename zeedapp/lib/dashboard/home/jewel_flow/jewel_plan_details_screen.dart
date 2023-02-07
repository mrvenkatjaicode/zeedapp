import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeedapp/dashboard/home/homescreen.dart';

import '../../dashboard_home_screen.dart';

class JewelPlanDetailsScreen extends StatefulWidget {
  const JewelPlanDetailsScreen({super.key});

  @override
  State<JewelPlanDetailsScreen> createState() => _JewelPlanDetailsScreenState();
}

class _JewelPlanDetailsScreenState extends State<JewelPlanDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Plan details",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 800,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            // color: Colors.green,
                            //  border: Border.all(),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffEC4100),
                                Color(0xffFF7C39),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        color: Color(0xffF16464),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 10),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "22/08/2022",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Flexi-Yo-Flexi",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ListTile(
                                                leading: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.network(
                                                      "https://www.complaintsboard.com/images/business/200x200/128507/lalitha-jewellery.jpg",
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                                  ),
                                                ),
                                                title: Text(
                                                  "Lalitha Jewellery",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  "T.Nagar, Chennai",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: <Color>[
                                                        Color(0xffFEF6DC),
                                                        Color(0xffFFE4CC),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "0.670",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color:
                                                              Color(0xff13121E),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Total grams (as of today)",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                              Color(0xff13121E),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: <Color>[
                                                        Color(0xffFEF6DC),
                                                        Color(0xffFFE4CC),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "1000",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color:
                                                              Color(0xff13121E),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Total Amount (as of today)",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                              Color(0xff13121E),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Positioned(
                                      top: -105,
                                      right: 30,
                                      child: Image.asset(
                                        "assets/images/gold_coin_animation.png",
                                        fit: BoxFit.fitWidth,
                                        width: 130,
                                        height: 300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 170,
                          left: 12,
                          child: SizedBox(
                            width: 400,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Arun Kumar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Plan Code",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "LAL 132",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Membership Code",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "132",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Installments",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "11 months",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Maturity Date",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "22/09/2023",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            //width: MediaQuery.of(context).size.width / 2.2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Total Amount",
                                                  style: TextStyle(
                                                    color: Color(0xff13121E),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "11,000",
                                                  style: TextStyle(
                                                    color: Color(0xff13121E),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
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
                                                  Color(0xffFFEFEB),
                                                  Color(0xffF1EEFF),
                                                ],
                                              ), //  border: Border.all(),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          //width: MediaQuery.of(context).size.width / 2.2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Monthly Amount",
                                                style: TextStyle(
                                                  color: Color(0xff13121E),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                "1,000",
                                                style: TextStyle(
                                                  color: Color(0xff13121E),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
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
                                                    Color(0xffF3F3F3),
                                                    Color(0xffE5F6Fc),
                                                  ],
                                                ), //  border: Border.all(),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            //width: MediaQuery.of(context).size.width / 2.2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Next Date",
                                                  style: TextStyle(
                                                    color: Color(0xff13121E),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "22/08/2022",
                                                  style: TextStyle(
                                                    color: Color(0xff13121E),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color(0xffF1F1F1)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.telegram,
                                              size: 15,
                                            ),
                                            Text(
                                              "Share",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff51505B)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardHomeScreen()),
                      );
                    },
                    child: Text("Done")),
              ))
        ],
      ),
    );
  }
}
