import 'package:flutter/material.dart';

// color //
Color maincolor = Color(0xffFC772A);
Color greycolor = Color(0xffF2F2F2);
Color greygreen = Color(0xffF5F5EE);
// font family //
var berkshireSwash = "BerkshireSwash";
var dMSans = "DMSans";

Widget textbox(controller, text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            //controller: controller,
            decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey.shade700),
          labelText: text,
          fillColor: Colors.grey.shade300,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        )),
      ),
    ),
  );
}
