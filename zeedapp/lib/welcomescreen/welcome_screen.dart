import 'package:flutter/material.dart';
import 'package:zeedapp/signin/signup/sign_in_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../const/constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    startvideo();
  }

  startvideo() {
    _controller = VideoPlayerController.asset("assets/videos/welcome.mp4");
    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.setVolume(0);
    // _controller!.setPlaybackSpeed(0.2);
    _controller!.setLooping(true);
    _controller!.initialize().then((value) {
      setState(() {});
    });
    _controller!.play();
    // Ensure the first frame is shown after the video is initialized
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: size.width,
              height: size.height,
              child: VideoPlayer(_controller!)),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        },
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
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  fontFamily: dMSans,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
