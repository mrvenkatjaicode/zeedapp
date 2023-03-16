//import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeedapp/signin/signup/register_screen.dart';

import 'otp_verify_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController mobilecontroller = TextEditingController();
  String countrycode = "+91";
  bool isloading = false;

  sendotp(String mobile) async {
    setState(() {
      isloading = true;
    });
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobile,
      verificationCompleted: (PhoneAuthCredential credential) {
        setState(() {
          isloading = false;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          isloading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
        debugPrint(e.message.toString());
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          isloading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpVerifyScreen(
                    mobileno: mobile,
                    otptext: mobile,
                    verificationid: verificationId,
                  )),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/white_bangle.jpg",
                  ),
                  Container(
                    color: Colors.white,
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
                            "Sign In",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
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
                                ),
                              ),
                              Text(
                                "   |   ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Gift Card",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            width: MediaQuery.of(context).size.width,
                            //  height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                // CountryCodePicker(
                                //   onChanged: ((value) {
                                //     setState(() {
                                //       countrycode = value.toString();
                                //     });
                                //   }),
                                //   initialSelection: '+91',
                                // ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 0, right: 8, left: 10),
                                    child: TextFormField(
                                      controller: mobilecontroller,
                                      keyboardType: TextInputType.phone,
                                      //cursorColor: appbarcolor,
                                      onChanged: (value) {},
                                      decoration: const InputDecoration(
                                          //  hintText: "6000 வார்த்தைகள் குறைவாக",
                                          focusColor: Colors.white,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("By continuing I agree the"),
                                Text(
                                  " terms & conditions",
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(" and"),
                                Text(
                                  " privacy policy",
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () {
                                  sendotp(countrycode + mobilecontroller.text);
                                  /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OtpVerifyScreen()),
                            ); */
                                },
                                child: const Text("Get OTP")),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("New user? "),
                                Text(
                                  " Sign Up",
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
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
    );
  }
}
