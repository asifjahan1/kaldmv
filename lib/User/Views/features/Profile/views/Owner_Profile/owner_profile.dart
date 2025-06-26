import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/screens/login_screen.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/User/Views/features/Profile/views/profile_info.dart';
import 'package:kaldmv/User/Views/features/Profile/views/settings.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';
import 'package:kaldmv/core/services/auth_service.dart';

class OwnerProfile extends StatelessWidget {
  final int activePlacesCount;
  final int totalReviewsCount;
  final int totalViewsCount;

  const OwnerProfile({
    super.key,
    this.activePlacesCount = 1,
    this.totalReviewsCount = 5,
    this.totalViewsCount = 3,
  });

  Future<void> logout() async {
    await AuthService.logout();
    Get.find<BottomNavController>().changeIndex(0);
    Get.offAll(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavController nav = Get.find<BottomNavController>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
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
            SizedBox(height: 20.h),
            // Role Display
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Obx(
                () => Text(
                  'Role: ${nav.displayRole}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B0400),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          title: 'Active Places',
                          value: activePlacesCount.toString(),
                          color: Colors.green,
                          progressValue: (activePlacesCount / 10).clamp(
                            0.0,
                            1.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _buildStatCard(
                          title: 'Total Reviews',
                          value: totalReviewsCount.toString(),
                          color: Colors.orange,
                          progressValue: (totalReviewsCount / 10).clamp(
                            0.0,
                            1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildStatCard(
                    title: 'Total Views',
                    value: totalViewsCount.toString(),
                    color: Colors.blue,
                    progressValue: (totalViewsCount / 100).clamp(0.0, 1.0),
                  ),
                  SizedBox(height: 30.h),
                  _buildSectionTitle('Profile'),
                  _buildNavTile(
                    title: 'Edit Profile Information',
                    icon: Icons.edit,
                    onTap: () {
                      nav.changeIndex(3);
                      Get.to(() => ProfileInfo());
                    },
                  ),
                  Divider(color: Color(0xFF01150E).withAlpha(10)),
                  SizedBox(height: 20.h),
                  _buildSectionTitle('Settings'),
                  _buildNavTile(
                    title: 'Settings',
                    icon: Icons.settings,
                    onTap: () {
                      nav.changeIndex(3);
                      Get.to(() => Settings());
                    },
                  ),
                  Divider(color: Color(0xFF01150E).withAlpha(10)),
                  SizedBox(height: 20.h),
                  _buildSectionTitle('More'),
                  _buildNavTile(
                    title: 'About Us',
                    icon: Icons.info_outline,
                    onTap: () {
                      // Add About Us screen navigation
                    },
                  ),
                  Divider(color: Color(0xFF01150E).withAlpha(10)),
                  _buildNavTile(
                    title: 'Privacy Policy',
                    icon: Icons.privacy_tip_outlined,
                    onTap: () {
                      // Add Privacy Policy screen navigation
                    },
                  ),
                  Divider(color: Color(0xFF01150E).withAlpha(10)),
                  SizedBox(height: 10.h),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.red),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                    onTap: () {
                      Get.defaultDialog(
                        title: "Logout",
                        buttonColor: Colors.red,
                        cancelTextColor: Colors.black,
                        middleText: "Are you sure you want to logout?",
                        textConfirm: "Yes",
                        textCancel: "Cancel",
                        confirmTextColor: Colors.white,
                        onConfirm: () async {
                          await logout();
                          Get.back();
                        },
                      );
                    },
                  ),
                  Divider(color: Color(0xFFDE2222).withAlpha(40)),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
    double progressValue = 0.0,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF8EFEE)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 8.h),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey[300],
            color: color,
            minHeight: 8.h,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1B0400),
        ),
      ),
    );
  }

  Widget _buildNavTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, color: Colors.black87),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
      onTap: onTap,
    );
  }
}
