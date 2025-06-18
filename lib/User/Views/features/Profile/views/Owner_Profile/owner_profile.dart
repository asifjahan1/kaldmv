import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';

/// A widget that displays the profile page for an owner, including stats and navigation options.
/// Only accessible to users with [isOwner] set to true.
class OwnerProfile extends StatelessWidget {
  final bool isOwner;
  final int activePlacesCount;
  final int totalReviewsCount;
  final int totalViewsCount;

  const OwnerProfile({
    super.key,
    required this.isOwner,
    this.activePlacesCount = 0,
    this.totalReviewsCount = 0,
    this.totalViewsCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (!isOwner) {
      return const Scaffold(
        body: Center(child: Text('This page is only accessible to Owners.')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Fixed header
            CustomHeader(
              menuIconPath: 'assets/images/menu11.png',
              logoPath: 'assets/images/logo22.png',
              backgroundColor: Colors.white,
              showFilters: false,
              showSearchBar: false,
              isAISuggestionPanelVisible: false,
            ),
            // Scrollable content
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                children: [
                  // Stats Cards Row 1
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          title: 'Active Places',
                          value: activePlacesCount.toString(),
                          color: Colors.green,
                          showProgress: true,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _buildStatCard(
                          title: 'Total Reviews',
                          value: totalReviewsCount.toString(),
                          color: Colors.amber,
                          showProgress: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // Stats Card Row 2 - Full width
                  _buildStatCard(
                    title: 'Total Views',
                    value: totalViewsCount.toString(),
                    color: Colors.blue,
                    showProgress: true,
                    progressValue: (totalViewsCount / 10).clamp(0.0, 1.0), // Max views = 10
                  ),
                  SizedBox(height: 30.h),
                  // Profile Section
                  _buildSectionTitle('Profile'),
                  _buildNavTile(
                    title: 'Edit Profile Information',
                    icon: Icons.edit,
                    onTap: () {},
                  ),
                  SizedBox(height: 20.h),
                  // Settings Section
                  _buildSectionTitle('Settings'),
                  _buildNavTile(
                    title: 'Settings',
                    icon: Icons.settings,
                    onTap: () {
                      // TODO: Navigate to settings screen
                    },
                  ),
                  SizedBox(height: 20.h),
                  // More Section
                  _buildSectionTitle('More'),
                  _buildNavTile(
                    title: 'About Us',
                    icon: Icons.info_outline,
                    onTap: () {
                      // TODO: Navigate to about us screen
                    },
                  ),
                  _buildNavTile(
                    title: 'Privacy Policy',
                    icon: Icons.privacy_tip_outlined,
                    onTap: () {
                      // TODO: Navigate to privacy policy screen
                    },
                  ),
                  SizedBox(height: 30.h),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.red),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                    onTap: () {
                      // TODO: Implement logout logic (e.g., clear session, navigate to login)
                    },
                  ),
                  SizedBox(height: 16.h), // Bottom padding
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a stat card with a title, value, and optional progress bar.
  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
    bool showProgress = false,
    double progressValue = 0.0,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
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
          if (showProgress) ...[
            SizedBox(height: 8.h),
            LinearProgressIndicator(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10.r),
                  right: Radius.circular(10.r)
              ),
              value: progressValue,
              backgroundColor: Colors.grey[300],
              color: color, // Match progress bar color with stat color
              minHeight: 8.h,
            ),
          ],
        ],
      ),
    );
  }

  /// Builds a section title with consistent styling.
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// Builds a navigation tile with an icon, title, and tap callback.
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
