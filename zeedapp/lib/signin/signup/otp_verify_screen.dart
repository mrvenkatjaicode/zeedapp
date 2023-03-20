// ignore_for_file: prefer_is_empty, use_build_context_synchronously, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeedapp/dashboard/dashboard_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerifyScreen extends StatefulWidget {
  OtpVerifyScreen(
      {super.key,
      required this.mobileno,
      required this.otptext,
      required this.verificationid});
  String otptext;
  String mobileno;

  String verificationid;
  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController otpcontroller1 = TextEditingController();
  TextEditingController otpcontroller2 = TextEditingController();
  TextEditingController otpcontroller3 = TextEditingController();
  TextEditingController otpcontroller4 = TextEditingController();
  TextEditingController otpcontroller5 = TextEditingController();
  TextEditingController otpcontroller6 = TextEditingController();

  verifyotp(String otp) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential phoneauthcredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationid, smsCode: otp);

    var result = await auth.signInWithCredential(phoneauthcredential);
    if (phoneauthcredential.smsCode == otp) {
      addStringToSF();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardHomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Wrong OTP!"),
        ),
      );
    }
    debugPrint(result.toString());
  }

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', "abc");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
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
              "Verification",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "We've sent it to ${widget.mobileno}",
              style: const TextStyle(
                  // fontWeight: FontWeight.w500,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textFieldOTP(
                    first: true, last: false, controller: otpcontroller1),
                _textFieldOTP(
                    first: false, last: false, controller: otpcontroller2),
                _textFieldOTP(
                    first: false, last: false, controller: otpcontroller3),
                _textFieldOTP(
                    first: false, last: false, controller: otpcontroller4),
                _textFieldOTP(
                    first: false, last: false, controller: otpcontroller5),
                _textFieldOTP(
                    first: false, last: true, controller: otpcontroller6),
              ],
            ),
            Row(
              children: const [
                Text("Didn't get code? "),
                Text(
                  " Resend",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    verifyotp(otpcontroller1.text +
                        otpcontroller2.text +
                        otpcontroller3.text +
                        otpcontroller4.text +
                        otpcontroller5.text +
                        otpcontroller6.text);
                    /*  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardHomeScreen())); */
                  },
                  child: const Text("Confirm")),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldOTP({bool? first, last, controller}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 60,
      child: AspectRatio(
        aspectRatio: 0.9,
        child: TextFormField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style:
              const TextStyle(/* fontSize: 24, fontWeight: FontWeight.bold */),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Colors.deepOrange),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
