import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/screens/authentication/login_screen/e_login_screen.dart';
import 'package:e_commerce_app/screens/home_screen/e_home_screen.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
import 'package:e_commerce_app/widgets/customs/custom_elevated_button.dart';
import 'package:e_commerce_app/widgets/customs/custom_text_field.dart';
import 'package:e_commerce_app/widgets/navigation/navigation.dart';
import 'package:e_commerce_app/widgets/show_toast/show_toast.dart';
import 'package:e_commerce_app/widgets/some_widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ERegisterScreen extends StatefulWidget {
  const ERegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ERegisterScreenState();
  }
}

class ERegisterScreenState extends State<ERegisterScreen> {

  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController passwordController ;
  late TextEditingController confirmationPasswordController ;

  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmationPasswordController = TextEditingController();

  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmationPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // for logo
              const SizedBox(
                height: 20,
              ),
              // for logo
              logo(),
              boldText(text: 'Let’s Get Started'),
              thinText(text: 'Create an new account'),
              // name textField
              CustomTextField(
                controller: nameController,
                type: TextInputType.text,
                action: TextInputAction.next,
                hintText: 'Full Name',
                prefixIcon: const Icon(Icons.person),
                validator: (name){
                  if (name.isEmpty) {
                    return 'this field is required!';
                  }
                  return null;
                },
              ),
              // phone number textField
              CustomTextField(
                controller: phoneNumberController,
                type: TextInputType.phone,
                action: TextInputAction.next,
                hintText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone),
                validator: (phone){
                  if (phone.isEmpty) {
                    return 'this field is required!';
                  }else if(phone.toString().length < 11){
                    return 'the phone number should be 11 digit !';
                  }
                  return null;
                },
              ),
              // email textField
              CustomTextField(
                type: TextInputType.emailAddress,
                action: TextInputAction.next,
                hintText: 'Email Address',
                controller: emailController,
                prefixIcon: const Icon(Icons.email),
                validator: (email){
                  if (email.isEmpty) {
                    return 'this field is required!';
                  } else if (!email.toString().contains('@')) {
                    return 'Email must contain "@" ';
                  } else if (!email.toString().contains('.')) {
                    return 'Email must contain "." ';
                  }
                  return null;
                },
              ),
              //password textField
              CustomTextField(
                type: TextInputType.visiblePassword,
                action: TextInputAction.next,
                hintText: 'Password',
                controller: passwordController,
                prefixIcon: const Icon(Icons.lock),
                obscureText: obscureText,
                validator: (pass) {
                  if (pass.isEmpty) {
                    return 'This field is required!';
                  } else if (pass.toString().length < 6) {
                    return 'this password too weak !';
                  }
                  return null;
                },
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
              //confirmation password textField
              CustomTextField(
                type: TextInputType.visiblePassword,
                action: TextInputAction.done,
                hintText: 'Password Again',
                controller: confirmationPasswordController,
                prefixIcon: const Icon(Icons.lock),
                obscureText: obscureText,
                validator: (pass) {
                  if (pass.isEmpty) {
                    return 'This field is required!';
                  } else if (pass.toString().length < 6) {
                    return 'this password too weak !';
                  }
                  return null;
                },
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
              SizedBox(height: 2.h,),
              // Already have an account ?
              // login
              accountOption(
                  navToScreen:const ELoginScreen(),
                  context: context,
                  question: 'Already have an account ? ',
                  option: 'Login'
              ),],),),),);}

  void registerUserByApi() {
    if (passwordController.text != confirmationPasswordController.text) {
      showToast(
        message: 'Password and confirmation password do not match',
        backgroundColor: Colors.redAccent,
      );
      return;
    }
    AppDio.post(
        endpoint: Endpoints.register,
        body: {
          'name': nameController.text,
          'phone': phoneNumberController.text,
          'email': emailController.text,
          'password': passwordController.text,
    }).then((value) async{
      debugPrint('value ===> $value');
      debugPrint('===============> ${value.data['message']}');
      if (value.data != null) {
        if (value.data['status'] == true) {
          String apiToken = value.data['data'] != null ? value.data['data']['token'] : null;
          debugPrint('apiToken ===> $apiToken');
          PreferenceUtils.setString(PrefKeys.apiToken, apiToken);
                  await showToast(
            message: '${value.data['message']}' ,
            backgroundColor: primaryColor,
          );
          // ignore: use_build_context_synchronously
          navToScreenWithRemoveUntil(context, navToScreen: const EHomeScreen(id: 44,),);
        } else {
          await showToast(message: '${value.data['message']}' , backgroundColor : Colors.redAccent);
        }
      } else {
        // Handle the case when value.data is null
        debugPrint('register error: value.data is null');
      }
      // Save user data to shared preferences
    PreferenceUtils.setString(PrefKeys.name, nameController.text);
    PreferenceUtils.setString(PrefKeys.email, emailController.text);
    PreferenceUtils.setString(PrefKeys.password, passwordController.text);
      // Handle successful registration
    }).catchError((error) {
      // Handle registration error
      // Handle login error
      debugPrint('Registration error ====> ${error.toString()}');
    });
  }
}
