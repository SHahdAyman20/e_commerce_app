import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/screens/e_login_screen.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ERegisterScreen extends StatefulWidget{
  const ERegisterScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ERegisterScreenState();
  }
  
}
class ERegisterScreenState extends State<ERegisterScreen>{


  final  nameController = TextEditingController();
  final  emailController = TextEditingController();
  final  phoneController = TextEditingController();
  final  passController = TextEditingController();
  bool obscureText = false;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // for logo
            Container(
              color: Colors.orange,
              height: 30.h,
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
            //name
            CustomTextField(
              controller: nameController,
              type: TextInputType.text,
              action: TextInputAction.next,
              hintText: 'Name',
              prefixIcon: const Icon(Icons.person),
            ),
            //  email
            CustomTextField(
              type: TextInputType.emailAddress,
              action: TextInputAction.next,
              hintText: 'Email Address',
              controller: emailController,
              prefixIcon: const Icon(Icons.email),
            ),
            // phone number
            CustomTextField(
              controller: phoneController,
              type: TextInputType.number,
              action: TextInputAction.next,
              hintText: 'Phone',
              prefixIcon: const Icon(Icons.phone),
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
            //Re-password
            CustomTextField(
              type: TextInputType.visiblePassword,
              action: TextInputAction.done,
              hintText: 'Re-Password',
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
            SizedBox(height: 1.h,),
            // Register button
            ElevatedButton(
              onPressed: () {
                registerUserByApi();
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
                'Register',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  // color: Color(0xff656363)
                ),
              ),
            ),
            // Already have an account ?
            // login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '\nAlready have an account ? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    '\nLogin',
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
  void registerUserByApi(){
    AppDio.post(
        endpoint: Endpoints.register,
      body: {
        'name': nameController.text,
        'email': emailController.text,
        'password': passController.text,
        'phone': phoneController.text,
      }
    ).then((value) {
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