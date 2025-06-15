// tour_plan_screen.dart
// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/home%20widget/ai_generated_tour_plan/controller/tour_plan_controller.dart';
import 'package:kaldmv/User/Views/features/Home/home%20widget/ai_generated_tour_plan/model/tour_plan_model.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';

class TourPlanScreen extends StatelessWidget {
  final Map<String, String>? tourPlanData;

  TourPlanScreen({super.key, this.tourPlanData});

  final TourPlanController controller = Get.put(TourPlanController());

  @override
  Widget build(BuildContext context) {
    // Generate dynamic plan on initialization
    if (tourPlanData != null) {
      controller.generateDynamicPlan(tourPlanData);
    }

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
                child: Obx(() {
                  final tourPlan = controller.tourPlan.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Image
                      Container(
                        height: 200.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/saudi_arabia.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      // Title
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          tourPlan.title,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3F201C),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Region
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          tourPlan.region,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3F201C),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Itinerary Details
                      _buildItinerarySection(tourPlan),
                      SizedBox(height: 20.h),
                      // Daily Schedule
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'Daily Schedule',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B0400),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ...tourPlan.dailySchedules
                          .map(
                            (schedule) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: _buildDailySchedule(schedule),
                            ),
                          )
                          .toList(),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItinerarySection(TourPlan tourPlan) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem(
          tourPlan.destination,
          'assets/images/location.png',
        ),
        _buildDetailItem(
          'Duration : ${tourPlan.duration}',
          'assets/images/timer.png',
        ),
        _buildDetailItem(
          'Accommodation : ${tourPlan.accommodation}',
          'assets/images/bed.png',
        ),
        if (tourPlan.specialConsiderations.isNotEmpty)
          _buildDetailItem(
            'Special Considerations : ${tourPlan.specialConsiderations.join(', ')}',
            'assets/images/info1.png',
          ),
      ],
    );
  }

  Widget _buildDetailItem(String text, String iconPath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: Row(
        children: [
          Image.asset(iconPath, height: 24.h, width: 24.w),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailySchedule(DailySchedule schedule) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${schedule.day}: ${schedule.description}',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'Theme: ${schedule.theme}',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
        SizedBox(height: 10.h),
        // Dynamically render all ScheduleItems
        ...schedule.scheduleItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: _buildScheduleItem(
              item,
              index == schedule.scheduleItems.length - 1,
            ),
          );
        }).toList(),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildScheduleItem(ScheduleItem item, bool isLast) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/pin-outline.png',
              height: 32.h,
              width: 32.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.time,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.activity,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.details,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: Color(0xFFEEE5E4)),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/pin-outline.png',
              height: 32.h,
              width: 32.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.time,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.activity,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.details,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: Color(0xFFEEE5E4)),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/pin-outline.png',
              height: 32.h,
              width: 32.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.time,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.activity,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.details,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: Color(0xFFEEE5E4)),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/pin-outline.png',
              height: 32.h,
              width: 32.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.time,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.activity,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.details,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: Color(0xFFEEE5E4)),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/pin-outline.png',
              height: 32.h,
              width: 32.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.time,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.activity,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.details,
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        if (!isLast) Divider(color: Color(0xFFEEE5E4)),
      ],
    );
  }
}
