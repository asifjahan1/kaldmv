// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class AddNewItemScreen extends StatelessWidget {
  const AddNewItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddNewItemController());

    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add new place",
                      style: GoogleFonts.dmSans(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// GENERAL
                    Text(
                      "General",
                      style: GoogleFonts.dmSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    Text(
                      'Place Name*',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
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
                    CustomTextField(
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
                    CustomTextField(
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
                    SizedBox(height: 10.h),
                    _buildCustomQuillField(
                      controller: controller.descriptionController,
                      label: "Description*",
                    ),
                    Text(
                      'Category*',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
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
                    SizedBox(height: 16.h),

                    /// HIGHLIGHTS
                    Text(
                      "Highlights",
                      style: GoogleFonts.dmSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children:
                          [
                                "Air Condition",
                                "Car Parking",
                                "Cocktails",
                                "Credit Cards",
                                "Non Smoking",
                                "Reservations",
                                "Swimming Pool",
                                "WiFi",
                              ]
                              .map(
                                (item) => FilterChip(
                                  label: Text(
                                    item,
                                    style: GoogleFonts.dmSans(fontSize: 12.sp),
                                  ),
                                  selected: false,
                                  onSelected: (_) {},
                                  backgroundColor: Colors.grey[200],
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              )
                              .toList(),
                    ),

                    SizedBox(height: 24.h),
                    Text(
                      "Menu",
                      style: GoogleFonts.dmSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    Text(
                      'Name*',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      textEditingController: controller.menuNameController,
                      hintText: 'Item Name',
                      fillColor: Colors.white,
                      borderSide: BorderSide(
                        color: const Color(0xFF000000).withOpacity(0.3),
                      ),
                      hintTextColor: const Color(0xFFC3C0C0),
                      fontSize: 14.sp,
                      height: 40.h,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Price*',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      textEditingController: controller.itemPriceController,
                      hintText: 'Item Price',
                      fillColor: Colors.white,
                      borderSide: BorderSide(
                        color: const Color(0xFF000000).withOpacity(0.3),
                      ),
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
                    Text(
                      'Type*',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      textEditingController: controller.typeController,
                      hintText: 'Choose type',
                      fillColor: Colors.white,
                      borderSide: BorderSide(
                        color: const Color(0xFF000000).withOpacity(0.3),
                      ),
                      hintTextColor: const Color(0xFFC3C0C0),
                      fontSize: 14.sp,
                      height: 40.h,
                    ),
                    _buildCustomQuillField(
                      controller: controller.menuDescriptionController,
                      label: "Description*",
                    ),

                    SizedBox(height: 16.h),
                    Text(
                      "Item Image*",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cloud_upload_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8.h),
                            RichText(
                              text: TextSpan(
                                text: "Drag your file(s) or ",
                                style: GoogleFonts.dmSans(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "browse",
                                    style: GoogleFonts.dmSans(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Max 10MB files are allowed",
                              style: GoogleFonts.dmSans(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                      // Formatting buttons
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
                          // String? url;

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
