import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/screens/register_screen/e_register_screen.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
import 'package:e_commerce_app/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ELoginScreen extends StatefulWidget {
  const ELoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ELoginScreenState();
  }
}

class ELoginScreenState extends State<ELoginScreen> {
  @override
  void initState() {
    super.initState();
   loginUserByApi();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      getProfile();
    });
  }

  void getProfile() {
    AppDio.get(endpoint: Endpoints.profile).then((value) {
      print('profile ====> $value');
    });
  }

  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              'Welcome To Shoply',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21.sp,
                color: const Color(0xff3b0598),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sign in to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                color: const Color(0xff848eab),
                fontWeight: FontWeight.w400,
              ),
            ),
            // for email textField
            CustomTextField(
              type: TextInputType.emailAddress,
              action: TextInputAction.next,
              hintText: 'Email Address',
              controller: emailController,
              prefixIcon: const Icon(Icons.email),
            ),
            // for password textField
            CustomTextField(
              type: TextInputType.visiblePassword,
              action: TextInputAction.done,
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
            // login button
            SizedBox(
              height: 1.h,
            ),
            CustomElevatedButton(
              onPressed: loginUserByApi,
              title: 'Login',
            ),
            // don't have an account ?
            // register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\nDon\'t have an account ? ',
                  style: TextStyle(
                    fontSize: 18.5.sp,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    '\nRegister',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff5E17EB)),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ERegisterScreen(),
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

  void loginUserByApi() {
    print('language ==> ${PreferenceUtils.getString(PrefKeys.language)}');
    AppDio.post(
      endpoint: Endpoints.login,
      body: {
        'email': emailController.text,
        'password': passController.text,
      },
    ).then((value) {
      print('value ===> $value');
      String apiToken = value.data['data']['token'];
      print('apiToken ===> $apiToken');
      PreferenceUtils.setString(PrefKeys.apiToken, apiToken);
      // Perform any necessary navigation or further actions after successful login
    }).catchError((error) {
      // Handle login error
      print('Login error ====> $error');
    });
  }
}
