import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeedapp/dashboard/home/jewel_flow/jewel_plan_screen.dart';

import 'sample.dart';

class JewelStoreScreen extends StatefulWidget {
  const JewelStoreScreen({super.key, required this.title});
  final String title;

  @override
  State<JewelStoreScreen> createState() => _JewelStoreScreenState();
}

class _JewelStoreScreenState extends State<JewelStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //     )),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                //color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xffFB7D29),
                          Color(0xffEC4100),
                        ],
                      ),
                    ),
                    height: 115,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      "Live gold rate",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Positioned(
                      bottom: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xffFEF6DC),
                                    Color(0xffFFE4CC),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            height: 60,
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Gold rate (22k)"),
                                Text(
                                  "4,258 / gm",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xffFEF6DC),
                                    Color(0xffFFE4CC),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            height: 60,
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Gold rate (24k)"),
                                Text(
                                  "4,258 / gm",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Stores",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JewelPlanScreen()),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.network(
                                  "https://www.complaintsboard.com/images/business/200x200/128507/lalitha-jewellery.jpg",
                                  height: 50,
                                  width: 50,
                                ),
                                title: Text(
                                  "Lalitha Jewellery",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text("31 Locations"),
                              ),
                              FittedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffFEEADC),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          "0% wastage(VA) upto 18%",
                                          style: TextStyle(
                                              color: Color(0xffD26011)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffFDE4EC),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          "No Making Cost",
                                          style: TextStyle(
                                              color: Color(0xffCF416D)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/dot.png",
                                      height: 15,
                                    ),
                                    Text(
                                      "50% OFF on one month Installment",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, bottom: 8, top: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/dot.png",
                                      height: 15,
                                    ),
                                    Text(
                                      "50% OFF on one month Installment",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
