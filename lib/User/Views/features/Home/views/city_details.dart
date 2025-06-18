// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/controller/tsfs_controller.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/User/Views/features/Search/controller/search_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';
import 'package:kaldmv/User/Views/features/Home/model/tsfs_item_model.dart';

class CityDetails extends StatelessWidget {
  CityDetails({super.key});

  final TSFSController controller = Get.find<TSFSController>();
  final SearchhController sController = Get.find<SearchhController>();

  @override
  Widget build(BuildContext context) {
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
              child: Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSelectedDetail(context),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.filteredItems.length,
                          itemBuilder: (context, index) {
                            final TSFSItem item =
                                controller.filteredItems[index];
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
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedDetail(BuildContext context) {
    final country = sController.selectedCountry.value;
    if (country == null) {
      return const Center(
        child: Text(
          'No country selected',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    final primaryCity = sController.getPrimaryCity(country.name);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Image.asset(
            country.headerImage,
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200.h,
              color: Colors.grey,
              child: const Center(child: Text('Image not available')),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                country.name,
                style: TextStyle(fontSize: 13.sp, color: Color(0xFF72544F)),
              ),
              SizedBox(height: 4.h),
              Text(
                primaryCity,
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
              _buildIconRow(Icons.cloud, 'Weather', country.weather),
              _buildIconRow(Icons.attach_money, 'Currency', country.currency),
              _buildIconRow(Icons.language, 'Language', country.language),
              _buildIconRow(
                Icons.calendar_month,
                'Best Time To Visit',
                country.bestTimeToVisit,
              ),
              SizedBox(height: 10.h),
              Text(
                '$primaryCity (${country.cities.length})', // Use primary city consistently
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: Colors.black87),
          SizedBox(width: 10.w),
          Text(
            '$title: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }
}
