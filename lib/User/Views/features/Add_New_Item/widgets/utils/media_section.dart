// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class MediaSection extends StatelessWidget {
  final AddNewItemController controller;
  final Widget Function(BuildContext) buildDottedBorderWidget;

  const MediaSection({
    super.key,
    required this.controller,
    required this.buildDottedBorderWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Media',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 10.h),
      
          Text(
            'Featured image',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 10.h),
          buildDottedBorderWidget(context),
          SizedBox(height: 10.h),
      
          Text(
            'Gallery images*',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 10.h),
          buildDottedBorderWidget(context),
          SizedBox(height: 10.h),
      
          Text(
            'Video',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 5.h),
      
          CustomTextField(
            textEditingController: controller.videoController,
            hintText: 'Youtube Video URL',
            fillColor: Colors.white,
            borderSide: BorderSide(
              color: const Color(0xFF000000).withOpacity(0.3),
            ),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
