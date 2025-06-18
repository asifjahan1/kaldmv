import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/success_screen.dart';
import '../services/otp_service.dart';

class OTPController extends GetxController {
  final RxString otp = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  final OTPService _otpService = Get.put(OTPService());

  void updateOTP(String value) {
    otp.value = value;
    errorMessage.value = '';
  }

  Future<void> verifyOTP({
    required String email,
    required bool isForSignUp,
  }) async {
    if (otp.value.length != 4) {
      errorMessage.value = 'Please enter a 4-digit OTP';
      return;
    }

    isLoading.value = true;
    try {
      await _otpService.verifyOTP(
        email: email,
        otp: otp.value,
        isForSignUp: isForSignUp,
      );

      // Navigate to success screen (optional)
      Get.to(() => SuccessScreen());
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOTP(String email) async {
    isLoading.value = true;
    try {
      await _otpService.resendOTP(email);
      Get.snackbar(
        'Success',
        'OTP has been resent to $email',
        backgroundColor: const Color(0xFFFB4958),
        colorText: Colors.white,
      );
    } catch (e) {
      errorMessage.value = 'Failed to resend OTP. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
}
