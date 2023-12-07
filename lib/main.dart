import 'package:e_commerce_app/screens/e_main_screen.dart';
import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await PreferenceUtils.init();
  AppDio.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType){
      return   MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
         home: const EMainScreen(),
      );
      }
    );
  }
}
