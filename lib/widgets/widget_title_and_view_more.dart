import 'package:e_commerce_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget widgetTitleAndViewMore({
  required String widgetTile,
  required String seeMoreTitle,
  required GestureTapCallback onTap
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widgetTile,
          style: TextStyle(
            color: widgetTitleColor,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            seeMoreTitle,
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp
            ),
          ),
        ),
      ],
    ),
  );
}
