import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:zeedapp/signin/signup/sign_in_screen.dart';
import 'package:zeedapp/signin/signup/sign_up_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
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
                "Sign Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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
                        //  fontWeight: FontWeight.w500,

                        ),
                  ),
                  Text(
                    "   |   ",
                    style: TextStyle(
                        // fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    "Gift Card",
                    style: TextStyle(
                        //  fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 0),
                width: MediaQuery.of(context).size.width,
                //  height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 0, right: 8, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      TextFormField(
                        //cursorColor: appbarcolor,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                            //  hintText: "6000 வார்த்தைகள் குறைவாக",
                            focusColor: Colors.white,
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 0),
                width: MediaQuery.of(context).size.width,
                //  height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: print,
                      initialSelection: '+91',
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 8, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mobile Number",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            TextFormField(
                              //cursorColor: appbarcolor,
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                  //  hintText: "6000 வார்த்தைகள் குறைவாக",
                                  focusColor: Colors.white,
                                  border: InputBorder.none),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                width: MediaQuery.of(context).size.width,
                //  height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 0, right: 8, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      TextFormField(
                        //cursorColor: appbarcolor,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                            //  hintText: "6000 வார்த்தைகள் குறைவாக",
                            focusColor: Colors.white,
                            border: InputBorder.none),
                      ),
                    ],
                  ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text("Sign Up")),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Already a user? "),
                    Text(
                      " Sign In",
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
