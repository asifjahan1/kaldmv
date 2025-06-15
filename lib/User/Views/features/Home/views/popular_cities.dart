// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/home_controller.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/User/Views/features/Search/controller/search_controller.dart';
import 'package:kaldmv/User/Views/features/Search/model/city_model.dart';
import 'package:kaldmv/User/Views/features/Search/view/place_details.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';

class PopularCities extends StatelessWidget {
  PopularCities({super.key});

  final HomeController controller = Get.find<HomeController>();
  final SearchhController sController = Get.find<SearchhController>();

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Popular Cities',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Obx(() {
                return controller.popularCities.isEmpty
                    ? const Center(
                        child: Text(
                          'No cities available',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : SingleChildScrollView(
                        child: _buildSelectedDetail(context),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedDetail(BuildContext context) {
    final country = sController.selectedCountry.value;

    if (country == null || country.cities.isEmpty) {
      return const Center(
        child: Text(
          'No city data found',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    final double spacing = 12.w;
    final double totalHorizontalPadding = 2 * 20.w + spacing;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: spacing,
            runSpacing: 10.h,
            children: List.generate(country.cities.length, (index) {
              final city = country.cities[index];
              final double cardWidth =
                  (MediaQuery.of(context).size.width - totalHorizontalPadding) /
                  2;

              return SizedBox(
                width: cardWidth,
                child: GestureDetector(
                  onTap: () {
                    sController.selectLocation('city', index);
                    final BottomNavController nav =
                        Get.find<BottomNavController>();
                    nav.customSearchContent.value = PlaceDetails(item: city);
                    nav.changeIndex(1);
                  },
                  child: _buildCityCard(city),
                ),
              );
            }),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildCityCard(CityModel city) {
    final String? imageUrl = city.imageUrls.isNotEmpty
        ? city.imageUrls[0]
        : null;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: imageUrl != null
                ? Image.asset(
                    imageUrl,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180.h,
                      color: Colors.grey,
                      child: const Center(child: Text('Image not available')),
                    ),
                  )
                : Container(
                    height: 180.h,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Center(child: Text('No image')),
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${city.placeCount} Places',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 4.h),
                Text(
                  city.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
