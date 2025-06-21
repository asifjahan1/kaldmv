import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/screens/forget_pasword_screen.dart';
import 'package:pinput/pinput.dart';

class ForgetPassOtpVerificationController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final RxString otp = ''.obs;
  final RxString email = ''.obs;

  final defaultPinTheme = PinTheme(
    width: 50.w,
    height: 40.h,
    textStyle: TextStyle(fontSize: 22.sp, color: Color(0xFFF97C68)),
    decoration: BoxDecoration(
      color: Color(0xFFFFFFFF),
      border: Border.all(color: Color(0xFFF97C68), width: 1),
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    // Set email from arguments passed during navigation
    final args = Get.arguments as String?;
    if (args != null && args.isNotEmpty) {
      email.value = args;
    }
    // Listen to OTP changes
    otpController.addListener(() {
      otp.value = otpController.text;
      if (kDebugMode) {
        log('OTP updated: ${otp.value}');
      }
    });
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  void verifyOtp() {
    if (kDebugMode) {
      log('Verification button pressed with OTP: ${otp.value}');
    }
    Get.to(() => ForgetPasswordScreen());
    Get.snackbar(
      'Congratulations!',
      'Please setup new password!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
