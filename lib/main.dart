import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cubit/layout_cubit.dart';
import 'package:e_commerce_app/screens/splash_screen/splash_screen.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  Fluttertoast.showToast; // Initialize Fluttertoast

  AppDio.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return BlocProvider(
            create: (context) => LayoutCubit(),
            child: MaterialApp(
              builder: FToastBuilder(),
              debugShowCheckedModeBanner: false,
              home: ESplashScreen(),
            ),
          );
        }
    );
  }
}
