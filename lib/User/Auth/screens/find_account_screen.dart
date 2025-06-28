import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/global_widegts/custom_button.dart';
import '../../../core/global_widegts/custom_text_field.dart';
import '../controller/forget_pasword_controller.dart';
import 'login_screen.dart';

class FindAccountScreen extends StatelessWidget {
  final String email;
  final TextEditingController emailController = TextEditingController();
  final ForgetPasswordController forgetController = Get.put(
    ForgetPasswordController(),
  );

  FindAccountScreen({this.email = '', super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    emailController.text = email;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      textAlign: TextAlign.start,
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Enter your email address and we'll send you a link to reset your password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF000000).withAlpha(50),
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 50.h),

                  // Email Field
                  CustomTextField(
                    textEditingController: emailController,
                    fillColor: Color(0xFFFFFFFF),
                    hintText: 'Enter your email address',
                    hintTextColor: Color(0xFF000000).withAlpha(80),
                    borderSide: BorderSide(
                      color: Color(0xFF000000).withAlpha(50),
                    ),
                    textColor: Colors.black,
                  ),

                  SizedBox(height: 10.h),

                  // Send Reset Link Button
                  Obx(() {
                    return forgetController.isLoading.value
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            onPressed: () {
                              forgetController.emailController.text =
                                  emailController.text.trim();
                              forgetController.sendResetLink();
                            },
                            text: 'Send Reset Link',
                            textColor: Colors.white,
                            backgroundColor: const Color(0xFFF97C68),
                            width: screenWidth * 0.9,
                            height: 40.h,
                            borderRadius: 10.r,
                          );
                  }),

                  SizedBox(height: 15.h),

                  // Back to Login Button
                  CustomButton(
                    text: 'Back to Login',
                    fontSize: 16.sp,
                    textColor: const Color(0xFFF97C68),
                    backgroundColor: Colors.transparent,
                    width: screenWidth * 0.9,
                    height: 40.h,
                    borderRadius: 10.r,
                    onPressed: () {
                      Get.off(() => LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
