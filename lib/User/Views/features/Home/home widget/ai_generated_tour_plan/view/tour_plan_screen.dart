// // this is before API
// // tour_plan_screen.dart
// // ignore_for_file: unnecessary_to_list_in_spreads

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:kaldmv/User/Views/features/Home/home%20widget/ai_generated_tour_plan/controller/tour_plan_controller.dart';
// import 'package:kaldmv/User/Views/features/Home/home%20widget/ai_generated_tour_plan/model/tour_plan_model.dart';
// import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
// import 'package:kaldmv/core/global_widegts/custom_header.dart';

// class TourPlanScreen extends StatelessWidget {
//   final Map<String, String>? tourPlanData;

//   TourPlanScreen({super.key, this.tourPlanData});

//   final TourPlanController controller = Get.put(TourPlanController());

//   @override
//   Widget build(BuildContext context) {
//     // Generate dynamic plan on initialization
//     if (tourPlanData != null) {
//       controller.generateDynamicPlan(tourPlanData);
//     }

//     return Scaffold(
//       drawer: const CustomDrawer(),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             CustomHeader(
//               menuIconPath: 'assets/images/menu11.png',
//               logoPath: 'assets/images/logo22.png',
//               backgroundColor: Colors.white,
//               showFilters: false,
//               showSearchBar: false,
//               isAISuggestionPanelVisible: false,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Obx(() {
//                   final tourPlan = controller.tourPlan.value;
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Header Image
//                       Container(
//                         height: 200.h,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/images/saudi_arabia.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10.h),

//                       // Title
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16.w),
//                         child: Text(
//                           tourPlan.title,
//                           style: TextStyle(
//                             fontSize: 24.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF3F201C),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       // Region
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16.w),
//                         child: Text(
//                           tourPlan.region,
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF3F201C),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       // Itinerary Details
//                       _buildItinerarySection(tourPlan),
//                       SizedBox(height: 20.h),
//                       // Daily Schedule
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16.w),
//                         child: Text(
//                           'Daily Schedule',
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF1B0400),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       ...tourPlan.dailySchedules
//                           .map(
//                             (schedule) => Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 16.w),
//                               child: _buildDailySchedule(schedule),
//                             ),
//                           )
//                           .toList(),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildItinerarySection(TourPlan tourPlan) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildDetailItem(
//           'Destination: ${tourPlan.destination}',
//           'assets/images/location.png',
//         ),
//         _buildDetailItem(
//           'Duration : ${tourPlan.duration}',
//           'assets/images/timer.png',
//         ),
//         _buildDetailItem(
//           'Accommodation : ${tourPlan.accommodation}',
//           'assets/images/bed.png',
//         ),
//         if (tourPlan.specialConsiderations.isNotEmpty)
//           _buildDetailItem(
//             'Special Considerations : ${tourPlan.specialConsiderations.join(', ')}',
//             'assets/images/info1.png',
//           ),
//       ],
//     );
//   }

//   Widget _buildDetailItem(String text, String iconPath) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Image.asset(iconPath, height: 24.h, width: 24.w),
//           SizedBox(width: 8.w),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 14.sp, color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDailySchedule(DailySchedule schedule) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '${schedule.day}: ${schedule.description}',
//           style: TextStyle(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(height: 5.h),

//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: 'Theme: ',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF72544F),
//                 ),
//               ),
//               TextSpan(
//                 text: schedule.theme,
//                 style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//               ),
//             ],
//           ),
//         ),

//         // Text(
//         //   'Theme: ${schedule.theme}',
//         //   style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//         // ),
//         SizedBox(height: 10.h),
//         // Dynamically render all ScheduleItems
//         ...schedule.scheduleItems.asMap().entries.map((entry) {
//           final index = entry.key;
//           final item = entry.value;
//           return Padding(
//             padding: EdgeInsets.symmetric(vertical: 4.h),
//             child: _buildScheduleItem(
//               item,
//               index == schedule.scheduleItems.length - 1,
//             ),
//           );
//         }).toList(),
//         SizedBox(height: 20.h),
//       ],
//     );
//   }

//   Widget _buildScheduleItem(ScheduleItem item, bool isLast) {
//     return Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               'assets/images/pin-outline.png',
//               height: 32.h,
//               width: 32.w,
//             ),
//             SizedBox(width: 8.w),
//             Expanded(
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Time: ',
//                               style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF72544F),
//                               ),
//                             ),
//                             TextSpan(
//                               text: item.time,
//                               style: TextStyle(
//                                 fontSize: 14.sp,
//                                 color: Color(0xFF72544F),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       // Text(
//                       //   item.time,
//                       //   style: TextStyle(
//                       //     fontSize: 14.sp,
//                       //     fontWeight: FontWeight.bold,
//                       //     color: Colors.black,
//                       //   ),
//                       // ),
//                       SizedBox(height: 2.h),
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Activity: ',
//                               style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF72544F),
//                               ),
//                             ),
//                             TextSpan(
//                               text: item.activity,
//                               style: TextStyle(
//                                 fontSize: 14.sp,
//                                 color: Color(0xFF72544F),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Text(
//                       //   item.activity,
//                       //   style: TextStyle(fontSize: 14.sp, color: Colors.black),
//                       // ),
//                       SizedBox(height: 2.h),
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Details: ',
//                               style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF72544F),
//                               ),
//                             ),
//                             TextSpan(
//                               text: item.details,
//                               style: TextStyle(
//                                 fontSize: 14.sp,
//                                 color: Color(0xFF72544F),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Text(
//                       //   item.details,
//                       //   style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//                       // ),
//                       SizedBox(height: 10.h),
//                       Divider(color: Color(0xFFEEE5E4)),
//                       SizedBox(height: 10.h),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               'assets/images/pin-outline.png',
//               height: 32.h,
//               width: 32.w,
//             ),
//             SizedBox(width: 8.w),
//             Expanded(
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         item.time,
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         item.activity,
//                         style: TextStyle(fontSize: 14.sp, color: Colors.black),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         item.details,
//                         style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//                       ),
//                       SizedBox(height: 10.h),
//                       Divider(color: Color(0xFFEEE5E4)),
//                       SizedBox(height: 10.h),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               'assets/images/pin-outline.png',
//               height: 32.h,
//               width: 32.w,
//             ),
//             SizedBox(width: 8.w),
//             Expanded(
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         item.time,
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         item.activity,
//                         style: TextStyle(fontSize: 14.sp, color: Colors.black),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         item.details,
//                         style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//                       ),
//                       SizedBox(height: 10.h),
//                       Divider(color: Color(0xFFEEE5E4)),
//                       SizedBox(height: 10.h),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               'assets/images/pin-outline.png',
//               height: 32.h,
//               width: 32.w,
//             ),
//             SizedBox(width: 8.w),
//             Expanded(
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         item.time,
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         item.activity,
//                         style: TextStyle(fontSize: 14.sp, color: Colors.black),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         item.details,
//                         style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//                       ),
//                       SizedBox(height: 10.h),
//                       Divider(color: Color(0xFFEEE5E4)),
//                       SizedBox(height: 10.h),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               'assets/images/pin-outline.png',
//               height: 32.h,
//               width: 32.w,
//             ),
//             SizedBox(width: 8.w),
//             Expanded(
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         item.time,
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         item.activity,
//                         style: TextStyle(fontSize: 14.sp, color: Colors.black),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         item.details,
//                         style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10.h),
//         if (!isLast) Divider(color: Color(0xFFEEE5E4)),
//       ],
//     );
//   }
// }

// this code is for the after API integration
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
                child: Column(
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
                        controller.tourPlan.value.title,
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
                        controller.tourPlan.value.region,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F201C),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Itinerary Details
                    _buildItinerarySection(),
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
                    Obx(() {
                      final tourPlan = controller.tourPlan.value;
                      int days = _parseDaysFromDuration(tourPlan.duration);
                      return Column(
                        children: List.generate(days, (index) {
                          final dayNumber = index + 1;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: _buildDailySchedule(
                              tourPlan.dailySchedules.length > index
                                  ? tourPlan.dailySchedules[index]
                                  : DailySchedule(
                                      day: 'Day $dayNumber',
                                      description: 'Default Exploration',
                                      theme: dayNumber == 1
                                          ? 'Arrival & Exploration'
                                          : dayNumber == days
                                          ? 'Departure & Reflection'
                                          : 'Day $dayNumber Activities',
                                      scheduleItems: [
                                        ScheduleItem(
                                          time: dayNumber == 1
                                              ? '14:00'
                                              : dayNumber == days
                                              ? '10:00'
                                              : '14:00-14:30',
                                          activity: dayNumber == 1
                                              ? 'Airport Arrival'
                                              : dayNumber == days
                                              ? 'Departure'
                                              : 'Activity $dayNumber',
                                          details: dayNumber == 1
                                              ? 'VIP Meet & Greet at Airport\nPrivate car transfer to hotel (30 min)'
                                              : dayNumber == days
                                              ? 'Check-out and transfer to airport'
                                              : 'Explore local landmarks',
                                        ),
                                      ],
                                    ),
                              dayNumber,
                            ),
                          );
                        }),
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

  int _parseDaysFromDuration(String duration) {
    final RegExp regExp = RegExp(r'(\d+)\s*Day');
    final Match? match = regExp.firstMatch(duration);
    if (match != null && match.groupCount >= 1) {
      return int.tryParse(match.group(1) ?? '1') ?? 1;
    }
    return 1;
  }

  Widget _buildItinerarySection() {
    return Obx(() {
      final tourPlan = controller.tourPlan.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem(
            'Destination: ${tourPlan.destination}',
            'assets/images/location.png',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/timer.png',
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Duration:',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    tourPlan.duration.isEmpty
                        ? 'Please select start and end dates'
                        : tourPlan.duration,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: tourPlan.duration.contains('Invalid')
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildDetailItem(
            'Accommodation: ${tourPlan.accommodation}',
            'assets/images/bed.png',
          ),
          if (tourPlan.specialConsiderations.isNotEmpty)
            _buildDetailItem(
              'Special Considerations: ${tourPlan.specialConsiderations.join(', ')}',
              'assets/images/info1.png',
            ),
        ],
      );
    });
  }

  Widget _buildDetailItem(String text, String iconPath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(iconPath, height: 24.h, width: 24.w),
          SizedBox(width: 8.w),
          // Text(
          //   'Duration:',
          //   style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp, color: Color(0xFF72544F)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailySchedule(DailySchedule schedule, int dayNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Day $dayNumber: ${schedule.description}',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Theme: ',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF72544F),
                ),
              ),
              TextSpan(
                text: schedule.theme,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        // Dynamically render all ScheduleItems with numbered icons
        ...schedule.scheduleItems.asMap().entries.map((entry) {
          final index = entry.key + 1;
          final item = entry.value;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFEEE5E4), width: 1),
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Color(0xFFF97C68),
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Time: ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF72544F),
                                ),
                              ),
                              TextSpan(
                                text: item.time,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFF72544F),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Activity: ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF72544F),
                                ),
                              ),
                              TextSpan(
                                text: item.activity,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFF72544F),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Details: ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF72544F),
                                ),
                              ),
                              TextSpan(
                                text: item.details,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFF72544F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
