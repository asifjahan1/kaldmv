import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../User/Views/features/Home/controller/header_controller.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final HeaderController controller = Get.put(HeaderController());

  final bool isAISuggestionPanelVisible;
  final bool showFilters;
  final bool showSearchBar;
  final List<Map<String, dynamic>>? customItems;
  final Color? backgroundColor;
  final String? logoPath;
  final String? menuIconPath;
  final Color? menuIconColor;
  final Function(int index)? onDefaultItemTap;

  CustomHeader({
    super.key,
    this.isAISuggestionPanelVisible = false,
    this.showFilters = true,
    this.showSearchBar = true,
    this.customItems,
    this.backgroundColor,
    this.logoPath,
    this.menuIconPath,
    this.menuIconColor,
    this.onDefaultItemTap,
  });

  final List<Map<String, dynamic>> defaultItems = [
    {'icon': Icons.home_filled, 'text': 'Search All'},
    {'icon': Icons.no_food, 'text': 'Food & Drink'},
    {'icon': Icons.shopping_basket, 'text': 'Shopping'},
    {'icon': Icons.bed, 'text': 'Stay'},
    {'icon': Icons.beach_access, 'text': 'Things To Do'},
  ];

  @override
  Size get preferredSize => Size.fromHeight(
    isAISuggestionPanelVisible ? 60.h : (showFilters || showSearchBar ? 268.h : 100.h),
  );

  @override
  Widget build(BuildContext context) {
    final items = customItems ?? defaultItems;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isAISuggestionPanelVisible ? const Color(0xFF21BABA) : const Color(0xFFF97C68)),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
      ),
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Logo & Menu Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                if (controller.showMenuIcon.value) {
                  return Builder(
                    builder: (context) => GestureDetector(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Image.asset(
                        menuIconPath ?? 'assets/images/menu.png',
                        height: 28.h,
                        width: 28.w,
                        color: menuIconColor,
                      ),
                    ),
                  );
                } else {
                  return SizedBox(width: 28.w);
                }
              }),
              logoPath != null
                  ? Image.asset(
                logoPath!,
                height: 52.6.h,
                width: 146.w,
              )
                  : SizedBox(width: 146.w, height: 52.6.h),
              SizedBox(width: 28.w),
            ],
          ),

          /// Filters & Search Bar (if AI panel is off)
          if (!isAISuggestionPanelVisible) ...[
            if (showFilters) ...[
              SizedBox(height: 20.h),
              Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(items.length, (index) {
                    final isSelected = controller.selectedIndex.value == index;
                    final item = items[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: isSelected
                          ? ElevatedButton(
                        onPressed: () {
                          if (onDefaultItemTap != null) {
                            onDefaultItemTap!(index);
                          } else {
                            controller.selectItem(index);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withAlpha(40),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        ),
                        child: Row(
                          children: [
                            Icon(item['icon'], size: 20.sp, color: Colors.white),
                            SizedBox(width: 6.w),
                            Text(
                              item['text'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                          : GestureDetector(
                        onTap: () {
                          if (onDefaultItemTap != null) {
                            onDefaultItemTap!(index);
                          } else {
                            controller.selectItem(index);
                          }
                        },
                        child: Row(
                          children: [
                            Icon(item['icon'], size: 20.sp, color: Colors.white),
                            SizedBox(width: 6.w),
                            Text(
                              item['text'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )),
              SizedBox(height: 10.h),
            ],

            if (showSearchBar) ...[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Where to go, things to do, hotels...',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.sp,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Container(
                      height: 35.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF97C68),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ],
        ],
      ),
    );
  }
}
