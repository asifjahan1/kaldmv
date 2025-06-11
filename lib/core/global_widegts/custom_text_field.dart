import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/app_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height ?? 40.h,
      width: width ?? screenWidth * 0.9,
      child: isDropdown
          ? DropdownButtonFormField<String>(
        value: selectedDropdownValue,
        onChanged: onDropdownChanged,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
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
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor ?? const Color(0xFFFFFFFF),
        ),
        items: dropdownItems?.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item, style: TextStyle(color: textColor ?? Colors.black)),
          );
        }).toList(),
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
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
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
  }
}
