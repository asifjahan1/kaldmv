// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/User/Views/features/Profile/controller/profile_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_button.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Fixed header
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
                      'Profile',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/profile123.png',
                        height: 120.h,
                        width: 120.w,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.firstNameController.value,
                        hintText: 'First Name',
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
                      'Last Name',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.lastNameController.value,
                        hintText: 'Last Name',
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
                      'Mobile',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.mobileNumberController.value,
                        hintText: 'Mobile number',
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
                      'Fax Number',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.faxNumberController.value,
                        hintText: 'Fax number',
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
                      'Email',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController: controller.emailController.value,
                        hintText: 'Email',
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
                      'Skype',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.skypeUrlController.value,
                        hintText: 'Enter Skype url',
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
                      'Facebook URL',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.facebookUrlController.value,
                        hintText: 'Enter facebook url',
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
                      'Twitter URL',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.twitterUrlController.value,
                        hintText: 'Enter twitter url',
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
                      'Instagram URL',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.instagramUrlController.value,
                        hintText: 'Enter instagram url',
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
                      'Youtube URL',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.youtubeUrlController.value,
                        hintText: 'Enter youtube url',
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
                      'Pinterest URL',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.pinterestUrlController.value,
                        hintText: 'Enter pinterest url',
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
                      'Linkedin URL',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.linkedinUrlController.value,
                        hintText: 'Enter linkedin url',
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
                      'Website URL',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomTextField(
                        textEditingController:
                            controller.websiteUrlController.value,
                        hintText: 'Enter website url',
                        fillColor: Colors.white,
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                        hintTextColor: const Color(0xFFC3C0C0),
                        fontSize: 14.sp,
                        height: 40.h,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar(
                          'Successfull!',
                          'Profile Updated Successfully!',
                          colorText: Colors.white,
                          backgroundColor: Colors.green,
                        );
                        log('Update Profile button pressed');
                        // try {
                        //   controller.updateProfile();
                        //   Get.snackbar(
                        //     'Successfull!',
                        //     'Profile Updated Successfully!',
                        //     colorText: Colors.white,
                        //     backgroundColor: Colors.green,
                        //   );
                        //   Get.back(); // Navigate back
                        // } catch (e) {
                        //   log('Error updating profile: $e'); // Debug error
                        //   Get.snackbar(
                        //     'Error',
                        //     'Failed to update profile: $e',
                        //     colorText: Colors.white,
                        //     backgroundColor: Colors.red,
                        //   );
                        // }
                      },
                      backgroundColor: Color(0xFFF97C68),
                      text: 'Update Profile',
                      borderRadius: 12.r,
                      centerText: true,
                    ),
                    SizedBox(height: 20.h),
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
