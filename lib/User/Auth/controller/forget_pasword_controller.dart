import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kaldmv/core/const/urls.dart';
import '../screens/forget_pass_otp_verification.dart';

class ForgetPasswordController extends GetxController {
  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // State variables
  final RxBool isLoading = false.obs;
  final RxBool isLoginLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  // For OTP & email (shared between screens)
  final RxString email = ''.obs;
  final RxString otp = ''.obs;

  // Toggle password visibility
  void togglePasswordVisibility() => isPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();

  /// Sends the password reset email
  Future<void> sendResetLink() async {
    final enteredEmail = emailController.text.trim();
    if (enteredEmail.isEmpty) {
      EasyLoading.showError("Please enter your email");
      return;
    }

    isLoading.value = true;
    EasyLoading.show(status: "Sending...");

    try {
      final response = await http.post(
        Uri.parse(ApiUrl.resetPasswordReq),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": enteredEmail}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['success'] == true) {
        EasyLoading.showSuccess("Reset email sent successfully!");
        email.value = enteredEmail;
        Get.to(() => ForgetPassOtpVerification(), arguments: enteredEmail);
      } else {
        EasyLoading.showError(data['message'] ?? "Failed to send reset email");
      }
    } catch (e) {
      EasyLoading.showError("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  /// Updates the user's password using the OTP and new password
  Future<bool> updatePassword(String newPassword) async {
    isLoginLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(ApiUrl.verifyOtpAndChangePassword),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email.value,
          "otp": int.tryParse(otp.value) ?? 0,
          "newPwd": newPassword,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['success'] == true) {
        return true;
      } else {
        Get.snackbar(
          'Error',
          data['message'] ?? 'Password update failed',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } finally {
      isLoginLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
