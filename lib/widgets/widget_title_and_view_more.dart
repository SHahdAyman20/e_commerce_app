import 'package:e_commerce_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget widgetTitleAndViewMore({
  required String widgetTile,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(
      widgetTile,
      style: TextStyle(
        color: widgetTitleColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp
      ),
    ),
  );
}
