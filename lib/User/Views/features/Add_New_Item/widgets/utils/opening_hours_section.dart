import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class OpeningHoursSection extends StatelessWidget {
  final AddNewItemController controller;

  const OpeningHoursSection({super.key, required this.controller});

  final String _hintText = '9:00 - 17:00 OR 9:00 - 11:00 & 14:00 - 17:00';

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, TextEditingController>> days = [
      MapEntry('Monday', controller.mondayController),
      MapEntry('Tuesday', controller.tuesdayController),
      MapEntry('Wednesday', controller.wednesdayController),
      MapEntry('Thursday', controller.thursdayController),
      MapEntry('Friday', controller.fridayController),
      MapEntry('Saturday', controller.saturdayController),
      MapEntry('Sunday', controller.sundayController),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Opening Hours',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),
          ...days.map((entry) => _buildDayField(entry.key, entry.value)),
        ],
      ),
    );
  }

  Widget _buildDayField(String day, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            textEditingController: controller,
            hintText: _hintText,
            textColor: Colors.black,
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
