// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kaldmv/User/Auth/screens/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignupController extends GetxController {
//   // Text Editing Controllers
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final companyNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   // Observables
//   var selectedRole = 'Guest'.obs; // 'Guest' or 'Owner'
//   var isPasswordVisible = false.obs;
//   var isConfirmPasswordVisible = false.obs;
//   var isLoading = false.obs;
//   var acceptTerms = false.obs;

//   bool get isOwner => selectedRole.value == 'Owner';
//   bool get isGuest => selectedRole.value == 'Guest';

//   @override
//   void onInit() {
//     super.onInit();
//     loadSelectedRole();
//   }

//   // Save selectedRole to SharedPreferences
//   Future<void> saveSelectedRole(String role) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('user_role', selectedRole.value.toLowerCase());
//   }

//   // Load selectedRole from SharedPreferences
//   Future<void> loadSelectedRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedRole = prefs.getString('user_role');
//     if (savedRole != null && (savedRole == 'guest' || savedRole == 'owner')) {
//       selectedRole.value = savedRole == 'owner' ? 'Owner' : 'Guest';
//     }
//   }

//   // Change selected role locally (used in UI role selection)
//   void changeRole(String role) {
//     selectedRole.value = role;
//   }

//   // Toggle password visibility
//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }

//   void toggleConfirmPasswordVisibility() {
//     isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
//   }

//   // Placeholder for validations (optional)
//   bool validateFields() {
//     return true;
//   }

//   // Sign up method
//   // Future<void> signup() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   //     String backendRole = selectedRole.value == 'Owner' ? 'Admin' : 'User';
//   //   // await prefs.setString('user_role', backendRole); // Do NOT lowercase

//   //   await prefs.setString(
//   //     'user_role',
//   //     selectedRole.value.toLowerCase(),
//   //   ); // Save as lowercase: 'guest' or 'owner'
//   //   // String backendRole = selectedRole.value == 'Owner' ? 'Admin' : 'User';
//   //   // await prefs.setString('user_role', backendRole); // Save for backend use
//   //   Get.to(() => LoginScreen());
//   // }
//   Future<void> signup() async {
//     final prefs = await SharedPreferences.getInstance();
//     String backendRole = selectedRole.value == 'Owner' ? 'Admin' : 'User';
//     await prefs.setString('user_role', backendRole); // Exact casing saved here
//     Get.to(() => LoginScreen());
//   }

//   @override
//   void onClose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     companyNameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.onClose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:kaldmv/User/Auth/screens/login_screen.dart';

// class SignupController extends GetxController {
//   // Text Controllers
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final companyNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   // Observables
//   var selectedRole = 'Guest'.obs; // "Guest" or "Owner"
//   var isPasswordVisible = false.obs;
//   var isConfirmPasswordVisible = false.obs;
//   var isLoading = false.obs;
//   var acceptTerms = false.obs;

//   bool get isOwner => selectedRole.value == 'Owner';
//   bool get isGuest => selectedRole.value == 'Guest';

//   @override
//   void onInit() {
//     super.onInit();
//     loadSelectedRole();
//   }

//   void changeRole(String role) {
//     selectedRole.value = role;
//   }

//   Future<void> loadSelectedRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedRole = prefs.getString('user_role');
//     if (savedRole != null) {
//       selectedRole.value = savedRole == 'admin' ? 'Owner' : 'Guest';
//     }
//   }

//   Future<void> signup() async {
//     final prefs = await SharedPreferences.getInstance();

//     /// ✅ Save role as 'admin' or 'user'
//     await prefs.setString('user_role', isOwner ? 'admin' : 'user');

//     Get.to(() => LoginScreen());
//   }

//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }

//   void toggleConfirmPasswordVisibility() {
//     isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
//   }

//   @override
//   void onClose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     companyNameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.onClose();
//   }
// }

// // This code works perfectly
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Auth/screens/login_screen.dart';

// class SignupController extends GetxController {
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final companyNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   var selectedRole = 'Guest'.obs;
//   var isPasswordVisible = false.obs;
//   var isConfirmPasswordVisible = false.obs;
//   var isLoading = false.obs;
//   var acceptTerms = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadSelectedRole();
//   }

//   Future<void> saveSelectedRole(String role) async {
//     final prefs = await SharedPreferences.getInstance();
//     final normalized = role == 'Owner' ? 'admin' : 'user';
//     await prefs.setString('user_role', normalized);
//   }

//   Future<void> loadSelectedRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedRole = prefs.getString('user_role');
//     if (savedRole != null) {
//       selectedRole.value = savedRole == 'admin' ? 'Owner' : 'Guest';
//     }
//   }

//   void changeRole(String role) => selectedRole.value = role;

//   void togglePasswordVisibility() =>
//       isPasswordVisible.value = !isPasswordVisible.value;

//   void toggleConfirmPasswordVisibility() =>
//       isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;

//   Future<void> signup() async {
//     final prefs = await SharedPreferences.getInstance();
//     final normalized = selectedRole.value == 'Owner' ? 'admin' : 'user';
//     await prefs.setString('user_role', normalized);
//     Get.to(() => LoginScreen());
//   }

//   @override
//   void onClose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     companyNameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.onClose();
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaldmv/core/const/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../../Auth/screens/login_screen.dart';

class SignupController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyNameController = TextEditingController(); // Optional
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var selectedRole = 'Guest'.obs; // 'Guest' or 'Owner'
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;
  var acceptTerms = false.obs;

  // Save role as lowercase to SharedPreferences (e.g., 'admin' or 'user')
  Future<void> saveSelectedRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    final normalized = role == 'Owner' ? 'admin' : 'user';
    await prefs.setString('user_role', normalized);
    log('Saved user_role: $normalized');
  }

  void changeRole(String role) => selectedRole.value = role;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> signup() async {
    if (!acceptTerms.value) {
      Get.snackbar(
        "Terms not accepted",
        "Please accept the terms and conditions.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    EasyLoading.show(status: "Signing up...");

    try {
      final url = ApiUrl.createUser;
      log("Signup API URL: $url");

      final Map<String, dynamic> body = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        // Do not send role to backend — it's handled internally
      };

      log("Signup request body: ${jsonEncode(body)}");

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      log("Signup response code: ${response.statusCode}");
      log("Signup response body: ${response.body}");

      final resp = jsonDecode(response.body);

      if (response.statusCode == 201 && resp["success"] == true) {
        // Save UI-selected role locally, not from backend
        await saveSelectedRole(selectedRole.value);
        EasyLoading.showSuccess("Signup successful!");
        Get.to(() => LoginScreen());
      } else {
        EasyLoading.showError(resp["message"] ?? "Signup failed");
      }
    } catch (e) {
      log("Signup error: $e");
      EasyLoading.showError("An error occurred");
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    companyNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
