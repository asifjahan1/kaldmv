import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';

class OwnerProfile extends StatelessWidget {
  final bool isOwner;
  final bool isGuest;
  final int activePlacesCount;
  final int totalReviewsCount;
  final int totalViewsCount;

  const OwnerProfile({
    super.key,
    required this.isOwner,
    required this.isGuest,
    this.activePlacesCount = 1,
    this.totalReviewsCount = 5,
    this.totalViewsCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    if (!isOwner) {
      return const Scaffold(
        body: Center(child: Text("This page is only accessible to Owners.")),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            CustomHeader(
              menuIconPath: 'assets/images/menu11.png',
              logoPath: 'assets/images/logo22.png',
              backgroundColor: Colors.white,
              showFilters: false,
              showSearchBar: false,
              isAISuggestionPanelVisible: false,
            ),
            SizedBox(height: 20.h),

            // Stats Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          "Active Places",
                          "$activePlacesCount",
                          Colors.green,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _buildStatCard(
                          "Total Reviews",
                          "$totalReviewsCount",
                          Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: _buildStatCard(
                      "Total Views",
                      "$totalViewsCount",
                      Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Profile Options
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  _buildSectionTitle("Profile"),
                  _buildNavTile("Edit Profile Information", Icons.edit),

                  SizedBox(height: 16.h),
                  _buildSectionTitle("Settings"),
                  _buildNavTile("Settings", Icons.settings),

                  SizedBox(height: 16.h),
                  _buildSectionTitle("More"),
                  _buildNavTile("About Us", Icons.info_outline),
                  _buildNavTile("Privacy Policy", Icons.privacy_tip_outlined),

                  SizedBox(height: 16.h),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.red),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      width: double.infinity, // full width when single
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
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
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildNavTile(String title, IconData icon) {
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
