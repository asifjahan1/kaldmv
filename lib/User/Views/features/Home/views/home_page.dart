import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaldmv/core/global_widegts/custom_button.dart';
import '../../../../../core/global_widegts/custom_header.dart';
import '../../../../../core/global_widegts/custom_text_field.dart';
import '../../Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import '../controller/home_controller.dart';
import 'custom_drawer.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header (Dynamic based on showAISuggestionPanel)
              Obx(
                () => CustomHeader(
                  logoPath: 'assets/images/logo111.png',
                  isAISuggestionPanelVisible:
                      controller.showAISuggestionPanel.value,
                ),
              ),
              SizedBox(height: 10.h),
              // AI Suggestion Button (Hidden when panel is visible)
              Obx(() {
                return controller.showAISuggestionPanel.value
                    ? const SizedBox.shrink()
                    : CustomButton(
                      borderRadius: 12.r,
                      backgroundImagePath: 'assets/images/ai_image.png',
                      prefixIconPath: 'assets/images/ai.png',
                      width: screenWidth * 0.9,
                      text: 'Use Advance AI Suggestion',
                      onPressed: () {
                        controller.showAISuggestionPanel.value =
                            !controller.showAISuggestionPanel.value;
                      },
                    );
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
                          CustomTextField(
                            hintTextColor: Colors.grey[500],
                            fillColor: Color(0xFFFFFFFF),
                            textColor: Colors.black,
                            borderSide: BorderSide(color: Color(0xFF867B79)),
                            prefixIconPath: 'assets/images/location.png',
                            hintText: 'Which country to go...',
                            textEditingController: controller.countryController,
                          ),
                          SizedBox(height: 10.h),
                          // City
                          CustomTextField(
                            hintTextColor: Colors.grey[500],
                            fillColor: Color(0xFFFFFFFF),
                            textColor: Colors.black,
                            borderSide: BorderSide(color: Color(0xFF867B79)),
                            prefixIconPath: 'assets/images/location.png',
                            hintText: 'Which city to go...',
                            textEditingController: controller.cityController,
                          ),
                          SizedBox(height: 10.h),

                          // Date
                          CustomTextField(
                            prefixIconPath: 'assets/images/date.png',
                            textEditingController: controller.dateController,
                            fillColor: Color(0xFFFFFFFF),
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
                                controller.dateController.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(pickedDate);
                              }
                            },
                          ),

                          SizedBox(height: 10.h),

                          // Duration Dropdown Row
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Start Time',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  hint: const Text('Start time'),
                                  items:
                                      controller.durationTimes.map((
                                        String time,
                                      ) {
                                        return DropdownMenuItem<String>(
                                          value: time,
                                          child: Text(time),
                                        );
                                      }).toList(),
                                  onChanged: (value) {},
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'End Time',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  hint: const Text('End time'),
                                  items:
                                      controller.durationTimes.map((
                                        String time,
                                      ) {
                                        return DropdownMenuItem<String>(
                                          value: time,
                                          child: Text(time),
                                        );
                                      }).toList(),
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          // Budget Dropdown
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Budget',
                              labelStyle: TextStyle(fontSize: 14.sp),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            hint: const Text('Select your budget range'),
                            items:
                                controller.budgetRanges.map((String budget) {
                                  return DropdownMenuItem<String>(
                                    value: budget,
                                    child: Text(budget),
                                  );
                                }).toList(),
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 10.h),
                          // Group Type
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Group Type',
                              labelStyle: TextStyle(fontSize: 14.sp),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            hint: const Text('Select group type'),
                            items: const [
                              DropdownMenuItem(
                                value: 'Solo',
                                child: Text('Solo'),
                              ),
                              DropdownMenuItem(
                                value: 'Couple',
                                child: Text('Couple'),
                              ),
                              DropdownMenuItem(
                                value: 'Family',
                                child: Text('Family'),
                              ),
                              DropdownMenuItem(
                                value: 'Friends',
                                child: Text('Friends'),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 10.h),
                          // File Upload (Read Only Field)
                          CustomTextField(
                            hintText: 'Click to select image or file',
                            hintTextColor: Colors.grey[500],
                            readOnly: true,
                            onTap: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: [
                                      'jpg',
                                      'png',
                                      'jpeg',
                                      'pdf',
                                      'doc',
                                      'docx',
                                    ],
                                  );

                              if (result != null &&
                                  result.files.single.path != null) {
                                controller.filePathController.text =
                                    result.files.single.name;
                                // Optional: save full path too if needed
                                // final filePath = result.files.single.path!;
                              }
                            },
                            textEditingController:
                                controller.filePathController,
                            fillColor: Colors.white,
                            textColor: Colors.black,
                            borderSide: const BorderSide(
                              color: Color(0xFF867B79),
                            ),
                            fontWeight: FontWeight.w400,
                            obscureText: false,
                            validator: null,
                            prefixIconPath: 'assets/images/attachment.png',
                            // suffixIcon: const Icon(Icons.upload_file),
                          ),
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
                          // Generate Button
                          CustomButton(
                            borderRadius: 12.r,
                            backgroundImagePath: 'assets/images/ai_image.png',
                            prefixIconPath: 'assets/images/ai.png',
                            width: screenWidth * 0.9,
                            text: 'Generate AI Suggestions',
                            onPressed: () {
                              controller.showAISuggestionPanel.value =
                                  !controller.showAISuggestionPanel.value;
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
                        onTap:
                            () => controller.setCategory(
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
                    const Text(
                      'Popular Countries',
                      style: TextStyle(
                        fontSize: 18,
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
                          final BottomNavController nav = Get.find();
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
                                      controller
                                          .popularCountries[index]
                                          .imageUrl,
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
              // Popular Cities
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Cities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
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
                          final BottomNavController nav = Get.find();
                          nav.openSearchScreen('city', index, city.name);
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
            ],
          ),
        ),
      ),
    );
  }
}
