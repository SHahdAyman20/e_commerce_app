import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/screens/authentication/forget_password/forget_password.dart';
import 'package:e_commerce_app/screens/authentication/register_screen/e_register_screen.dart';
import 'package:e_commerce_app/screens/home_screen/e_home_screen.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';
import 'package:e_commerce_app/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/show_toast.dart';
import 'package:e_commerce_app/widgets/some_widgets.dart';
import 'package:flutter/material.dart';
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
  // void initState() {
  //   super.initState();
  //  loginUserByApi();
  //   Future.delayed(const Duration(seconds: 1)).then((value) {
  //     getProfile();
  //   });
  // }

  void getProfile() {
    AppDio.get(endpoint: Endpoints.profile).then((value) {
      debugPrint('profile ====> $value');
    });
  }

  late TextEditingController emailController;
  late TextEditingController passwordController ;

  final formKey = GlobalKey<FormState>();

  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // for logo
                logo(),
                boldText(text: 'Welcome To Shoply'),
                thinText(text: 'Sign in to continue'),
                // for email textField
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
                  },
                ),
                // for password textField
                CustomTextField(
                  type: TextInputType.visiblePassword,
                  action: TextInputAction.done,
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
                // login button
                SizedBox(
                  height: 1.h,
                ),
                CustomElevatedButton(
                  onPressed: (){
                    bool isFormValid = formKey.currentState!.validate();
                    if(isFormValid){
                      loginUserByApi();
                    }
                  },
                  title: 'Sign in',
                ),
                SizedBox(
                  height: 2.h,
                ),
                // or line
                orLine(context),
                // sign in with google
                signInOptionButton(
                  onPressed: (){},
                  title: 'Login with Google',
                  imageAssets: 'assets/Google.png',
                ),
                // sign in with facebook
                signInOptionButton(
                    onPressed: (){},
                    title: 'Login with Facebook',
                    imageAssets: 'assets/Facebook.png',
                ),
                // forget password ?
                forgotPassword(naviToScreen: const ForgetPassword(), context: context),
                // don't have an account ?
                // register
                accountOption(
                    navToScreen:const ERegisterScreen(),
                    context: context,
                    question: 'Don\'t have an account ? ',
                    option: 'Register',
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginUserByApi() {
    debugPrint('language ==> ${PreferenceUtils.getString(PrefKeys.language)}');
    AppDio.post(
      endpoint: Endpoints.login,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    ).then((value) async {
      debugPrint('value ===> $value');
      debugPrint('===============> ${value.data['message']}');

      if (value.data != null) {
        if (value.data['status'] == true) {
          String apiToken = value.data['data'] != null ? value.data['data']['token'] : null;
          if (apiToken != null) {
            debugPrint('apiToken ===> $apiToken');
            PreferenceUtils.setString(PrefKeys.apiToken, apiToken);
          }
          await showToast(message: '${value.data['message']}' , backgroundColor: primaryColor);
          navToScreenWithRemoveUntil(context, navToScreen: const EHomeScreen());
        } else {
          await showToast(message: '${value.data['message']}' , backgroundColor : Colors.redAccent);
        }
      } else {
        // Handle the case when value.data is null
        debugPrint('Login error: value.data is null');
      }
    }).catchError((error) async {
      // Handle login error
      debugPrint('Login error ====> ${error.toString()}');
    });
  }
  // Google Sign - In
//   Future<void> loginWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (error) {
//       // Handle sign-in with Google error
//       debugPrint('Google Sign-In Error: $error');
//     }
//   }
//
// // Facebook Login
//   Future<void> loginWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//
//       final AccessToken accessToken = result.accessToken!;
//       final AuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);
//
//       await FirebaseAuth.instance.signInWithCredential(credential);
//
//       // TODO: Handle successful login
//     } catch (error) {
//       // Handle Facebook login error
//       debugPrint('Facebook Login Error: $error');
//     }
//   }
}
