import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class ContactInfoSection extends StatelessWidget {
  final AddNewItemController controller;

  const ContactInfoSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          _buildHeader('Contact Info'),
      
          _buildLabel('Email Address*'),
          _buildField(
            controller.emailController,
            'Enter Email Address',
          ),
      
          _buildLabel('Phone Number-1 (optional)'),
          _buildField(
            controller.phone1Controller,
            'Your phone number',
          ),
      
          _buildLabel('Phone Number-2 (optional)'),
          _buildField(
            controller.phone2Controller,
            'Your phone number',
          ),
      
          _buildLabel('Website (optional)'),
          _buildField(
            controller.websiteController,
            'Your Website URL',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String text) => Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      );

  Widget _buildLabel(String text) => Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      );

  Widget _buildField(
    TextEditingController controller,
    String hint,
  ) {
    return CustomTextField(
      textEditingController: controller,
      hintText: hint,
      fillColor: Colors.white,
      borderSide: BorderSide(color: const Color(0xFF000000).withOpacity(0.3)),
      hintTextColor: const Color(0xFFC3C0C0),
      fontSize: 14.sp,
      height: 40.h,
    );
  }
}
