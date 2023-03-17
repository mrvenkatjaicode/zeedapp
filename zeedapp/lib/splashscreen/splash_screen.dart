import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/dashboard_home_screen.dart';
import '../welcomescreen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('stringValue').toString();
    Timer(const Duration(seconds: 2), () {
      stringValue == "abc"
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashboardHomeScreen()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/images.png",
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "zeed",
                    style: TextStyle(
                      color: Colors.deepOrange.shade800,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Saving plans",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "   |   ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Gift Card",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Text("v1.0")
          ],
        ),
      ),
    );
  }
}
