import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxBool isDropdownOpen = false.obs;
  OverlayEntry? overlayEntry;
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  void toggleDropdown(
    BuildContext context,
    GlobalKey key,
    List<String> items,
    TextEditingController textController,
    void Function(String)? onItemSelected, [
    Color? dropdownBackgroundColor,
  ]) {
    if (isDropdownOpen.value) {
      closeDropdown();
    } else {
      openDropdown(context, key, items, textController, onItemSelected);
    }
  }

  void openDropdown(
    BuildContext context,
    GlobalKey key,
    List<String> items,
    TextEditingController textController,
    void Function(String)? onItemSelected, [
    Color? dropdownBackgroundColor,
  ]) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Material(
          color: dropdownBackgroundColor ?? Colors.white,
          child: ScaleTransition(
            scale: scaleAnimation,
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10.r),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200.h),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: items
                      .map(
                        (item) => GestureDetector(
                          onTap: () {
                            textController.text = item;
                            onItemSelected?.call(item);
                            closeDropdown();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 12.h,
                            ),
                            child: Text(
                              item,
                              style: GoogleFonts.dmSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
    isDropdownOpen.value = true;
    animationController.forward(from: 0);
  }

  void closeDropdown() {
    animationController.reverse().then((_) {
      overlayEntry?.remove();
      isDropdownOpen.value = false;
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
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
    this.controllerTag = 'default',
    this.dropdownBackgroundColor,
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
  final Color? dropdownBackgroundColor;

  final bool isDropdown;
  final List<String>? dropdownItems;
  final String? selectedDropdownValue;
  final void Function(String?)? onDropdownChanged;
  final String controllerTag;

  @override
  Widget build(BuildContext context) {
    // Ensure controller is available
    final controller = Get.put(CustomTextFieldController(), tag: controllerTag);

    if (isDropdown && selectedDropdownValue != null) {
      textEditingController.text = selectedDropdownValue!;
    }

    final GlobalKey textFieldKey = GlobalKey();

    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        key: isDropdown ? textFieldKey : null,
        controller: textEditingController,
        obscureText: obscureText,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        validator: validator,
        readOnly: isDropdown ? true : readOnly,
        onTap: () {
          onTap?.call();
          if (isDropdown && dropdownItems != null) {
            controller.toggleDropdown(
              context,
              textFieldKey,
              dropdownItems!,
              textEditingController,
              onDropdownChanged,
              dropdownBackgroundColor,
            );
          }
        },
        style: GoogleFonts.dmSans(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: lineHeight ?? 24.h / 16.h,
          color: textColor ?? Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          hintText: hintText,
          hintStyle: GoogleFonts.dmSans(
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
          suffixIcon: isDropdown
              ? Obx(
                  () => Transform.rotate(
                    angle: controller.isDropdownOpen.value ? 0 : 1.57,
                    child:
                        suffixIcon ??
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 14.sp,
                        ),
                  ),
                )
              : suffixIcon,
          filled: true,
          fillColor: fillColor ?? const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
