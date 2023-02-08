import 'package:flutter/material.dart';
import 'package:zeedapp/signin/signup/sign_in_screen.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bangle.jpg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment(0.0, -1.0),
                    begin: Alignment(0.0, 0.6),
                    colors: <Color>[
                      Colors.black,
                      Colors.black12,
                    ],
                  ),
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/app_icon.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "zeed",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Saving plans",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white54),
                          ),
                          Text(
                            "   |   ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white54),
                          ),
                          Text(
                            "Gift Card",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white54),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()),
                              );
                            },
                            child: const Text("Get Started")),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
