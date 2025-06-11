import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/otp_very_screen.dart';

class SignupController extends GetxController {
  // Text Editing Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Form Key
  final formKey = GlobalKey<FormState>();

  // Observables
  var selectedRole = 'Guest'.obs; // 'A Guest' or 'Owner'
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;
  var acceptTerms = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Change selected role
  void changeRole(String role) {
    selectedRole.value = role;
  }

  // Validate required fields based on role
  bool validateFields() {
    if (firstNameController.text.isEmpty) {
      Get.snackbar('Error', 'First name is required',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    if (lastNameController.text.isEmpty) {
      Get.snackbar('Error', 'Last name is required',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    if (selectedRole.value == 'Owner' && companyNameController.text.isEmpty) {
      Get.snackbar('Error', 'Company name is required for Owners',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    if (emailController.text.isEmpty || !emailController.text.isEmail) {
      Get.snackbar('Error', 'Valid email is required',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    if (passwordController.text.isEmpty || passwordController.text.length < 8) {
      Get.snackbar('Error', 'Password must be at least 8 characters',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    if (!acceptTerms.value) {
      Get.snackbar('Error', 'Please accept Terms and Privacy Policy',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    return true;
  }

  // Sign up method
  Future<void> signUp() async {
    if (!validateFields()) return;

    isLoading.value = true;

    try {
      // Here you would typically call your API
      // For now, we'll just simulate a successful signup
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Success',
        'Sign up successful!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to OTP verification
      Get.to(
            () => OTPVerificationScreen(
          email: emailController.text,
          isForSignUp: true,
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Sign up failed: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    companyNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
