import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Home/home%20widget/ai_generated_tour_plan/view/tour_plan_screen.dart';
import 'package:kaldmv/User/Views/features/Home/views/city_details.dart';
import 'package:kaldmv/User/Views/features/Home/views/popular_cities.dart';
import 'package:kaldmv/core/global_widegts/custom_button.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';
import 'package:kaldmv/User/Views/features/Home/controller/home_controller.dart';
import 'custom_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    Get.put(CustomTextFieldController(), tag: 'start_time_dropdown');
    Get.put(CustomTextFieldController(), tag: 'end_time_dropdown');
    Get.put(CustomTextFieldController(), tag: 'budget_dropdown');
    Get.put(CustomTextFieldController(), tag: 'group_type_dropdown');
  }
  final HomeController controller = Get.put(HomeController());
  final BottomNavController navController = Get.find<BottomNavController>();

  final List<String> startTimeOptions = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
  ];

  final List<String> endTimeOptions = [
    '5:00 PM',
    '6:00 PM',
    '7:00 PM',
    '8:00 PM',
    '9:00 PM',
    '10:00 PM',
    '11:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Role Display
            // Obx(
            //   () => Padding(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 20.w,
            //       vertical: 10.h,
            //     ),
            //     child: Text(
            //       'Logged in as: ${navController.displayRole}',
            //       style: TextStyle(
            //         fontSize: 16.sp,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // Header
            Obx(
              () => CustomHeader(
                logoPath: 'assets/images/logo111.png',
                isAISuggestionPanelVisible:
                    controller.showAISuggestionPanel.value,
              ),
            ),
            SizedBox(height: 10.h),
            // AI Suggestion Button
            Obx(() {
              return !controller.showAISuggestionPanel.value
                  ? CustomButton(
                      borderRadius: 12.r,
                      backgroundImagePath: 'assets/images/ai_image.png',
                      prefixIconPath: 'assets/images/ai.png',
                      width: screenWidth * 0.9,
                      text: 'Use Advance AI Suggestion',
                      onPressed: () {
                        controller.showAISuggestionPanel.value = true;
                      },
                    )
                  : const SizedBox.shrink();
            }),
            // AI Suggestion Panel
            Obx(() {
              return controller.showAISuggestionPanel.value
                  ? Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Explore the world',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          // Country
                          Text(
                            'Country',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hintTextColor: Colors.grey[500],
                            fillColor: Color(0xFFFFFFFF),
                            textColor: Colors.black,
                            borderSide: BorderSide(color: Color(0xFF867B79)),
                            prefixIconPath: 'assets/images/location1.png',
                            hintText: 'Which country to go...',
                            textEditingController: controller.countryController,
                          ),
                          SizedBox(height: 10.h),
                          // City
                          Text(
                            'City',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hintTextColor: Colors.grey[500],
                            fillColor: Color(0xFFFFFFFF),
                            textColor: Colors.black,
                            borderSide: BorderSide(color: Color(0xFF867B79)),
                            prefixIconPath: 'assets/images/location1.png',
                            hintText: 'Which city to go...',
                            textEditingController: controller.cityController,
                          ),
                          SizedBox(height: 10.h),
                          // Start Date
                          Text(
                            'Start Date',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            prefixIconPath: 'assets/images/date.png',
                            textEditingController:
                                controller.startDateController,
                            fillColor: Colors.white,
                            textColor: Colors.black,
                            hintText: 'Select date',
                            hintTextColor: Colors.grey[500],
                            fontSize: 14.sp,
                            borderSide: const BorderSide(
                              color: Color(0xFF867B79),
                            ),
                            readOnly: true,
                            onTap: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                controller.startDateController.text =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                controller.calculateDuration();
                              }
                            },
                          ),
                          SizedBox(height: 10.h),
                          // End Date
                          Text(
                            'End Date',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            prefixIconPath: 'assets/images/date.png',
                            textEditingController: controller.endDateController,
                            fillColor: Colors.white,
                            textColor: Colors.black,
                            hintText: 'Select date',
                            hintTextColor: Colors.grey[500],
                            fontSize: 14.sp,
                            borderSide: const BorderSide(
                              color: Color(0xFF867B79),
                            ),
                            readOnly: true,
                            onTap: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                controller.endDateController.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(pickedDate);
                                controller.calculateDuration();
                              }
                            },
                          ),
                          SizedBox(height: 10.h),
                          // Start Time and End Time Dropdown Row
                          Text(
                            'Duration',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Expanded(
                                child: Obx(
                                  () => CustomTextField(
                                    textEditingController:
                                        controller.startTimeController,
                                    prefixIconPath: 'assets/images/timer1.png',
                                    isDropdown: true,
                                    dropdownBackgroundColor: Colors.white,
                                    dropdownItems: startTimeOptions,
                                    selectedDropdownValue:
                                        controller.startTime.value.isEmpty
                                        ? null
                                        : controller.startTime.value,
                                    onDropdownChanged: (value) {
                                      if (value != null) {
                                        controller.startTime.value = value;
                                      }
                                    },
                                    fillColor: Colors.white,
                                    hintText: 'Start time',
                                    hintTextColor: Colors.grey[500],
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                    controllerTag: 'start_time_dropdown',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Obx(
                                  () => CustomTextField(
                                    textEditingController:
                                        controller.endTimeController,
                                    prefixIconPath: 'assets/images/timer1.png',
                                    isDropdown: true,
                                    dropdownBackgroundColor: Colors.white,
                                    dropdownItems: endTimeOptions,
                                    selectedDropdownValue:
                                        controller.endTime.value.isEmpty
                                        ? null
                                        : controller.endTime.value,
                                    onDropdownChanged: (value) {
                                      if (value != null) {
                                        controller.endTime.value = value;
                                      }
                                    },
                                    fillColor: Colors.white,
                                    hintText: 'End time',
                                    hintTextColor: Colors.grey[500],
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                    controllerTag: 'end_time_dropdown',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          // Budget Dropdown
                          Text(
                            'Budget',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Obx(
                            () => CustomTextField(
                              textEditingController:
                                  controller.budgetController,
                              prefixIconPath: 'assets/images/budget.png',
                              isDropdown: true,
                              dropdownBackgroundColor: Colors.white,
                              dropdownItems: controller.budgetRanges
                                  .map((e) => e['display']!)
                                  .toList(),
                              selectedDropdownValue:
                                  controller.selectedBudget.value.isEmpty
                                  ? null
                                  : controller.selectedBudget.value,
                              onDropdownChanged: (value) {
                                if (value != null) {
                                  controller.selectedBudget.value = value;
                                }
                              },
                              fillColor: Colors.white,
                              hintText: 'Select your budget range',
                              hintTextColor: Colors.grey[500],
                              borderSide: const BorderSide(color: Colors.grey),
                              controllerTag: 'budget_dropdown',
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Group Type
                          Text(
                            'Group Type',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Obx(
                            () => CustomTextField(
                              textEditingController:
                                  controller.groupTypeController,
                              prefixIconPath: 'assets/images/group.png',
                              isDropdown: true,
                              dropdownBackgroundColor: Colors.white,
                              dropdownItems: controller.groupTypes
                                  .map((e) => e['display']!)
                                  .toList(),
                              selectedDropdownValue:
                                  controller.selectedGroupType.value.isEmpty
                                  ? null
                                  : controller.selectedGroupType.value,
                              onDropdownChanged: (value) {
                                if (value != null) {
                                  controller.selectedGroupType.value = value;
                                }
                              },
                              fillColor: Colors.white,
                              hintText: 'Select group type',
                              hintTextColor: Colors.grey[500],
                              borderSide: const BorderSide(color: Colors.grey),
                              controllerTag: 'group_type_dropdown',
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Accomodation
                          Text(
                            'Accomodation',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            dropdownBackgroundColor: Colors.white,
                            prefixIconPath: 'assets/images/bed.png',
                            hintText: 'Select Accomodation Type',
                            hintTextColor: Colors.grey[500],
                            isDropdown: true,
                            fillColor: Colors.white,
                            textColor: Colors.black,
                            borderSide: const BorderSide(
                              color: Color(0xFF867B79),
                            ),
                            textEditingController:
                                controller.accomodationController,
                            dropdownItems: controller.accomodationTypes
                                .map((e) => e['display']!)
                                .toList(),
                            selectedDropdownValue:
                                controller
                                    .selectedAccomodationTypes
                                    .value
                                    .isEmpty
                                ? null
                                : controller.selectedAccomodationTypes.value,
                            onDropdownChanged: (value) {
                              if (value != null) {
                                controller.selectedAccomodationTypes.value =
                                    value;
                              }
                            },
                          ),
                          SizedBox(height: 10.h),
                          // Transportation
                          Text(
                            'Transportation',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            dropdownBackgroundColor: Colors.white,
                            prefixIconPath: 'assets/images/location1.png',
                            hintText: 'Select Transportation',
                            hintTextColor: Colors.grey[500],
                            isDropdown: true,
                            fillColor: Colors.white,
                            textColor: Colors.black,
                            borderSide: const BorderSide(
                              color: Color(0xFF867B79),
                            ),
                            textEditingController:
                                controller.transportationController,
                            dropdownItems: controller.transportationTypes
                                .map((e) => e['display']!)
                                .toList(),
                            selectedDropdownValue:
                                controller
                                    .selectedTransportationTypes
                                    .value
                                    .isEmpty
                                ? null
                                : controller.selectedTransportationTypes.value,
                            onDropdownChanged: (value) {
                              if (value != null) {
                                controller.selectedTransportationTypes.value =
                                    value;
                              }
                            },
                          ),
                          SizedBox(height: 10.h),
                          // Preferences
                          Text(
                            'Preferences',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Obx(() {
                            final _ = controller.selectedPreferenceTypes.length;
                            return CustomTextField(
                              hintText: 'Select Your Preferred Experience',
                              hintTextColor: Colors.grey[500],
                              fillColor: Colors.white,
                              textColor: Colors.black,
                              borderSide: const BorderSide(
                                color: Color(0xFF867B79),
                              ),
                              textEditingController:
                                  controller.preferenceController,
                              prefixIconPath: 'assets/images/attachment.png',
                              isDropdown: true,
                              isCheckboxDropdown: true,
                              dropdownItems: controller.preferenceTypes,
                              selectedCheckboxItems:
                                  controller.selectedPreferenceTypes,
                              onCheckboxChanged: (List<String> selectedItems) {
                                controller.selectedPreferenceTypes.assignAll(
                                  selectedItems,
                                );
                              },
                              dropdownBackgroundColor: Colors.white,
                              fontWeight: FontWeight.w400,
                              obscureText: false,
                              validator: null,
                              controllerTag: 'preference_dropdown',
                            );
                          }),
                          SizedBox(height: 10.h),
                          // Special Requirements
                          Text(
                            'Special Requirements',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            height: 100.h,
                            fillColor: Color(0xFFFFFFFF),
                            textColor: Colors.black,
                            hintTextColor: Colors.grey[500],
                            hintText:
                                'Special Requirements (e.g., vegetarian food options, wheelchair accessible places)',
                            textEditingController:
                                controller.specialRequirementController,
                            borderSide: const BorderSide(
                              color: Color(0xFF867B79),
                            ),
                            fontSize: 13.sp,
                            maxLines: 5,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 10.h),
                          // Generate AI Suggestions Button
                          CustomButton(
                            borderRadius: 12.r,
                            backgroundImagePath: 'assets/images/ai_image.png',
                            prefixIconPath: 'assets/images/ai.png',
                            width: screenWidth * 0.9,
                            text: 'Generate AI Suggestions',
                            onPressed: () {
                              // Validate required fields
                              if (controller.countryController.text.isEmpty ||
                                  controller.cityController.text.isEmpty ||
                                  controller.startDateController.text.isEmpty ||
                                  controller.endDateController.text.isEmpty) {
                                Get.snackbar(
                                  'Error',
                                  'Please fill in all required fields',
                                );
                                return;
                              }

                              final tourPlanData = {
                                'country': controller.countryController.text,
                                'city': controller.cityController.text,
                                'startDate':
                                    controller.startDateController.text,
                                'endDate': controller.endDateController.text,
                                'startTime':
                                    controller.startTimeController.text,
                                'endTime': controller.endTimeController.text,
                                'budget': controller.budgetController.text,
                                'groupType':
                                    controller.groupTypeController.text,
                                'preference': controller.selectedPreferenceTypes
                                    .join(', '),
                                'accomodation':
                                    controller.accomodationController.text,
                                'transportation':
                                    controller.transportationController.text,
                                'specialRequirements': controller
                                    .specialRequirementController
                                    .text,
                              };

                              final BottomNavController nav =
                                  Get.find<BottomNavController>();
                              nav.customSearchContent.value = TourPlanScreen(
                                tourPlanData: tourPlanData,
                              );
                              nav.changeIndex(1);
                              controller.showAISuggestionPanel.value = false;
                              controller.generateItinerary();
                            },
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink();
            }),
            SizedBox(height: 20.h),
            // Categories
            SizedBox(
              height: (controller.categories.length / 3).ceil() * 100.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () => controller.setCategory(
                        controller.categories[index].name,
                      ),
                      child: Container(
                        height: 100.h,
                        width: 100.w,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color:
                              controller.selectedCategory.value ==
                                  controller.categories[index].name
                              ? const Color(0xFF21BABA)
                              : const Color(0xFFCCC3C2).withAlpha(20),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              controller.categories[index].imageUrl,
                              height: 54.h,
                              width: 54.w,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                );
                              },
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              controller.categories[index].name,
                              style: TextStyle(
                                color:
                                    controller.selectedCategory.value ==
                                        controller.categories[index].name
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            // Popular Countries
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Countries',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                height: 150.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10.w),
                  itemCount: controller.popularCountries.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        final BottomNavController nav =
                            Get.find<BottomNavController>();
                        final country = controller.popularCountries[index];
                        nav.openSearchScreen('country', index, country.name);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        width: 150.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    controller.popularCountries[index].imageUrl,
                                    height: 140.h,
                                    width: 180.w,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 5.h,
                                    left: 8.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .popularCountries[index]
                                              .name,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 2,
                                                color: Colors.black.withAlpha(
                                                  70,
                                                ),
                                                offset: Offset(1, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '${controller.popularCountries[index].placeCount} Places',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 2,
                                                color: Colors.black.withAlpha(
                                                  70,
                                                ),
                                                offset: Offset(1, 1),
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
                            SizedBox(height: 5.h),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // Popular Cities
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Cities',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final BottomNavController nav =
                          Get.find<BottomNavController>();
                      nav.openSearchScreen('city', -1, '');
                      nav.customSearchContent.value = PopularCities();
                      nav.changeIndex(1);
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(color: Color(0xFFF97C68)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10.w),
                  itemCount: controller.popularCities.length,
                  itemBuilder: (context, index) {
                    final city = controller.popularCities[index];
                    return GestureDetector(
                      onTap: () {
                        final BottomNavController nav =
                            Get.find<BottomNavController>();
                        nav.openSearchScreen('city', -1, '');
                        nav.customSearchContent.value = CityDetails();
                        nav.changeIndex(1);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        width: 150.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                city.imageUrl,
                                height: 150.h,
                                width: 150.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '${city.placeCount} Places',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Text(
                              city.name,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
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
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
