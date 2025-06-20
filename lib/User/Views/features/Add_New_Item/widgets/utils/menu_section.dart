// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/file_upload_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/dotted_builder_widget.dart';

class MenuSection extends StatelessWidget {
  final AddNewItemController controller;
  final Widget Function({
    required quill.QuillController controller,
    required String label,
  })
  buildCustomQuillField;

  final String menuTag;

  const MenuSection({
    super.key,
    required this.controller,
    required this.buildCustomQuillField,
    required this.menuTag,
  });

  @override
  Widget build(BuildContext context) {
    final menuImageController = Get.put(
      FileUploadController(),
      tag: 'menu_image',
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            "Menu",
            style: GoogleFonts.dmSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),

          Text('Name*', style: _labelStyle()),
          SizedBox(height: 5.h),
          CustomTextField(
            textEditingController: controller.menuNameController,
            hintText: 'Item Name',
            textColor: Colors.black,
            fillColor: Colors.white,
            borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
          ),
          SizedBox(height: 5.h),

          Text('Price*', style: _labelStyle()),
          SizedBox(height: 5.h),
          CustomTextField(
            controllerTag: 'item_dropdown',
            textEditingController: controller.itemPriceController,
            hintText: 'Item Price',
            fillColor: Colors.white,
            borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
            isDropdown: true,
            dropdownItems: controller.itemPriceItems,
            selectedDropdownValue: controller.selectedItemPrice.value,
            onDropdownChanged: (value) =>
                controller.selectedItemPrice.value = value!,
          ),
          SizedBox(height: 5.h),

          Text('Type*', style: _labelStyle()),
          SizedBox(height: 5.h),
          CustomTextField(
            textEditingController: controller.typeController,
            hintText: 'Choose type',
            fillColor: Colors.white,
            borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
          ),

          buildCustomQuillField(
            controller: controller.menuDescriptionController,
            label: "Description*",
          ),
          SizedBox(height: 16.h),

          Text(
            "Item Image*",
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () => menuImageController.pickFiles(),
            child: buildDottedBorderWidget(context, menuImageController),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp);
  }
}
