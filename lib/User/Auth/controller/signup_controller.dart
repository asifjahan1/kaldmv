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
    await prefs.setString('user_role', role);
  }

  // Load selectedRole from SharedPreferences
  Future<void> loadSelectedRole() async {
    final prefs = await SharedPreferences.getInstance();
    final savedRole = prefs.getString('user_role');
    if (savedRole != null && (savedRole == 'Guest' || savedRole == 'Owner')) {
      selectedRole.value = savedRole;
    }
  }

  // Change selected role and save it
  void changeRole(String role) {
    selectedRole.value = role;
    saveSelectedRole(role);
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validate required fields based on role
  bool validateFields() {
    /*
    // Your validation logic here...
    */
    return true;
  }

  // Sign up method
  Future<void> signup() async {
    isLoading.value = true;

    // You may add actual signup logic here (API call, etc.)

    // Save the role after signup
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_role', selectedRole.value);

    isLoading.value = false;

    // Navigate to LoginScreen after signup
    Get.offAll(() => LoginScreen());
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
