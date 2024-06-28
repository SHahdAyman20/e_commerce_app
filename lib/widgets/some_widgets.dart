import 'package:e_commerce_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget logo() {
  return SizedBox(
    height: 30.h,
    width: double.infinity,
    child: Align(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/logooo.png',
        width: 50.w,
        height: 30.h,
        alignment: Alignment.center,
      ),
    ),
  );
}

Widget boldText({required String text}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 21.sp,
      color: const Color(0xff3b0598),
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget thinText({required String text}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 17.sp,
      color: const Color(0xff848eab),
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget accountOption(
    {required Widget navToScreen,
    required BuildContext context,
    required String question,
    required String option}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        question,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: textGrayColor
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => navToScreen),
            (route) => false,
          );
        },
        child: Text(
          option,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
      ),
    ],
  );
}

navToScreenWithRemoveUntil(context, {required Widget navToScreen}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => navToScreen),
      (routes) => false);
}
navToScreen(context, {required Widget navToScreen}) {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => navToScreen),
          );
}

Widget orLine(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 1,
        color: Colors.grey,
      ),
      Text(
        "OR",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w800,
          color: textGrayColor,
        ),
      ),
      Container(
        height: 1,
        width: MediaQuery.of(context).size.width * 0.4,
        color: Colors.grey,
      ),
    ],
  );
}

Widget forgotPassword({required Widget naviToScreen,required BuildContext context}) {
  return GestureDetector(
    onTap: (){
     navToScreenWithRemoveUntil(context, navToScreen: naviToScreen);
    },
    child: Container(
      padding:const EdgeInsets.all(10),
      alignment:Alignment.center,
      child: Text(
        'Forgot Password ?',
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: primaryColor,

        ),
      ),
    ),
  );
}

Widget signInOptionButton(
    {required VoidCallback onPressed,
    required String title,
    required String imageAssets}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: OutlinedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(95.w, 7.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imageAssets),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: textGrayColor,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
