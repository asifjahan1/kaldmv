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
    TextEditingController textController, {
    Color? dropdownBackgroundColor,
    void Function(String)? onItemSelected,
    List<String>? selectedCheckboxItems,
    void Function(List<String>)? onCheckboxChanged,
    bool isCheckboxDropdown = false,
  }) {
    if (isDropdownOpen.value) {
      closeDropdown();
    } else {
      openDropdown(
        context,
        key,
        items,
        textController,
        dropdownBackgroundColor: dropdownBackgroundColor,
        onItemSelected: onItemSelected,
        selectedCheckboxItems: selectedCheckboxItems,
        onCheckboxChanged: onCheckboxChanged,
        isCheckboxDropdown: isCheckboxDropdown,
      );
    }
  }

  void openDropdown(
    BuildContext context,
    GlobalKey key,
    List<String> items,
    TextEditingController textController, {
    Color? dropdownBackgroundColor,
    void Function(String)? onItemSelected,
    List<String>? selectedCheckboxItems,
    void Function(List<String>)? onCheckboxChanged,
    bool isCheckboxDropdown = false,
  }) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final localSelectedItems = List<String>.from(selectedCheckboxItems ?? []);

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
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: isCheckboxDropdown
                      ? items
                            .map(
                              (item) => StatefulBuilder(
                                builder: (context, setState) {
                                  final isSelected = localSelectedItems
                                      .contains(item);
                                  return CheckboxListTile(
                                    title: Text(
                                      item,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    value: isSelected,
                                    onChanged: (bool? value) {
                                      if (value == true) {
                                        localSelectedItems.add(item);
                                      } else {
                                        localSelectedItems.remove(item);
                                      }
                                      setState(() {}); // Update checkbox UI
                                      onCheckboxChanged?.call(
                                        List.from(localSelectedItems),
                                      );
                                      closeDropdown(); // Auto-close after selection
                                    },
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    dense: true,
                                  );
                                },
                              ),
                            )
                            .toList()
                      : items
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
      overlayEntry = null;
      isDropdownOpen.value = false;
    });
  }

  @override
  void onClose() {
    closeDropdown();
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
    this.isCheckboxDropdown = false,
    this.selectedCheckboxItems,
    this.onCheckboxChanged,
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
  final bool isCheckboxDropdown;
  final List<String>? selectedCheckboxItems;
  final void Function(List<String>)? onCheckboxChanged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomTextFieldController(), tag: controllerTag);
    final GlobalKey textFieldKey = GlobalKey();

    if (isDropdown && selectedDropdownValue != null && !isCheckboxDropdown) {
      textEditingController.text = selectedDropdownValue!;
    }

    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        key: isDropdown || isCheckboxDropdown ? textFieldKey : null,
        controller: textEditingController,
        obscureText: obscureText,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        validator: validator,
        readOnly: isDropdown || isCheckboxDropdown ? true : readOnly,
        onTap: () {
          onTap?.call();
          if ((isDropdown || isCheckboxDropdown) && dropdownItems != null) {
            controller.toggleDropdown(
              context,
              textFieldKey,
              dropdownItems!,
              textEditingController,
              onItemSelected: onDropdownChanged,
              dropdownBackgroundColor: dropdownBackgroundColor,
              selectedCheckboxItems: selectedCheckboxItems ?? [],
              onCheckboxChanged: onCheckboxChanged,
              isCheckboxDropdown: isCheckboxDropdown,
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
          suffixIcon: isDropdown || isCheckboxDropdown
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
              : null,
          filled: true,
          fillColor: fillColor ?? const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
