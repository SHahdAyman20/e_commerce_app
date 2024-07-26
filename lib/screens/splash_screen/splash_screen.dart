import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:e_commerce_app/screens/authentication/login_screen/e_login_screen.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
import 'package:e_commerce_app/widgets/home_widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ESplashScreen extends StatelessWidget {
   ESplashScreen({super.key});

  final token = PreferenceUtils.getString(PrefKeys.apiToken);

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
        nextScreen: token == null ?
        const ELoginScreen() : const ScreensBottomNavBar(),
      ),
    );
  }

}
