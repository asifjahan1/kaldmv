import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
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
                  _buildListTile(
                    Icons.person_outline,
                    "Edit Profile Information",
                  ),

                  SizedBox(height: 16.h),
                  _buildSectionTitle("Settings"),
                  _buildListTile(Icons.settings_outlined, "Settings"),

                  SizedBox(height: 16.h),
                  _buildSectionTitle("More"),
                  _buildListTile(Icons.info_outline, "About Us"),
                  _buildListTile(Icons.lock_outline, "Privacy Policy"),

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
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
      onTap: () {},
    );
  }
}
