import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/controller/forget_pasword_controller.dart';
import 'package:kaldmv/User/Auth/screens/login_screen.dart';
import 'package:kaldmv/User/Auth/screens/utils/show_success_dialog.dart';
import '../../../core/const/app_loader.dart';
import '../../../core/global_widegts/custom_button.dart';
import '../../../core/global_widegts/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final ForgetPasswordController controller = Get.put(
    ForgetPasswordController(),
  );

  void _submit(BuildContext context) {
    final newPassword = controller.passwordController.text.trim();
    final confirmPassword = controller.confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar(
        'Required',
        'Please fill out all fields!',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar(
        'Mismatch',
        'Passwords do not match!',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    controller.updatePassword(newPassword).then((success) {
      if (success) {
        showSuccessDialog(
          context: context,
          title: 'Success',
          message: 'Your password has been updated!',
          buttonText: 'Continue',
          image: Image.asset(
            'assets/images/tick.png',
            height: 70.h,
            width: 70.w,
          ),
          onDonePressed: () {
            Get.off(() => LoginScreen());
            Get.snackbar(
              'Successful!',
              'Please log in with your new password.',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Text(
              'Update Password',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFF97C68),
              ),
            ),
            SizedBox(height: 60.h),

            // New Password
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'New Password',
                  style: TextStyle(
                    color: const Color(0xFF4C4C4C),
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Obx(() {
              return CustomTextField(
                textEditingController: controller.passwordController,
                hintText: '*********',
                hintTextColor: const Color(0xFF4C4C4C),
                obscureText: !controller.isPasswordVisible.value,
                fillColor: Colors.white,
                borderSide: BorderSide(
                  color: const Color(0xFF4C4C4C).withAlpha(30),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: const Color(0xFF4A4F5E),
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              );
            }),
            SizedBox(height: 20.h),

            // Confirm Password
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: const Color(0xFF4C4C4C),
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Obx(() {
              return CustomTextField(
                textEditingController: controller.confirmPasswordController,
                hintText: '*********',
                hintTextColor: const Color(0xFF4C4C4C),
                obscureText: !controller.isConfirmPasswordVisible.value,
                fillColor: Colors.white,
                textColor: Colors.black,
                borderSide: BorderSide(
                  color: const Color(0xFF4C4C4C).withAlpha(30),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isConfirmPasswordVisible.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: const Color(0xFF4A4F5E),
                  ),
                  onPressed: controller.toggleConfirmPasswordVisibility,
                ),
              );
            }),
            SizedBox(height: 40.h),

            // Submit Button or Loader
            Obx(() {
              return controller.isLoginLoading.value
                  ? loader()
                  : CustomButton(
                      onPressed: () => _submit(context),
                      text: 'Update',
                      textColor: Colors.white,
                      backgroundColor: const Color(0xFFF97C68),
                      width: 0.9.sw,
                      borderRadius: 10.r,
                    );
            }),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
