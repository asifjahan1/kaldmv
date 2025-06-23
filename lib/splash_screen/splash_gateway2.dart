// splash_gateway2.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/screens/sign_up_screen.dart';
import '../User/Auth/screens/login_screen.dart';
import '../core/global_widegts/custom_button.dart';

class SplashGateway2 extends StatelessWidget {
  const SplashGateway2({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background full screen image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_getway2.png',
              fit: BoxFit.cover,
            ),
          ),
          // Top Center Content
          SafeArea(
            child: SizedBox(
              height: sh,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Image.asset(
                          'assets/images/logo1.png',
                          height: 64.h,
                          width: 178.w,
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          'Welcome to Tamshyah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          textAlign: TextAlign.center,
                          'Your smart travel companion — plan, personalize, and perfect your trip with ease.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        SizedBox(height: 255.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onPressed: () {
                                Get.to(() => SignUpScreen());
                              },
                              backgroundColor: Color(0xFFF97C68),
                              text: 'Join',
                              textColor: Colors.white,
                              width: sw * 0.40,
                            ),
                            SizedBox(width: 10.w),
                            CustomButton(
                              onPressed: () {
                                Get.to(() => LoginScreen());
                              },
                              text: 'Sign In',
                              textColor: Colors.white,
                              width: sw * 0.40,
                              backgroundColor: Colors.transparent,
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue as guest',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            GestureDetector(
                              onTap: () {
                                log('Icon clicked==============>');
                              },
                              child: Icon(
                                Icons.arrow_right_alt_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h), // Bottom padding
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
