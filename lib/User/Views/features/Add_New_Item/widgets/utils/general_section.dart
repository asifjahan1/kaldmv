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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              "General",
              style: GoogleFonts.dmSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            _buildLabel('Place Name*'),
            _buildCustomTextField(
              controller.placeNameController,
              'What the name of place',
            ),
            SizedBox(height: 10.h),
            _buildLabel('Price*'),
            _buildCustomTextField(controller.priceController, 'Only Numbers'),
            _buildDropdown(
              'hour_dropdown',
              controller.hourController,
              'Hour',
              controller.hourItems,
              controller.selectedHour,
            ),
            _buildDropdown(
              'none_dropdown',
              controller.noneController,
              'None',
              controller.noneItems,
              controller.selectedNone,
            ),
            SizedBox(height: 10.h),
            _buildCustomQuillField(
              controller: controller.descriptionController,
              label: "Description*",
            ),
            _buildLabel('Category*'),
            _buildDropdown(
              'select_dropdown',
              controller.categoryController,
              'Select Category',
              controller.categoryItems,
              controller.selectedCategory,
            ),
            SizedBox(height: 10.h),
            _buildLabel('Place Type*'),
            _buildDropdown(
              'place_dropdown',
              controller.placeTypeController,
              'Indoor',
              controller.placeTypeItems,
              controller.selectedPlaceType,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
  );

  Widget _buildCustomTextField(
    TextEditingController controller,
    String hintText,
  ) => CustomTextField(
    textEditingController: controller,
    hintText: hintText,
    textColor: Colors.black,
    fillColor: Colors.white,
    borderSide: BorderSide(color: const Color(0xFF000000).withOpacity(0.3)),
    hintTextColor: const Color(0xFFC3C0C0),
    fontSize: 14.sp,
    height: 40.h,
  );

  Widget _buildDropdown(
    String tag,
    TextEditingController controller,
    String hintText,
    List<String> items,
    RxString selectedValue,
  ) {
    return Obx(
      () => CustomTextField(
        controllerTag: tag,
        textEditingController: controller,
        hintText: hintText,
        textColor: Colors.black,
        fillColor: Colors.white,
        borderSide: BorderSide(color: const Color(0xFF000000).withOpacity(0.3)),
        hintTextColor: const Color(0xFFC3C0C0),
        fontSize: 14.sp,
        height: 40.h,
        isDropdown: true,
        dropdownItems: items,
        selectedDropdownValue: selectedValue.value,
        onDropdownChanged: (value) => selectedValue.value = value!,
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
          _buildLabel(label),
          SizedBox(height: 4.h),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildToolbarButton(
                        Icons.format_bold,
                        () => controller.formatSelection(quill.Attribute.bold),
                      ),
                      _buildToolbarButton(
                        Icons.format_italic,
                        () =>
                            controller.formatSelection(quill.Attribute.italic),
                      ),
                      _buildToolbarButton(
                        Icons.format_underlined,
                        () => controller.formatSelection(
                          quill.Attribute.underline,
                        ),
                      ),
                      _buildToolbarButton(
                        Icons.format_strikethrough,
                        () => controller.formatSelection(
                          quill.Attribute.strikeThrough,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(
                        Icons.format_list_bulleted,
                        () => controller.formatSelection(quill.Attribute.ul),
                      ),
                      _buildToolbarButton(
                        Icons.format_list_numbered,
                        () => controller.formatSelection(quill.Attribute.ol),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(
                        Icons.format_quote,
                        () => controller.formatSelection(
                          quill.Attribute.blockQuote,
                        ),
                      ),
                      _buildToolbarButton(
                        Icons.code,
                        () => controller.formatSelection(
                          quill.Attribute.codeBlock,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(Icons.link, () async {
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
                                  onPressed: () => Get.back(result: dialogUrl),
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
                      }),
                    ],
                  ),
                ),
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

  Widget _buildToolbarButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, size: 20.sp),
      onPressed: onPressed,
      splashRadius: 20,
      padding: EdgeInsets.all(6.w),
      constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.w),
    );
  }
}
