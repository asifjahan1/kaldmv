import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/app_colors.dart';

// GetX Controller for CustomTextField
class CustomTextFieldController extends GetxController {
  final RxBool isDropdownOpen = false.obs;

  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }

  void closeDropdown() {
    isDropdownOpen.value = false;
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.textEditingController,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.bacgroundColor = const Color(0xFFE9EBF0),
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIconPath,
    this.width,
    this.fillColor,
    this.textColor,
    this.hintTextColor,
    this.borderSide,
    this.readOnly = false,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.height,
    this.isDropdown = false,
    this.dropdownItems,
    this.selectedDropdownValue,
    this.onDropdownChanged,
    this.controllerTag = 'default', // Unique tag for GetX controller
  });

  final String? hintText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final TextEditingController textEditingController;
  final Color? bacgroundColor;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? prefixIconPath;
  final double? height;
  final double? width;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintTextColor;
  final BorderSide? borderSide;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final int? minLines;

  // Dropdown support
  final bool isDropdown;
  final List<String>? dropdownItems;
  final String? selectedDropdownValue;
  final void Function(String?)? onDropdownChanged;
  final String controllerTag;

  @override
  Widget build(BuildContext context) {
    // Initialize GetX controller with unique tag
    final CustomTextFieldController controller = Get.put(
      CustomTextFieldController(),
      tag: controllerTag,
    );

    // Set initial value for dropdown
    if (isDropdown && selectedDropdownValue != null) {
      textEditingController.text = selectedDropdownValue!;
    }

    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      final isOpen = controller.isDropdownOpen.value;

      return SizedBox(
        height: isDropdown && isOpen
            ? (height ?? 40.h) + (dropdownItems?.length ?? 0) * 40.h + 10.h
            : height ?? 40.h,
        width: width ?? screenWidth * 0.9,
        child: isDropdown
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  // TextField acting as dropdown trigger
                  TextFormField(
                    controller: textEditingController,
                    obscureText: obscureText,
                    maxLines: maxLines ?? 1,
                    minLines: minLines,
                    validator: validator,
                    readOnly: true,
                    onTap: () {
                      onTap?.call();
                      controller.toggleDropdown();
                    },
                    style: GoogleFonts.poppins(
                      fontSize: fontSize ?? 16.sp,
                      fontWeight: fontWeight ?? FontWeight.w400,
                      height: lineHeight ?? 24.h / 16.h,
                      color: textColor ?? Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 10.w,
                      ),
                      hintText: hintText,
                      hintStyle: GoogleFonts.poppins(
                        fontSize: fontSize ?? 14.sp,
                        fontWeight: fontWeight ?? FontWeight.w300,
                        height: lineHeight ?? 24.h / 16.h,
                        color: hintTextColor ?? Colors.grey,
                      ),
                      prefixIcon: prefixIconPath != null
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Image.asset(
                                prefixIconPath!,
                                width: 20.w,
                                height: 20.h,
                                fit: BoxFit.contain,
                              ),
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: borderSide ?? BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: borderSide ?? BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: borderSide ?? BorderSide.none,
                      ),
                      suffixIcon: Transform.rotate(
                        angle: isOpen ? 0 : 1.57,
                        child: suffixIcon ??
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: 14.sp,
                            ),
                      ),
                      filled: true,
                      fillColor: fillColor ?? const Color(0xFFFFFFFF),
                    ),
                  ),
                  // Dropdown panel
                  if (isOpen && dropdownItems != null)
                    Positioned(
                      top: (height ?? 40.h) + 5.h,
                      left: 0,
                      right: 0,
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          decoration: BoxDecoration(
                            color: fillColor ?? Colors.white,
                            border: Border.all(
                              color: borderSide?.color ?? Colors.grey,
                              width: borderSide?.width ?? 1,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            children: dropdownItems!.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  textEditingController.text = item;
                                  onDropdownChanged?.call(item);
                                  controller.closeDropdown();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 10.w,
                                  ),
                                  child: Text(
                                    item,
                                    style: GoogleFonts.poppins(
                                      fontSize: fontSize ?? 14.sp,
                                      fontWeight: fontWeight ?? FontWeight.w300,
                                      color: textColor ?? Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                ],
              )
            : TextFormField(
                controller: textEditingController,
                obscureText: obscureText,
                maxLines: maxLines ?? 1,
                minLines: minLines,
                validator: validator,
                readOnly: readOnly,
                onTap: onTap,
                style: GoogleFonts.poppins(
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  height: lineHeight ?? 24.h / 16.h,
                  color: textColor ?? AppColors.whiteColor,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 10.w,
                  ),
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: fontSize ?? 14.sp,
                    fontWeight: fontWeight ?? FontWeight.w300,
                    height: lineHeight ?? 24.h / 16.h,
                    color: hintTextColor ?? Colors.white,
                  ),
                  prefixIcon: prefixIconPath != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Image.asset(
                            prefixIconPath!,
                            width: 20.w,
                            height: 20.h,
                            fit: BoxFit.contain,
                          ),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: borderSide ?? BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: borderSide ?? BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: borderSide ?? BorderSide.none,
                  ),
                  suffixIcon: suffixIcon,
                  filled: true,
                  fillColor: fillColor ?? const Color(0xFFFFFFFF),
                ),
              ),
      );
    });
  }
}
