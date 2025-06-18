// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/global_widegts/custom_button.dart';
import '../../../../../core/global_widegts/custom_header.dart';
import '../../Search/controller/search_controller.dart';
import '../controller/tsfs_controller.dart';
import 'custom_drawer.dart';

class TSFSScreen extends StatelessWidget {
  TSFSScreen({super.key});

  final TSFSController controller = Get.find<TSFSController>();
  final SearchhController searchController = Get.find<SearchhController>();

  // Helper function to truncate location to first three words with ellipsis
  String _truncateToThreeWords(String text) {
    final words = text.trim().split(RegExp(r'\s+'));
    if (words.length <= 3) return text;
    return '${words.take(3).join(' ')}...';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
              // backgroundColor: isDefault ? const Color(0xFFF97C68) : Colors.white,
              showFilters: false,
              showSearchBar: false,
              isAISuggestionPanelVisible: false,
            ),
            // Header: Title & Result Count + View Toggle
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Things to do ',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(${controller.filteredItems.length} results)',
                          style: TextStyle(color: Color(0xFF867B79)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            log('grid tapped');
                            controller.toggleView();
                          },
                          child: Image.asset(
                            'assets/images/grid.png',
                            height: 28.h,
                            width: 28.w,
                            color: controller.isGridView.value
                                ? Colors.black
                                : Color(0xFFF97C68),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () {
                            log('grid11 tapped');
                            controller.toggleView();
                          },
                          child: Image.asset(
                            'assets/images/grid11.png',
                            height: 26.h,
                            width: 26.w,
                            color: controller.isGridView.value
                                ? Color(0xFFF97C68)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8.h),

            // Filter and Sort By
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPressed: () {},
                    text: 'Filter',
                    width: screenWidth * 0.3,
                    backgroundColor: Color(0xFFF97C68),
                    textColor: Colors.white,
                    prefixIconPath: 'assets/images/filter.png',
                    centerText: true,
                    prefixIconHeight: 20.h,
                    prefixIconWidth: 20.w,
                  ),
                  Text('Sort By:', style: TextStyle(color: Colors.grey)),
                  Obx(
                    () => CustomButton(
                      text: controller.selectedValue.value,
                      onPressed: () {},
                      width: screenWidth * 0.42,
                      prefixIconPath: 'assets/images/timer.png',
                      centerText: true,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 14.sp,
                      borderRadius: 16.r,
                      borderSide: BorderSide(
                        color: Color(0xFFC3C0C0).withAlpha(100),
                      ),
                      suffixIcon: Transform.rotate(
                        angle: 1.57,
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      ),
                      dropdownItems: controller.dropdownOptions,
                      selectedDropdownValue: controller.selectedValue.value,
                      onDropdownChanged: (val) {
                        if (val != null) controller.filterItems(val);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Main List/Grid
            Obx(
              () => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  child: controller.isGridView.value
                      ? GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: 0.6667,
                              ),
                          itemCount: controller.filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = controller.filteredItems[index];
                            return GestureDetector(
                              onTap: () => controller.onItemTap(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10),
                                          ),
                                          child: AspectRatio(
                                            aspectRatio: 1.5,
                                            child: Image.asset(
                                              item.imagePath,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return Container(
                                                      color: Colors.grey,
                                                      child: const Center(
                                                        child: Text(
                                                          'Image not available',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 8.h,
                                          left: 8.w,
                                          child: Image.asset(
                                            'assets/images/rest.png',
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                        ),
                                        Positioned(
                                          top: 8.h,
                                          right: 8.w,
                                          child: InkWell(
                                            onTap: () {
                                              log('Bookmark Tapped');
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Color(
                                                0xFFFFFFFF,
                                              ).withAlpha(80),
                                              child: Image.asset(
                                                'assets/images/bookmark1.png',
                                                height: 20.h,
                                                width: 20.w,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.subTitle,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Text(
                                              item.title,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/closed.png',
                                                  height: 16.h,
                                                  width: 16.w,
                                                ),
                                                SizedBox(width: 4.w),
                                                Expanded(
                                                  child: Text(
                                                    item.provider,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFFFF2300),
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/location.png',
                                                  height: 14.h,
                                                  width: 14.w,
                                                ),
                                                SizedBox(width: 4.w),
                                                Expanded(
                                                  child: Text(
                                                    _truncateToThreeWords(
                                                      item.location,
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: Colors.grey,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${item.rating}',
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color(
                                                          0xFFFEC622,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    Icon(
                                                      Icons.star,
                                                      size: 12.sp,
                                                      color: Colors.yellow[700],
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Free',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (item.isClosed)
                                              Text(
                                                'Closed',
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.red,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = controller.filteredItems[index];
                            return GestureDetector(
                              onTap: () => controller.onItemTap(index),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 10.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10),
                                          ),
                                          child: Image.asset(
                                            item.imagePath,
                                            height: 150.h,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Container(
                                                    height: 150.h,
                                                    color: Colors.grey,
                                                    child: const Center(
                                                      child: Text(
                                                        'Image not available',
                                                      ),
                                                    ),
                                                  );
                                                },
                                          ),
                                        ),
                                        Positioned(
                                          top: 8.h,
                                          left: 8.w,
                                          child: Image.asset(
                                            'assets/images/rest.png',
                                            height: 30.h,
                                            width: 30.w,
                                          ),
                                        ),
                                        Positioned(
                                          top: 8.h,
                                          right: 8.w,
                                          child: InkWell(
                                            onTap: () {
                                              controller.toggleBookmark(index);
                                              log(
                                                'Bookmark Tapped for ${item.title}, isBookmarked: ${item.isBookmarked}',
                                              );
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Color(
                                                0xFFFFFFFF,
                                              ).withAlpha(80),
                                              child: Image.asset(
                                                item.isBookmarked
                                                    ? 'assets/images/bookmark22.png'
                                                    : 'assets/images/bookmark1.png',
                                                height: 20.h,
                                                width: 20.w,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.subTitle,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            item.title,
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/closed.png',
                                                height: 28.h,
                                                width: 28.w,
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                item.provider,
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFF2300),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/location.png',
                                                height: 22.h,
                                                width: 22.w,
                                              ),
                                              SizedBox(width: 5.w),
                                              Expanded(
                                                child: Text(
                                                  item.location,
                                                  textAlign: TextAlign.start,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${item.rating}',
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFFFEC622),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Icon(
                                                    Icons.star,
                                                    size: 20.sp,
                                                    color: Colors.yellow[700],
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    ' (${(index + 0) * 1} Reviews)',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Free',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (item.isClosed)
                                            Text(
                                              'Closed',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.red,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
