import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeedapp/dashboard/payment/choose_payment_screen.dart';

import '../../../const/constant.dart';

class JoinPlanScreen extends StatefulWidget {
  const JoinPlanScreen({super.key});

  @override
  State<JoinPlanScreen> createState() => _JoinPlanScreenState();
}

class _JoinPlanScreenState extends State<JoinPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Join Plan",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Profile Info"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        textbox("", "Name"),
                        textbox("", "Email"),
                        textbox("", "Phone"),
                        textbox("", "Address"),
                        textbox("", "State"),
                        textbox("", "City"),
                        textbox("", "Pincode"),
                        textbox("", "Country"),
                        Row(
                          children: [
                            Text("Additional Info"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        textbox("", "Date of Birth"),
                        textbox("", "Wedding Aniversary"),
                        textbox("", "Bank account number"),
                        textbox("", "Reenter bank account number"),
                        textbox("", "Bank Branch"),
                        textbox("", "IFSC"),
                        textbox("", "PAN Number"),
                        textbox("", "Identy Proof Type"),
                        textbox("", "Identy Proff Numbrer"),
                        textbox("", "Nominee"),
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
                            builder: (context) => const ChoosePaymentScreen()),
                      );
                    },
                    child: Text("Join")),
              ))
        ],
      ),
    );
  }
}
