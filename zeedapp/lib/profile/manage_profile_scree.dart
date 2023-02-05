import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../const/constant.dart';

class ManageProfileScreen extends StatefulWidget {
  const ManageProfileScreen({super.key});

  @override
  State<ManageProfileScreen> createState() => _ManageProfileScreenState();
}

class _ManageProfileScreenState extends State<ManageProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Manage profile",
          style: TextStyle(color: Colors.black),
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
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'http://i.imgur.com/QSev0hg.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 160,
                        child: Align(
                          // alignment: Alignment.bottomCenter,
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 0.80),
                              ),
                              child: Icon(Icons.edit)),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Arun Kumar",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
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
                child: ElevatedButton(onPressed: () {}, child: Text("Update")),
              ))
        ],
      ),
    );
  }
}
