// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class GeneralSection extends StatelessWidget {
  final AddNewItemController controller;

  const GeneralSection({
    super.key,
    required this.controller,
    required Widget Function({
      required quill.QuillController controller,
      required String label,
    })
    buildCustomQuillField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// GENERAL
          SizedBox(height: 10.h),
          Text(
            "General",
            style: GoogleFonts.dmSans(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            'Place Name*',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            textEditingController: controller.placeNameController,
            hintText: 'What the name of place',
            fillColor: Colors.white,
            borderSide: BorderSide(
              color: const Color(0xFF000000).withOpacity(0.3),
            ),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
          ),
          SizedBox(height: 10.h),

          Text(
            'Price*',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            textEditingController: controller.priceController,
            hintText: 'Only Numbers',
            fillColor: Colors.white,
            borderSide: BorderSide(
              color: const Color(0xFF000000).withOpacity(0.3),
            ),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
          ),

          Obx(
            () => CustomTextField(
              textEditingController: controller.hourController,
              hintText: 'Hour',
              fillColor: Colors.white,
              borderSide: BorderSide(
                color: const Color(0xFF000000).withOpacity(0.3),
              ),
              hintTextColor: const Color(0xFFC3C0C0),
              fontSize: 14.sp,
              height: 40.h,
              isDropdown: true,
              dropdownItems: controller.hourItems,
              selectedDropdownValue: controller.selectedHour.value,
              onDropdownChanged: (value) =>
                  controller.selectedHour.value = value!,
            ),
          ),

          Obx(
            () => CustomTextField(
              textEditingController: controller.noneController,
              hintText: 'None',
              fillColor: Colors.white,
              borderSide: BorderSide(
                color: const Color(0xFF000000).withOpacity(0.3),
              ),
              hintTextColor: const Color(0xFFC3C0C0),
              fontSize: 14.sp,
              height: 40.h,
              isDropdown: true,
              dropdownItems: controller.noneItems,
              selectedDropdownValue: controller.selectedNone.value,
              onDropdownChanged: (value) =>
                  controller.selectedNone.value = value!,
            ),
          ),
          SizedBox(height: 10.h),

          _buildCustomQuillField(
            controller: controller.descriptionController,
            label: "Description*",
          ),

          Text(
            'Category*',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 5.h),

          CustomTextField(
            textEditingController: controller.categoryController,
            hintText: 'Select Category',
            fillColor: Colors.white,
            borderSide: BorderSide(
              color: const Color(0xFF000000).withOpacity(0.3),
            ),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
            isDropdown: true,
            dropdownItems: controller.categoryItems,
            selectedDropdownValue: controller.selectedCategory.value,
            onDropdownChanged: (value) =>
                controller.selectedCategory.value = value!,
          ),
          SizedBox(height: 10.h),
          Text(
            'Place Type*',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            textEditingController: controller.placeTypeController,
            hintText: 'Indoor',
            hintTextColor: const Color(0xFFC3C0C0),
            fillColor: Colors.white,
            borderSide: BorderSide(
              color: const Color(0xFF000000).withOpacity(0.3),
            ),
            fontSize: 14.sp,
            height: 40.h,
            isDropdown: true,
            dropdownItems: controller.placeTypeItems,
            selectedDropdownValue: controller.selectedPlaceType.value,
            onDropdownChanged: (value) =>
                controller.selectedPlaceType.value = value!,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomQuillField({
    required quill.QuillController controller,
    required String label,
  }) {
    final focusNode = FocusNode();

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 4.h),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Column(
              children: [
                // Toolbar
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildToolbarButton(
                        icon: Icons.format_bold,
                        onPressed: () =>
                            controller.formatSelection(quill.Attribute.bold),
                      ),
                      _buildToolbarButton(
                        icon: Icons.format_italic,
                        onPressed: () =>
                            controller.formatSelection(quill.Attribute.italic),
                      ),
                      _buildToolbarButton(
                        icon: Icons.format_underlined,
                        onPressed: () => controller.formatSelection(
                          quill.Attribute.underline,
                        ),
                      ),
                      _buildToolbarButton(
                        icon: Icons.format_strikethrough,
                        onPressed: () => controller.formatSelection(
                          quill.Attribute.strikeThrough,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(
                        icon: Icons.format_list_bulleted,
                        onPressed: () =>
                            controller.formatSelection(quill.Attribute.ul),
                      ),
                      _buildToolbarButton(
                        icon: Icons.format_list_numbered,
                        onPressed: () =>
                            controller.formatSelection(quill.Attribute.ol),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(
                        icon: Icons.format_quote,
                        onPressed: () => controller.formatSelection(
                          quill.Attribute.blockQuote,
                        ),
                      ),
                      _buildToolbarButton(
                        icon: Icons.code,
                        onPressed: () => controller.formatSelection(
                          quill.Attribute.codeBlock,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(
                        icon: Icons.link,
                        onPressed: () async {
                          final index = controller.selection.baseOffset;
                          final length =
                              controller.selection.extentOffset - index;

                          final result = await showDialog<String>(
                            context: Get.context!,
                            builder: (context) {
                              String dialogUrl = '';
                              return AlertDialog(
                                title: Text(
                                  'Add Link',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                content: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter URL',
                                    hintStyle: TextStyle(fontSize: 14.sp),
                                  ),
                                  style: TextStyle(fontSize: 14.sp),
                                  onChanged: (value) => dialogUrl = value,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Get.back(result: dialogUrl),
                                    child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );

                          if (result != null && result.isNotEmpty) {
                            controller.formatText(
                              index,
                              length,
                              quill.LinkAttribute(result),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                // Editor
                Expanded(
                  child: quill.QuillEditor(
                    controller: controller,
                    focusNode: focusNode,
                    scrollController: ScrollController(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbarButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      icon: Icon(icon, size: 20.sp),
      onPressed: onPressed,
      splashRadius: 20,
      padding: EdgeInsets.all(6.w),
      constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.w),
    );
  }
}
