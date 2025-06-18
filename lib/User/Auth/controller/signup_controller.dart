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

  // Form Key
  // final formKey = GlobalKey<FormState>();

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
    saveSelectedRole(role); // ✅ save it when changed
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
  Future<void> signUp() async {
    if (!validateFields()) return;

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 2));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', emailController.text.trim());
      await prefs.setString('user_password', passwordController.text);
      await prefs.setString('user_type', selectedRole.value);

      Get.snackbar(
        'Success',
        'Sign up successful!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.to(() => LoginScreen(isOwner: isOwner, isGuest: isGuest));
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
