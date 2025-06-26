// // ignore_for_file: unused_field

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
// import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/screen/custom_bottom_navbar_screen.dart';
// import '../../Views/features/Profile/views/Guest_profile/guest_profile.dart';
// import '../../Views/features/Profile/views/Owner_Profile/owner_profile.dart';

// class LoginController extends GetxController {
//   // Text Editing Controllers
//   final emailTEController = TextEditingController();
//   final passwordTEController = TextEditingController();

//   // Observables
//   var isPasswordVisible = false.obs;
//   var isLoginLoading = false.obs;
//   var storedRole = ''.obs;

//   late SharedPreferences _prefs;

//   @override
//   void onInit() {
//     super.onInit();
//     _initPrefs();
//   }

//   Future<void> _initPrefs() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   // Toggle password visibility
//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }

//   /// ✅ Role-based login navigation (if you're still testing Guest/Owner separately)
//   Future<void> login() async {
//     final prefs = await SharedPreferences.getInstance();
//     String role = prefs.getString('user_role') ?? 'User';

//     if (role == 'Admin') {
//       Get.off(() => OwnerProfile(isOwner: true));
//     } else if (role == 'User') {
//       Get.off(() => GuestProfile());
//     } else {
//       Get.snackbar('Error', 'Unknown user role: $role');
//     }
//   }
//   // Future<void> login() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   String role = prefs.getString('user_role')?.toLowerCase() ?? 'guest';
//   //   await prefs.setString('user_role', role); // ensure lowercase

//   //   if (role == 'owner') {
//   //     Get.off(() => OwnerProfile(isOwner: true));
//   //   } else if (role == 'guest') {
//   //     Get.off(() => GuestProfile());
//   //   } else {
//   //     Get.snackbar('Error', 'Unknown user role: $role');
//   //   }
//   // }

//   Future<void> handleLogin() async {
//     isLoginLoading.value = true;

//     final prefs = await SharedPreferences.getInstance();
//     storedRole.value = prefs.getString('user_role') ?? 'User'; // NO toLowerCase

//     final bottomNavController = Get.find<BottomNavController>();
//     await bottomNavController.refreshRole();

//     await Future.delayed(const Duration(seconds: 1));

//     Get.off(() => BottomNavScreen());
//     isLoginLoading.value = false;
//   }

//   /// 🔄 Main login logic: navigates to BottomNavScreen and updates role in controller
//   // Future<void> handleLogin() async {
//   //   isLoginLoading.value = true;

//   //   final prefs = await SharedPreferences.getInstance();
//   //   storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'guest';

//   //   // Update BottomNavController role immediately
//   //   final bottomNavController = Get.find<BottomNavController>();
//   //   await bottomNavController.refreshRole();

//   //   // Simulate delay
//   //   await Future.delayed(const Duration(seconds: 1));

//   //   // Navigate to main screen
//   //   Get.off(() => BottomNavScreen());
//   //   isLoginLoading.value = false;
//   // }

//   @override
//   void onClose() {
//     emailTEController.dispose();
//     passwordTEController.dispose();
//     super.onClose();
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/screen/custom_bottom_navbar_screen.dart';
import 'package:kaldmv/core/const/urls.dart';

class LoginController extends GetxController {
  final emailTEController = TextEditingController();
  final passwordTEController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isLoginLoading = false.obs;
  var storedRole = ''.obs;

  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final savedRole = _prefs.getString('user_role');
    if (savedRole != null) {
      storedRole.value = savedRole;
      log('Loaded role from SharedPreferences: $savedRole');
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> handleLogin() async {
    // Validate required fields
    if (emailTEController.text.trim().isEmpty ||
        passwordTEController.text.trim().isEmpty) {
      Get.snackbar(
        "Missing fields",
        "Please enter both email and password.",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoginLoading.value = true;
    EasyLoading.show(status: "Logging in...");

    try {
      final url = ApiUrl.loginUser;
      log("Login API URL: $url");

      final Map<String, dynamic> body = {
        "email": emailTEController.text.trim(),
        "password": passwordTEController.text.trim(),
      };

      log("Login request body: ${jsonEncode(body)}");

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      log("Login response code: ${response.statusCode}");
      log("Login response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          // Extract JWT
          final String? token = data['data']?['token'] ?? data['token'];
          if (token == null) {
            throw Exception("No token found in response");
          }

          // Decode JWT to get role
          try {
            final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
            log("Decoded JWT: $decodedToken");
            final String? role = decodedToken['role']?.toString();
            if (role == null || !['user', 'admin'].contains(role)) {
              throw Exception("Invalid or missing role in JWT");
            }

            // Save token, role, and login status
            await _prefs.setString('auth_token', token);
            await _prefs.setString('user_role', role.toLowerCase());
            await _prefs.setBool('is_logged_in', true);
            storedRole.value = role.toLowerCase();
            log(
              "Saved to SharedPreferences: auth_token=$token, user_role=$role, is_logged_in=true",
            );

            // Refresh BottomNavController role
            final bottomNavController = Get.find<BottomNavController>();
            await bottomNavController.refreshRole();

            EasyLoading.showSuccess("Login Successful");
            Get.offAll(() => BottomNavScreen());
          } catch (e) {
            log("JWT decode error: $e");
            EasyLoading.showError("Failed to process user role");
            return;
          }
        } else {
          EasyLoading.showError(
            data['message'] ?? "Login failed",
            duration: const Duration(seconds: 3),
          );
        }
      } else {
        final data = jsonDecode(response.body);
        EasyLoading.showError(
          data['message'] ?? "Login failed",
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      log("Login error: $e");
      EasyLoading.showError("An error occurred: $e");
    } finally {
      isLoginLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }
}
