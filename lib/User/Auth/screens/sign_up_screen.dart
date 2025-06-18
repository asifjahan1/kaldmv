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
                          color: const Color(0xFFF97C68),
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
                    Obx(
                          () => controller.isOwner
                          ? Column(
                        children: [
                          _buildTextField(
                            controller.companyNameController,
                            'Company Name',
                          ),
                          SizedBox(height: 15.h),
                        ],
                      )
                          : const SizedBox(),
                    ),
                    _buildTextField(controller.emailController, 'Email'),
                    SizedBox(height: 15.h),
                    _buildPasswordField(
                      controller.passwordController,
                      'Password',
                      true,
                    ),
                    SizedBox(height: 15.h),
                    _buildPasswordField(
                      controller.confirmPasswordController,
                      'Confirm Password',
                      false,
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
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                  return states.contains(MaterialState.selected)
                                      ? const Color(0xFFF97C68)
                                      : Colors.grey;
                                }),
                          ),
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: 'Accept the ',
                              style: TextStyle(
                                color: Colors.black,
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
                                  style: TextStyle(color: Colors.black),
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
                          style: TextStyle(fontSize: 16.sp),
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
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF21BABA) : const Color(0xFFF5E5E5),
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color:
            isSelected ? const Color(0xFF21BABA) : const Color(0xFFF5E5E5),
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

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
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
      TextEditingController controller,
      String hint,
      bool isMainPassword,
      ) {
    return Obx(() {
      final isVisible = isMainPassword
          ? this.controller.isPasswordVisible.value
          : this.controller.isConfirmPasswordVisible.value;
      return TextField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              if (isMainPassword) {
                this.controller.togglePasswordVisibility();
              } else {
                this.controller.toggleConfirmPasswordVisibility();
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
