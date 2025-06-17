import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';

class FeaturedCheckbox extends StatelessWidget {
  final AddNewItemController controller;

  const FeaturedCheckbox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Mark this place as featured',
            style: TextStyle(
              color: const Color(0xFF3F201C),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          GetBuilder<AddNewItemController>(
            builder: (controller) {
              return Row(
                children: [
                  Checkbox(
                    value: controller.isFeatured.value,
                    onChanged: (val) {
                      controller.isFeatured.value = val!;
                      controller.update();
                    },
                    side: BorderSide(color: const Color(0xFF5F5F5F)),
                  ),
                  Text(
                    'Mark this place as featured',
                    style: TextStyle(
                      color: const Color(0xFF9B9B9B),
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
