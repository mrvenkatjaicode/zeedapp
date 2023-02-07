import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeedapp/dashboard/home/jewel_flow/join_plan_screen.dart';
import 'package:zeedapp/dashboard/payment/choose_payment_screen.dart';

import '../../../const/constant.dart';

class JewelDetailScreen extends StatefulWidget {
  const JewelDetailScreen({super.key});

  @override
  State<JewelDetailScreen> createState() => _JewelDetailScreenState();
}

class _JewelDetailScreenState extends State<JewelDetailScreen> {
  double _value = 0;
  String _chosenValue = "Flutter";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  MediaQuery.of(context).size.height / 2.5), // Set this height
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.orange,
                  ),
                  Positioned(
                      top: 50,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          Text(
                            "Flexi - Yo - Flexi",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ))
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Center(
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
                                      children: [
                                        Text(
                                          "Plan Breakup",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Plan amount",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "11000.00",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "0% wastage",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "1925.00",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "50% off on 1st installment",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "500.00",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Maturity Amount",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "13425.00",
                                          style: TextStyle(
                                              color: Color(0xff51505B),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 400,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              // color: Color(0xffFFF6E1),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Plan Details",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            color: Color(0xffFFFFFF),
                                            elevation: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "50% off",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffEC4100)),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "First month",
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "installment",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            color: Color(0xffFFFFFF),
                                            elevation: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "1000",
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffEC4100)),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Plan Starts",
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "from",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            color: Color(0xffFFFFFF),
                                            elevation: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "0%",
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffEC4100)),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "wastage(VA)",
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "upto 18%",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15,
                                          left: 15,
                                          right: 15,
                                          bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/dot.png",
                                            height: 15,
                                          ),
                                          Text(
                                            "Flexible Redemption-Value Based or Weight Based",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffFFDD8E),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child:
                                                  Text("11 months Installment"),
                                            )),
                                        Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Color(0xffFFDD8E),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("BIS 916 Hallmark"),
                                            )),
                                      ],
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
                                  builder: (context) => const JoinPlanScreen()),
                            );
                          },
                          child: Text("Join Plan")),
                    ))
              ],
            )),
        Positioned(
          top: 120,
          left: 12,
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        "https://www.complaintsboard.com/images/business/200x200/128507/lalitha-jewellery.jpg",
                        height: 50,
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Text(
                              "1000",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Monthly Installment")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                // height: 200,
                width: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Choose monthly Installment"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Slider(
                          min: 0.0,
                          max: 100.0,
                          //  divisions: 9,
                          value: _value,
                          label: '${_value.round()}',
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "11,000",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Total Amount",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "11 Months",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Installments",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF5F7F8),
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(0.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Select branch",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                DropdownButton<String>(
                                  value: _chosenValue,
                                  underline: SizedBox(),
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.black),

                                  items: <String>[
                                    'Android',
                                    'IOS',
                                    'Flutter',
                                    'Node',
                                    'Java',
                                    'Python',
                                    'PHP',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    "Please choose a langauage",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _chosenValue = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
