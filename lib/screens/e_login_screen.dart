import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/screens/e_register_screen.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
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
  // @override
  // void initState() {
  //   super.initState();
  //   print('language ==> ${PreferenceUtils.getString(PrefKeys.language)}');
  //   AppDio.post(endpoint: Endpoints.login, body: {
  //     'email': 'shahdaym@gmail.com',
  //     'password': '123456789',
  //   }).then((value) {
  //     print('value ===> $value');
  //     String apiToken = value.data['data']['token'];
  //     print('apiToken ===> $apiToken');
  //     PreferenceUtils.setString(PrefKeys.apiToken, apiToken);
  //   });
  //   Future.delayed(const Duration(seconds: 1)).then((value) {
  //     getProfile();
  //   });
  // }
  //
  // void getProfile() {
  //   AppDio.get(endpoint: Endpoints.profile).then((value) {
  //     print('profile ====> $value');
  //   });
  // }

    final emailController = TextEditingController();
  final passController = TextEditingController();
  bool obscureText = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // for logo
            Container(
              color: Colors.orange,
              height: 40.h,
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/Amazon_logo.svg',
                  semanticsLabel: 'Amazon Logo',
                  width: 10.w,
                  height: 10.h,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            // for email and pass textField
            CustomTextField(
              type: TextInputType.emailAddress,
              action: TextInputAction.next,
              hintText: 'Email Address',
              controller: emailController,
              prefixIcon: const Icon(Icons.email),
            ),
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
            // sign in button
            SizedBox(height: 1.h,),
            ElevatedButton(
                onPressed: () {
                  loginUserByApi();
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize:
                Size(95.w, 6.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  // color: Color(0xff656363)
                ),
              ),
            ),
            // don't have an account ?
            // register
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '\nDon\'t have an account ? ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            GestureDetector(
              child: const Text(
                '\nRegister',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.orange
                ),
              ),
              onTap: () {
                Navigator.push(
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

  void loginUserByApi(){
    AppDio.post(
        endpoint: Endpoints.login,
        body: {
      'email': emailController.text,
      'password': passController.text,
    }).then((value) {
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
