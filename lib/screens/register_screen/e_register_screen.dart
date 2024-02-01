import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/screens/login_screen/e_login_screen.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
import 'package:e_commerce_app/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ERegisterScreen extends StatefulWidget {
  const ERegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ERegisterScreenState();
  }
}

class ERegisterScreenState extends State<ERegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  bool obscureText = false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // for logo
            const SizedBox(
              height: 20,
            ),
            // for logo
            SizedBox(
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
            ),
            Text(
              'Let’s Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21.sp,
                color: const Color(0xff3b0598),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Create an new account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                color: const Color(0xff848eab),
                fontWeight: FontWeight.w400,
              ),
            ),
            //name
            CustomTextField(
              controller: nameController,
              type: TextInputType.text,
              action: TextInputAction.next,
              hintText: 'Name',
              prefixIcon: const Icon(Icons.person),
            ),
            // phone number
            CustomTextField(
              controller: phoneController,
              type: TextInputType.number,
              action: TextInputAction.next,
              hintText: 'Phone',
              prefixIcon: const Icon(Icons.phone),
            ),
            //  email
            CustomTextField(
              type: TextInputType.emailAddress,
              action: TextInputAction.next,
              hintText: 'Email Address',
              controller: emailController,
              prefixIcon: const Icon(Icons.email),
            ),
            //password
            CustomTextField(
              type: TextInputType.visiblePassword,
              action: TextInputAction.next,
              hintText: 'Password',
              controller: passController,
              prefixIcon: const Icon(Icons.lock),
              obscureText: obscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                icon: obscureText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            // Register button
            CustomElevatedButton(
              onPressed: registerUserByApi,
              title: 'Register',
            ),
            // Already have an account ?
            // login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  '\nAlready have an account ? ',
                  style: TextStyle(
                    fontSize: 18.5.sp,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    '\nLogin',
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        color:const Color(0xff5E17EB)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ELoginScreen(),
                        ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void registerUserByApi() {
    AppDio.post(endpoint: Endpoints.register, body: {
      'name': nameController.text,
      'email': emailController.text,
      'password': passController.text,
      'phone': phoneController.text,
    }).then((value) {
      print('value ===> $value');
      // Save user data to shared preferences
      PreferenceUtils.setString(PrefKeys.name, nameController.text);
      PreferenceUtils.setString(PrefKeys.email, emailController.text);
      PreferenceUtils.setString(PrefKeys.phoneNumber, phoneController.text);
      PreferenceUtils.setString(PrefKeys.password, passController.text);
      // Handle successful registration
    }).catchError((error) {
      // Handle registration error
      print('Registration error: $error');
    });
  }
}
