import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Auth/screens/login_screen.dart';

import '../../../core/global_widegts/custom_button.dart';
import '../controller/signup_controller.dart';
import 'otp_very_screen.dart';

class SignUpScreen extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());
  final RxString selectedRole = 'Guest'.obs;

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Image.asset(
                'assets/images/logo.png',
                height: 64.h,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF97C68),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Role Selection
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildRoleButton('Guest', selectedRole.value),
                        // SizedBox(width: 10.w),
                        _buildRoleButton('Owner', selectedRole.value),
                      ],
                    )),
                    SizedBox(height: 20.h),

                    // First Name
                    TextField(
                      controller: controller.firstNameController,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF867B79)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF867B79)),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    // Last Name
                    TextField(
                      controller: controller.lastNameController,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF867B79)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF867B79)),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    // Company Name (only for Owner)
                    Obx(() => selectedRole.value == 'Guest'
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: controller.companyNameController,
                          decoration: const InputDecoration(
                            hintText: 'Company Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF867B79)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF867B79)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ],
                    )
                        : const SizedBox(),
                    ),

                    // Email
                    TextField(
                      controller: controller.emailController,
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
                    SizedBox(height: 15.h),

                    // Password
                    TextField(
                      controller: controller.passwordController,
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
                    ),
                    SizedBox(height: 30.h),

                    // Sign Up Button
                    Obx(() => controller.isLoading.value
                        ? Center(
                      child: SpinKitWave(color: Color(0xFFF97C68)),
                    )
                        : SizedBox(
                      width: screenWidth * 0.9,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => LoginScreen());
                          Get.snackbar(
                            'Great Work!',
                            'Sign Up Successfully!',
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.TOP,
                            duration: Duration(milliseconds: 1800),
                          );
                        },
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
                    SizedBox(height: 20.h),

                    CustomButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      text: 'Continue with Facebook',
                      prefixIconPath: 'assets/images/fb.png',
                      textColor: Colors.black,
                      backgroundColor: Colors.transparent,
                      width: screenWidth * 0.9,
                      borderSide: BorderSide(color: Color(0xFF867B79)),
                      borderRadius: 80.r,
                    ),

                    SizedBox(height: 20.h),

                    // Terms and Privacy Policy Checkbox
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          value: controller.acceptTerms.value,
                          onChanged: (value) => controller.acceptTerms.value = value!,
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return const Color(0xFFF97C68);
                              }
                              return Colors.transparent;
                            },
                          ),
                        )),
                        RichText(
                          text: TextSpan(
                            text: 'Accept the ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms',
                                style: TextStyle(
                                  color: Color(0xFFF97C68),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xFFF97C68),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    // Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.to(() => LoginScreen());
                            // Get.snackbar('Successful!', 'Sign Up Successful! Please Log In',
                            // backgroundColor: Colors.green,
                            // );
                            log('login tapped===========');
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 18.sp,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(String role, String selectedRole) {
    return GestureDetector(
      onTap: () => this.selectedRole.value = role,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: role == selectedRole
              ? const Color(0xFF21BABA)
              : const Color(0xFFF5E5E5),
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: role == selectedRole
                ? const Color(0xFF21BABA)
                : const Color(0xFFF5E5E5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              role == 'Guest' ? Icons.person : Icons.store,
              color: role == selectedRole
                  ? Colors.white
                  : Colors.black,
              size: 18.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              role,
              style: TextStyle(
                color: role == selectedRole
                    ? Colors.white
                    : Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
