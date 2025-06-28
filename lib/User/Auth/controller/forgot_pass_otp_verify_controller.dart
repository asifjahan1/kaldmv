import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kaldmv/User/Auth/screens/forget_pasword_screen.dart';
import 'package:kaldmv/core/const/urls.dart';
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
    final args = Get.arguments as String?;
    if (args != null && args.isNotEmpty) {
      email.value = args;
    }

    otpController.addListener(() {
      otp.value = otpController.text;
      log('OTP updated: ${otp.value}');
    });
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  Future<void> verifyOtp() async {
    if (otp.value.length != 4) {
      Get.snackbar(
        "Invalid OTP",
        "Please enter the 4-digit OTP sent to your email.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    EasyLoading.show(status: "Verifying...");

    try {
      final url = "${ApiUrl.baseUrl}/api/v1/auth/verify-otp-and-pwd-change";
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email.value,
          "otp": int.parse(otp.value),
          "newPwd": "123456", // 🔐 Replace with actual password later
        }),
      );

      log("OTP Verification response: ${response.body}");

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['success'] == true) {
        EasyLoading.dismiss();

        Get.snackbar(
          'Success',
          'OTP verified! Now set a new password.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // ✅ Navigate to new password setup screen
        Get.to(() => ForgetPasswordScreen());
      } else {
        EasyLoading.showError(data['message'] ?? "OTP verification failed");
      }
    } catch (e) {
      EasyLoading.showError("Something went wrong");
      log("OTP Verification Error: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
