// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/User/Views/features/Profile/controller/profile_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_button.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class Settings extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              menuIconPath: 'assets/images/menu11.png',
              logoPath: 'assets/images/logo22.png',
              backgroundColor: Colors.white,
              showFilters: false,
              showSearchBar: false,
              isAISuggestionPanelVisible: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Old Password',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.oldPasswordController.value,
                        hintText: 'Enter Old Password',
                        fillColor: Colors.white,
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                        hintTextColor: const Color(0xFFC3C0C0),
                        fontSize: 14.sp,
                        height: 40.h,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'New Password',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.newPasswordController.value,
                        hintText: 'Enter New Password',
                        fillColor: Colors.white,
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                        hintTextColor: const Color(0xFFC3C0C0),
                        fontSize: 14.sp,
                        height: 40.h,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.confirmPasswordController.value,
                        hintText: 'Enter Confirm Password',
                        fillColor: Colors.white,
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                        hintTextColor: const Color(0xFFC3C0C0),
                        fontSize: 14.sp,
                        height: 40.h,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Update Password',
                      backgroundColor: Color(0xFFF97C68),
                      borderRadius: 12.r,
                      centerText: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
