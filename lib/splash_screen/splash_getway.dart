import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kaldmv/splash_screen/splash_gateway2.dart';

import '../core/global_widegts/custom_button.dart';

class SplashGateway extends StatelessWidget {
  const SplashGateway({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background full screen image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_getway.png',
              fit: BoxFit.cover,
            ),
          ),

          // Top Center Logo using Column
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
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

                    // Spacer(),
                    SizedBox(
                      height: 330.h,
                    ),
                    Text('Plan Smarter. Travel Better.', style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 8.h,
                    ),

                    Text(
                      textAlign: TextAlign.center,
                        'Create the perfect itinerary with ease — powered by advanced AI to tailor every trip to your style, schedule, and budget.',
                    style: TextStyle(color: Colors.white70, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomButton(
                      width: sw * 0.9,
                      onPressed: () {
                        // Get.to(() =>SplashGateway2());
                      },
                      text: 'Get Started',
                      centerText: true,
                      backgroundColor: Colors.white,
                      textColor: Color(0xFFF97C68),
                      suffixIcon: CircleAvatar(
                        radius: 14.r,
                        backgroundColor: Color(0xFFF97C68),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() =>SplashGateway2());
                          },
                            child: Icon(Icons.arrow_right_alt_rounded, color: Colors.white, size: 20.sp)),
                      ),
                    ),


                  ],

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
