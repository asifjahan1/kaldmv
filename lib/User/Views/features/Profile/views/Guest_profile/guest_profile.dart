import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/screens/login_screen.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/User/Views/features/Profile/views/profile_info.dart';
import 'package:kaldmv/User/Views/features/Profile/views/settings.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
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

            // Profile Options List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  _buildSectionTitle("Profile"),
                  _buildNavTile(
                    title: 'Edit Profile Information',
                    icon: Icons.edit,
                    onTap: () {
                      final BottomNavController nav =
                          Get.find<BottomNavController>();
                      nav.changeIndex(3);
                      Get.to(() => ProfileInfo());
                    },
                  ),
                  Divider(color: Color(0xFF01150E).withAlpha(10)),

                  SizedBox(height: 16.h),
                  _buildSectionTitle("Settings"),
                  _buildNavTile(
                    title: 'Settings',
                    icon: Icons.settings,
                    onTap: () {
                      final BottomNavController nav =
                          Get.find<BottomNavController>();
                      nav.changeIndex(3);
                      Get.to(() => Settings());
                    },
                  ),
                  Divider(color: Color(0xFF01150E).withAlpha(10)),

                  SizedBox(height: 16.h),
                  _buildSectionTitle("More"),
                  _buildNavTile(
                    title: 'About Us',
                    icon: Icons.info_outline,
                    onTap: () {
                      final BottomNavController nav =
                          Get.find<BottomNavController>();
                      nav.changeIndex(3);
                      // Get.to(() => ProfileInfo());
                    },
                  ),
                  Divider(color: Color(0xFF01150E).withAlpha(10)),
                  _buildNavTile(
                    title: 'Privacy Policy',
                    icon: Icons.privacy_tip_outlined,
                    onTap: () {
                      final BottomNavController nav =
                          Get.find<BottomNavController>();
                      nav.changeIndex(3);
                      // Get.to(() => ProfileInfo());
                    },
                  ),
                  Divider(color: Color(0xFF01150E).withAlpha(10)),

                  SizedBox(height: 16.h),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                    onTap: () {
                      Get.offAll(() => LoginScreen());
                      // Example logout dialog trigger:
                      // showCustomDialog(
                      //   context: context,
                      //   icon: Icons.question_mark,
                      //   iconColor: Colors.red,
                      //   title: 'Log Out',
                      //   message: 'Want to log out?',
                      //   buttonText: 'Log Out',
                      //   onButtonPressed: () {
                      //     // logout logic here
                      //   },
                      // );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
          color: Color(0xFF1B0400),
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

//   Widget _buildNavTile(IconData icon, String title, required VoidCallback onTap) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon, color: Colors.black54),
//       title: Text(
//         title,
//         style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//       ),
//       trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
//       onTap: onTap,
//       // onTap: () {
//       //   final BottomNavController nav = Get.find<BottomNavController>();
//       //   nav.changeIndex(3);
//       //   Get.to(() => ProfileInfo());
//       // },
//     );
//   }
// }
