import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// i made this class to refactor the code cuz i will make 4 text field
// and now i won't be forced to write the same code of text field 4 timed
// i will just call class 4 times in 4 lines 🤩
class CustomTextField extends StatelessWidget {

  TextInputType type;
  TextInputAction action;
  IconButton? suffixIcon;
  Icon prefixIcon;
  bool obscureText;
  String hintText;
  TextEditingController? controller;


  CustomTextField(
      {super.key,
        required this.type,
        required this.action,
        this.suffixIcon,
        this.obscureText=false,
        required this.hintText,
         this.controller,
        required this.prefixIcon
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: type,
        textInputAction: action,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixIconColor:const Color(0xff646d81),
            suffixIconColor:const Color(0xff646d81),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
        ),
      ),
    );
  }
}