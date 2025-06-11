import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/views/tsfs_screen.dart';
import 'package:kaldmv/core/global_widegts/custom_button.dart';
import '../../Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      backgroundColor: const Color(0xFFF97C68),
      child: SafeArea(
        child: Column(
          children: [
            // Top Row with Image and Cross Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    height: 47.92.h,
                    width: 133.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.close, color: Colors.white, size: 24,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Menu Items
            ...List.generate(6, (index) {
              final menuItems = [
                'Things to do',
                'Food & Drink',
                'Shopping',
                'Stay',
                'Wishlist',
                'My Places'
              ];
              // final menuRoutes = [
              //   ThingsToDoScreen(),
              //   FoodDrinkScreen(),
              //   ShoppingScreen(),
              //   StayScreen(),
              //   WishlistScreen(),
              //   MyPlacesScreen(),
              // ];

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: GestureDetector(
                      onTap: () {
                        log('Tapped on ${menuItems[index]}');
                        Get.back();

                        final bottomNavController = Get.find<BottomNavController>();

                        if (index >= 0 && index <= 3) {
                          bottomNavController.customSearchContent.value = TSFSScreen();
                          bottomNavController.selectedIndex.value = 1;
                        } else {
                          switch (index) {
                            case 4: // Wishlist tab
                              bottomNavController.changeIndex(2);
                              break;
                            case 5: // My Places tab
                              bottomNavController.changeIndex(3);
                              break;
                          }
                        }
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            menuItems[index],
                            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          Transform.rotate(
                            angle: 3.14,
                              child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white, size: 16,)),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),

            const Spacer(),

            // Logout Button

            // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: CustomButton(
                text: 'Log Out',
                onPressed: () {},
                backgroundColor: Colors.transparent,
                prefixIconPath: 'assets/images/logout.png',
                suffixIcon: Transform.rotate(
                    angle: 3.14,
                    child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white, size: 18,),
                ),
                spaceBetweenSuffix: true,
              ),
            ),
            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }
}
