import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/screens/sign_up_screen.dart';
import '../../../core/const/app_loader.dart';
import '../../../core/global_widegts/custom_button.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final bool isOwner;
  final bool isGuest;

  LoginScreen({super.key, this.isOwner = false, this.isGuest = true});

  final LoginController controller = Get.put(LoginController());

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
                Image.asset('assets/images/logo.png', height: 64.h),
                SizedBox(height: 60.h),
                Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),

                // Email Field
                TextField(
                  controller: controller.emailTEController,
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

                // Password Field
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

                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
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

                Obx(() {
                  return controller.isLoginLoading.value
                      ? loader()
                      : CustomButton(
                          onPressed: () => controller.handleLogin(),
                          text: 'Log In',
                          textColor: Colors.white,
                          backgroundColor: const Color(0xFFF97C68),
                          width: screenWidth * 0.9,
                          borderRadius: 80.r,
                        );
                }),

                /*
                Obx(
                  () => controller.isLoginLoading.value
                      ? Center(
                          child: SpinKitWave(color: const Color(0xFFF97C68)),
                        )
                      : SizedBox(
                          width: screenWidth * 0.9,
                          height: 40.h,
                          child: ElevatedButton(
                            onPressed: () => controller.handleLogin(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF97C68),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.r),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ),
                */
                SizedBox(height: 30.h),

                // Social Buttons
                CustomButton(
                  onPressed: () {},
                  text: 'Continue with Google',
                  prefixIconPath: 'assets/images/google.png',
                  textColor: Colors.black,
                  backgroundColor: Colors.transparent,
                  width: screenWidth * 0.9,
                  borderSide: const BorderSide(color: Color(0xFF867B79)),
                  borderRadius: 80.r,
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  onPressed: () {},
                  text: 'Continue with Facebook',
                  prefixIconPath: 'assets/images/fb.png',
                  textColor: Colors.black,
                  backgroundColor: Colors.transparent,
                  width: screenWidth * 0.9,
                  borderSide: const BorderSide(color: Color(0xFF867B79)),
                  borderRadius: 80.r,
                ),
                SizedBox(height: 10.h),

                // Sign Up redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New To Tamshyah? ',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => SignUpScreen()),
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
