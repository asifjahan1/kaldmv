// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/controller/forgot_pass_otp_verify_controller.dart';
import 'package:pinput/pinput.dart';

import '../../../core/global_widegts/custom_button.dart';

class ForgetPassOtpVerification extends StatelessWidget {
  const ForgetPassOtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPassOtpVerificationController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF97C68),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Center(
                    child: Obx(
                      () => Text(
                        'Code has been sent to ${controller.email.value.isNotEmpty ? controller.email.value : 'your email'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Pinput(
                      closeKeyboardWhenCompleted: true,
                      controller: controller.otpController,
                      length: 4,
                      defaultPinTheme: controller.defaultPinTheme,
                      onCompleted: (pin) {
                        if (kDebugMode) {
                          log('OTP entered: $pin');
                        }
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomButton(
                    width: screenWidth * 0.9,
                    height: 40.h,
                    borderRadius: 10.r,
                    backgroundColor: const Color(0xFFF97C68),
                    text: 'Verification',
                    onPressed: controller.verifyOtp,
                  ),
                  // SizedBox(height: 30.h),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text(
                  //       'Didn’t get the otp',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     SizedBox(width: 3.w),
                  //     Stack(
                  //       alignment: Alignment.bottomCenter,
                  //       children: [
                  //         Text(
                  //           'Resend',
                  //           style: TextStyle(
                  //             color: Color(0xFFF97C68),
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //         Positioned(
                  //           bottom: -2,
                  //           child: Container(
                  //             width: 45,
                  //             height: 1.5,
                  //             color: Color(0xFFF97C68),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
