import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyPlansHomeScreen extends StatefulWidget {
  const MyPlansHomeScreen({super.key});

  @override
  State<MyPlansHomeScreen> createState() => _MyPlansHomeScreenState();
}

const double width = 300.0;
const double height = 50.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.black;
const Color normalColor = Colors.black54;

class _MyPlansHomeScreenState extends State<MyPlansHomeScreen> {
  double? xAlign;
  Color? loginColor;
  Color? signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "My Plans",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        alignment: Alignment(xAlign!, 0),
                        duration: Duration(milliseconds: 300),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: height,
                          child: Card(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                        ),
                        //  Container(
                        //   width: MediaQuery.of(context).size.width / 2,
                        //   height: height,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.all(
                        //       Radius.circular(50.0),
                        //     ),
                        //   ),
                        // ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            xAlign = loginAlign;
                            loginColor = selectedColor;

                            signInColor = normalColor;
                          });
                        },
                        child: Align(
                          alignment: Alignment(-1, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              'Current',
                              style: TextStyle(
                                color: loginColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            xAlign = signInAlign;
                            signInColor = selectedColor;

                            loginColor = normalColor;
                          });
                        },
                        child: Align(
                          alignment: Alignment(1, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              'Redeemed',
                              style: TextStyle(
                                color: signInColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, left: 15, right: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Text(
                                "Due for this month",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                "22/08/2022",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xffFFD9B7),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 5, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Text(
                                  "Flexi-Yo_Flexi",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                "11,000",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "T.Nagar, Chennai",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
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
                              width: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "0.670",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xff13121E),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total grams (as of today)",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff13121E),
                                        fontWeight: FontWeight.w500),
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
                              width: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "1000",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xff13121E),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total Amount (as of today)",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff13121E),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, left: 15, right: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Text(
                                "Payment Done",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                "22/08/2022",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xffFFD9B7),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 5, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Text(
                                  "Jewelery Booking Plan",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                "10,000",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "T.Nagar, Chennai",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
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
                              width: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "0.670",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xff13121E),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total grams (as of today)",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff13121E),
                                        fontWeight: FontWeight.w500),
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
                              width: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "1000",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xff13121E),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total Amount (as of today)",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff13121E),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
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
    );
  }
}
