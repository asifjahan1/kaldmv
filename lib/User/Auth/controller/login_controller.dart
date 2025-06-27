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
    storedRole.value = _prefs.getString('user_role') ?? '';
    emailTEController.text = _prefs.getString('email') ?? '';
    passwordTEController.text = _prefs.getString('password') ?? '';
    log(
      "Loaded prefs -> email: ${emailTEController.text}, password: ${passwordTEController.text}, token: ${_prefs.getString('auth_token')}",
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> handleLogin() async {
    final email = emailTEController.text.trim();
    final password = passwordTEController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Missing Fields",
        "Please enter both email and password",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoginLoading.value = true;
    EasyLoading.show(status: "Logging in...");

    try {
      final url = ApiUrl.loginUser;
      log("Login API URL: $url");

      final body = {"email": email, "password": password};
      log("Login request body: ${jsonEncode(body)}");

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      log("Login response code: ${response.statusCode}");
      log("Login response body: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final token = data['data']?['accessToken'] ?? data['accessToken'];
        if (token == null || token.isEmpty) {
          throw Exception("No token found in response");
        }

        final decodedToken = JwtDecoder.decode(token);
        final String? roleFromToken = decodedToken['role']?.toString();

        final normalizedRole =
            (roleFromToken != null &&
                (roleFromToken.toLowerCase() == 'admin' ||
                    roleFromToken.toLowerCase() == 'user'))
            ? roleFromToken.toLowerCase()
            : storedRole.value;

        // Save all to SharedPreferences
        await _prefs.setString('auth_token', token);
        await _prefs.setString('email', email);
        await _prefs.setString('password', password);
        await _prefs.setString('user_role', normalizedRole);
        await _prefs.setBool('is_logged_in', true);

        storedRole.value = normalizedRole;

        // Refresh bottom nav
        final bottomNavController = Get.find<BottomNavController>();
        await bottomNavController.refreshRole();

        EasyLoading.showSuccess("Login Successful");
        Get.offAll(() => BottomNavScreen());
      } else {
        EasyLoading.showError(data['message'] ?? "Login failed");
      }
    } catch (e) {
      log("Login error: $e");
      EasyLoading.showError("An error occurred: ${e.toString()}");
    } finally {
      isLoginLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  Future<bool> logout() async {
    EasyLoading.show(status: "Logging out...");

    try {
      final token = _prefs.getString('auth_token');
      final email = _prefs.getString('email');
      final password = _prefs.getString('password');

      log("Logout token: $token");
      log("Logout email: $email");
      log("Logout password: $password");

      if (token == null || email == null || password == null) {
        throw Exception("Missing token or credentials");
      }

      final response = await http.post(
        Uri.parse(ApiUrl.logout),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"email": email, "password": password}),
      );

      log("Logout response code: ${response.statusCode}");
      log("Logout response body: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        await _prefs.clear();
        EasyLoading.showSuccess("Logout successful");
        return true;
      } else {
        EasyLoading.showError(data['message'] ?? "Logout failed");
        return false;
      }
    } catch (e) {
      log("Logout error: $e");
      EasyLoading.showError("Logout error: ${e.toString()}");
      return false;
    } finally {
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
