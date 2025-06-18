import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/bottom_nav_bar_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.search,
    Icons.bookmark_outline,
    Icons.person_outline,
  ];

  final List<String> labels = ["Home", "Search", "Wishlist", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentScreen),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
            () => Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              // Background color with rounded corners at the top
              Positioned(
                top: 0.h,
                left: 0.w,
                right: 0.w,
                height: (100.h / 3),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5FAF8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                ),
              ),

              // Navigation icons and labels
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(icons.length, (index) {
                    return GestureDetector(
                      onTap: () => controller.changeIndex(index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icons[index],
                            color: controller.selectedIndex.value == index
                                ? const Color(0xFFF97C68)
                                : const Color(0xFF867B79),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            labels[index],
                            style: TextStyle(
                              color: controller.selectedIndex.value == index
                                  ? Colors.redAccent
                                  : const Color(0xFF867B79),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              // Floating Action Button in the center
              Positioned(
                top: 10.h,
                left: MediaQuery.of(context).size.width / 2 - 28,
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFFF97C68),
                  onPressed: () {
                    log("Central action tapped!");
                    controller.changeIndex(
                      BottomNavController.addItemScreenIndex,
                    );
                  },
                  shape: const CircleBorder(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: const Icon(Icons.add, size: 30, color: Colors.white),
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
