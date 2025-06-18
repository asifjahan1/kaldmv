import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  // Text Editing Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observables
  var selectedRole = 'Guest'.obs; // 'Guest' or 'Owner'
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;
  var acceptTerms = false.obs;

  bool get isOwner => selectedRole.value == 'Owner';
  bool get isGuest => selectedRole.value == 'Guest';

  @override
  void onInit() {
    super.onInit();
    loadSelectedRole();
  }

  // Save selectedRole to SharedPreferences
  Future<void> saveSelectedRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_role', selectedRole.value.toLowerCase());
  }

  // Load selectedRole from SharedPreferences
  Future<void> loadSelectedRole() async {
    final prefs = await SharedPreferences.getInstance();
    final savedRole = prefs.getString('user_role');
    if (savedRole != null && (savedRole == 'guest' || savedRole == 'owner')) {
      selectedRole.value = savedRole == 'owner' ? 'Owner' : 'Guest';
    }
  }

  // Change selected role locally (used in UI role selection)
  void changeRole(String role) {
    selectedRole.value = role;
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Placeholder for validations (optional)
  bool validateFields() {
    return true;
  }

  // Sign up method
  Future<void> signup() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'user_role',
      selectedRole.value.toLowerCase(),
    ); // Save as lowercase: 'guest' or 'owner'
    Get.to(() => LoginScreen());
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
