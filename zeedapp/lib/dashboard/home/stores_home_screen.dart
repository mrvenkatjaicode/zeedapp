import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeedapp/dashboard/home/jewel_flow/jewel_plan_screen.dart';

class StoresHomeScreen extends StatefulWidget {
  const StoresHomeScreen({super.key});

  @override
  State<StoresHomeScreen> createState() => _StoresHomeScreenState();
}

class _StoresHomeScreenState extends State<StoresHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Stores",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextFormField(
                        decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "Search stores",
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
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
                          ),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/gold.png",
                              // height: 10,
                              // width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Gold",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 50,
                          child: Divider(
                            color: Colors.red,
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.red,
                            //   width: 2,
                            // ),
                            shape: BoxShape.circle,
                            // color: Colors.green,
                            //  border: Border.all(),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffF3F3F3),
                                Color(0xffE5F6FC),
                              ],
                            ),
                          ),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/diamond.png",
                              // height: 10,
                              // width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Diamond",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 50,
                          child: Divider(
                            color: Colors.transparent,
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.red,
                            //   width: 2,
                            // ),
                            shape: BoxShape.circle,
                            // color: Colors.green,
                            //  border: Border.all(),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffFFEFEB),
                                Color(0xffF1EEFF),
                              ],
                            ),
                          ),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/platinum.png",
                              // height: 10,
                              // width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Platinum",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 50,
                          child: Divider(
                            color: Colors.transparent,
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.red,
                            //   width: 2,
                            // ),
                            shape: BoxShape.circle,
                            // color: Colors.green,
                            //  border: Border.all(),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffE5E2FD),
                                Color(0xffF1BDDE),
                              ],
                            ),
                          ),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/silver.png",
                              // height: 10,
                              // width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Silver",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 50,
                          child: Divider(
                            color: Colors.transparent,
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.red,
                            //   width: 2,
                            // ),
                            shape: BoxShape.circle,
                            // color: Colors.green,
                            //  border: Border.all(),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffFEEADC),
                                Color(0xffFFE8F5),
                              ],
                            ),
                          ),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/gold_coin.png",
                              // height: 10,
                              // width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Gold Coin",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 50,
                          child: Divider(
                            color: Colors.transparent,
                            thickness: 2,
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
            Row(
              children: [Text("Stores")],
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JewelPlanScreen()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 5,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/images/banner_1.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: ListTile(
                          leading: Image.network(
                            "https://www.complaintsboard.com/images/business/200x200/128507/lalitha-jewellery.jpg",
                            height: 50,
                            width: 50,
                          ),
                          title: Text(
                            "Lalitha Jewellery",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("31 Locations"),
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
