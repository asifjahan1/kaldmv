import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/screen/custom_bottom_navbar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // Text Editing Controllers
  final emailTEController = TextEditingController();
  final passwordTEController = TextEditingController();

  // Observables
  var isPasswordVisible = false.obs;
  var isLoginLoading = false.obs;

  // Shared Preferences & Role
  late SharedPreferences _prefs;
  var _role = ''.obs;

  // Role Checkers
  bool get isGuest => _role.value == 'Guest';
  bool get isOwner => _role.value == 'Owner';

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
  }

  // Initialize SharedPreferences
  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _prefillData();
  }

  // Pre-fill login data if previously saved
  Future<void> _prefillData() async {
    final email = _prefs.getString('user_email') ?? '';
    final role = _prefs.getString('user_type') ?? '';

    if (email.isNotEmpty) {
      emailTEController.text = email;
      _role.value = role;

      if (kDebugMode) {
        print('Prefilled email: $email');
        print('Prefilled role: $role');
      }
    }
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Handle Login Flow
  Future<void> handleLogin() async {
    // Simulated flow – validations are commented out
    /*
    if (emailTEController.text.isEmpty || passwordTEController.text.isEmpty) {
      _showError('Please fill all fields');
      return;
    }
    */

    isLoginLoading.value = true;

    try {
      final storedEmail = _prefs.getString('user_email');
      final storedPassword = _prefs.getString('user_password');
      final storedRole = _prefs.getString('user_type');

      _role.value = storedRole ?? '';

      if (kDebugMode) {
        print('Logging in...');
        print('Input email: ${emailTEController.text}');
        print('Stored email: $storedEmail');
        print('Stored password: $storedPassword');
        print('Stored role: $_role');
      }

      /*
      if (storedEmail == null || storedEmail != emailTEController.text.trim()) {
        _showError('Email not found. Please sign up.');
        return;
      }

      if (storedPassword == null || storedPassword != passwordTEController.text) {
        _showError('Incorrect password.');
        return;
      }

      if (storedRole == null || storedRole.isEmpty) {
        _showError('User role not found.');
        return;
      }
      */

      // Simulate successful login
      await _prefs.setBool('isLogin', true);

      Get.snackbar(
        'Success',
        'Login successful',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to main screen
      Get.off(() => BottomNavScreen());
    } catch (e) {
      _showError('Login failed: ${e.toString()}');
      if (kDebugMode) print('Login error: $e');
    } finally {
      isLoginLoading.value = false;
    }
  }

  // Show error using GetX snackbar
  void _showError(String msg) {
    Get.snackbar(
      'Error',
      msg,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }
}
