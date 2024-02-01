import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:e_commerce_app/screens/login_screen/e_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ESplashScreen extends StatelessWidget {
  const ESplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        backgroundColor: Colors.white,
        duration:const Duration(seconds: 2),
        splashScreenBody: Center(
          child: SizedBox(
            height: 100.sp,
            width: double.infinity,
            child: Image.asset("assets/splash screen.png"),
          ),
        ),
        nextScreen: const ELoginScreen(),
      ),
    );
  }
}
