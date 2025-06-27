import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Auth/screens/login_screen.dart';
import '../../../core/global_widegts/custom_button.dart';
import '../controller/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Image.asset('assets/images/logo.png', height: 64.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1B0400),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildRoleButton(
                            'Guest',
                            controller.selectedRole.value,
                          ),
                          _buildRoleButton(
                            'Owner',
                            controller.selectedRole.value,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildTextField(
                      controller.firstNameController,
                      'First Name',
                    ),
                    SizedBox(height: 15.h),
                    _buildTextField(controller.lastNameController, 'Last Name'),
                    SizedBox(height: 15.h),
                    _buildTextField(
                      controller.companyNameController,
                      'Company Name (optional)',
                    ),
                    SizedBox(height: 15.h),
                    _buildTextField(controller.emailController, 'Email'),
                    SizedBox(height: 15.h),
                    _buildPasswordField(
                      controller.passwordController,
                      'Password',
                      true,
                    ),
                    SizedBox(height: 30.h),
                    Obx(
                      () => controller.isLoading.value
                          ? Center(
                              child: SpinKitWave(
                                color: const Color(0xFFF97C68),
                              ),
                            )
                          : SizedBox(
                              width: screenWidth * 0.9,
                              height: 40.h,
                              child: ElevatedButton(
                                onPressed: controller.signup,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF97C68),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.r),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      onPressed: () {},
                      text: 'Continue with Google',
                      prefixIconPath: 'assets/images/google.png',
                      textColor: Colors.black,
                      backgroundColor: Colors.transparent,
                      width: screenWidth * 0.9,
                      borderSide: const BorderSide(color: Color(0xFF867B79)),
                      borderRadius: 80.r,
                    ),
                    SizedBox(height: 10.h),
                    CustomButton(
                      onPressed: () {},
                      text: 'Continue with Facebook',
                      prefixIconPath: 'assets/images/fb.png',
                      textColor: Colors.black,
                      backgroundColor: Colors.transparent,
                      width: screenWidth * 0.9,
                      borderSide: const BorderSide(color: Color(0xFF867B79)),
                      borderRadius: 80.r,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.acceptTerms.value,
                            onChanged: (val) =>
                                controller.acceptTerms.value = val ?? false,
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                              (states) {
                                return states.contains(WidgetState.selected)
                                    ? const Color(0xFFF97C68)
                                    : Colors.transparent;
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: 'Accept the ',
                              style: TextStyle(
                                color: const Color(0xFF72544F),
                                fontSize: 16.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms',
                                  style: TextStyle(
                                    color: const Color(0xFFF97C68),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' and ',
                                  style: TextStyle(color: Color(0xFF72544F)),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: const Color(0xFFF97C68),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF72544F),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () => Get.to(() => LoginScreen()),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xFFF97C68),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(String role, String selectedRole) {
    final isSelected = role == selectedRole;
    return GestureDetector(
      onTap: () => controller.changeRole(role),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF21BABA) : const Color(0xFFF8EFEE),
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF21BABA)
                : const Color(0xFFF8EFEE),
          ),
        ),
        child: Row(
          children: [
            Icon(
              role == 'Guest' ? Icons.person : Icons.store,
              color: isSelected ? Colors.white : Colors.black,
              size: 18.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              role,
              style: TextStyle(
                fontSize: 14.sp,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController textController, String hint) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF867B79)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF867B79)),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    TextEditingController textController,
    String hint,
    bool isMainPassword,
  ) {
    return Obx(() {
      final isVisible = controller.isPasswordVisible.value;
      return TextField(
        controller: textController,
        obscureText: !isVisible,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              if (isMainPassword) {
                controller.togglePasswordVisibility();
              }
            },
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF867B79)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF867B79)),
          ),
        ),
      );
    });
  }
}
