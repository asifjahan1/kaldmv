import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/screens/sign_up_screen.dart';
import '../../../core/const/app_loader.dart';
import '../../../core/global_widegts/custom_button.dart';
import '../../Views/features/Bottom_Nav_Bar/screen/custom_bottom_navbar_screen.dart';
import '../../Views/features/Home/views/home_page.dart';
import '../controller/login_controller.dart';
import 'find_account_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  // final formKey = GlobalKey<FormState>();

  // String? _emailValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your email';
  //   }
  //   String pattern = r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$';
  //   RegExp regExp = RegExp(pattern);
  //   if (!regExp.hasMatch(value)) {
  //     return 'Enter a valid email address';
  //   }
  //   return null;
  // }

  // String? _passwordValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                Image.asset(
                    'assets/images/logo.png',
                    height: 64.h,
                    fit: BoxFit.cover),
                SizedBox(height: 60.h),
                Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),

                // Email

                TextField(
                  // textEditingController: controller.emailTEController,
                  controller: controller.passwordTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF867B79)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF867B79)),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Password
                Obx(() {
                  return TextField(
                    controller: controller.passwordTEController,
                    obscureText: !controller.isPasswordVisible.value,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF867B79)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF867B79)),
                      ),
                    ),
                  );
                }),
                // SizedBox(height: 3.h),

                // Links
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      // Get.to(() => FindAccountScreen());
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: const Color(0xFF21BABA),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF21BABA),
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),

                // Login Button or Loader
                Obx(() {
                  return controller.isLoginLoading.value
                      ? loader()
                      : CustomButton(
                    onPressed: () {
                      Get.to(() => BottomNavScreen());
                      // controller.loginUser();
                    },
                    text: 'Log In',
                    textColor: Colors.white,
                    backgroundColor: const Color(0xFFF97C68),
                    width: screenWidth * 0.9,
                    borderRadius: 80.r,
                  );
                }),
                SizedBox(height: 30.h),

            CustomButton(
              onPressed: () {
                // Get.to(() => SubscriptionPlan());
                // controller.loginUser();
              },
              text: 'Continue with Google',
              prefixIconPath: 'assets/images/google.png',
              textColor: Colors.black,
              backgroundColor: Colors.transparent,
              width: screenWidth * 0.9,
              borderSide: BorderSide(color: Color(0xFF867B79)),
              borderRadius: 80.r,
            ),
                SizedBox(height: 10.h),
            CustomButton(
              onPressed: () {
                // Get.to(() => SubscriptionPlan());
                // controller.loginUser();
              },
              text: 'Continue with Facebook',
              prefixIconPath: 'assets/images/fb.png',
              textColor: Colors.black,
              backgroundColor: Colors.transparent,
              width: screenWidth * 0.9,
              borderSide: BorderSide(color: Color(0xFF867B79)),
              borderRadius: 80.r,
            ),

                SizedBox(height: 10.h),


                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New To Tamshyah? ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFFF97C68),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFF97C68),
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
