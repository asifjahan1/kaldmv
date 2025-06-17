import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class SocialNetworkSection extends StatelessWidget {
  final AddNewItemController controller;

  const SocialNetworkSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          _buildHeader('Social Network'),

          _buildLabel('Facebook'),
          _buildField(controller.facebookController, 'Facebook URL'),

          _buildLabel('Instagram'),
          _buildField(controller.instagramController, 'Instagram URL'),

          _buildLabel('Twitter'),
          _buildField(controller.twitterController, 'Twitter URL'),
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

  Widget _buildField(TextEditingController textController, String hint) {
    return CustomTextField(
      textEditingController: textController,
      hintText: hint,
      fillColor: Colors.white,
      borderSide: BorderSide(color: const Color(0xFF000000).withOpacity(0.3)),
      hintTextColor: const Color(0xFFC3C0C0),
      fontSize: 14.sp,
      height: 40.h,
    );
  }
}
