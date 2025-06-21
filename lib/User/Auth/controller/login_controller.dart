// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/screen/custom_bottom_navbar_screen.dart';
import '../../Views/features/Profile/views/Guest_profile/guest_profile.dart';
import '../../Views/features/Profile/views/Owner_Profile/owner_profile.dart';

class LoginController extends GetxController {
  // Text Editing Controllers
  final emailTEController = TextEditingController();
  final passwordTEController = TextEditingController();

  // Observables
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
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// ✅ Role-based login navigation (if you're still testing Guest/Owner separately)
  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    String role = prefs.getString('user_role')?.toLowerCase() ?? 'guest';
    await prefs.setString('user_role', role); // ensure lowercase

    if (role == 'owner') {
      Get.off(() => OwnerProfile(isOwner: true));
    } else if (role == 'guest') {
      Get.off(() => GuestProfile());
    } else {
      Get.snackbar('Error', 'Unknown user role: $role');
    }
  }

  /// 🔄 Main login logic: navigates to BottomNavScreen and updates role in controller
  Future<void> handleLogin() async {
    isLoginLoading.value = true;

    final prefs = await SharedPreferences.getInstance();
    storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'guest';

    // Update BottomNavController role immediately
    final bottomNavController = Get.find<BottomNavController>();
    await bottomNavController.refreshRole();

    // Simulate delay
    await Future.delayed(const Duration(seconds: 1));

    // Navigate to main screen
    Get.off(() => BottomNavScreen());
    isLoginLoading.value = false;
  }

  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }
}
