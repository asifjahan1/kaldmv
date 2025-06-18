// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/controller/tsfs_controller.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';
import 'package:kaldmv/User/Views/features/Home/model/tsfs_item_model.dart';

class WhishlistScreen extends StatelessWidget {
  const WhishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TSFSController controller = Get.find<TSFSController>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Wishlist',
                        style: TextStyle(
                          color: Color(0xFF1B0400),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Obx(() {
                      if (controller.bookmarkedItems.isEmpty) {
                        return const Center(
                          child: Text(
                            'No items in wishlist',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4B5853),
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.bookmarkedItems.length,
                          itemBuilder: (context, index) {
                            final TSFSItem item =
                                controller.bookmarkedItems[index];
                            return Container(
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
                                                    fontWeight: FontWeight.bold,
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
                                                  ' (${(index + 1)} Reviews)',
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
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
