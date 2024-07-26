
import 'package:flutter/material.dart';

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