import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomElevatedButton extends StatelessWidget {

  VoidCallback onPressed;
  String title;

  CustomElevatedButton({super.key,required this.onPressed,required this.title});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=> onPressed(),
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff5E17EB),
          minimumSize: Size(95.w, 7.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))),
      child:  Text(
        title,
        style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
      ),
    );
  }
}
