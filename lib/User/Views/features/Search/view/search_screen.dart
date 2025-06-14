import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:kaldmv/User/Views/features/Home/controller/home_controller.dart';
import 'package:kaldmv/User/Views/features/Search/controller/search_controller.dart';
import 'package:kaldmv/User/Views/features/Search/view/place_details.dart';
import '../../../../../core/global_widegts/custom_header.dart';
import '../../Home/controller/header_controller.dart' show HeaderController;
import '../../Home/views/custom_drawer.dart';
import '../model/city_model.dart';

class SearchScreen extends StatelessWidget {
  final String type;
  final int index;
  final String placeName;
  final Widget? customContent;

  SearchScreen({
    super.key,
    required this.type,
    required this.index,
    required this.placeName,
    this.customContent,
  });

  final HomeController homeController = Get.find<HomeController>();
  final SearchhController controller = Get.find<SearchhController>();
  final HeaderController headerController = Get.find<HeaderController>();

  @override
  Widget build(BuildContext context) {
    headerController.toggleMenuIcon(true);

    if (customContent != null) {
      return customContent!;
    }

    if (type.isNotEmpty && index >= 0) {
      controller.selectLocation(type, index);
    }

    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              final isDefault = controller.isDefaultView;
              return CustomHeader(
                menuIconPath: isDefault
                    ? 'assets/images/menu.png'
                    : 'assets/images/menu11.png',
                logoPath: isDefault
                    ? 'assets/images/logo111.png'
                    : 'assets/images/logo22.png',
                backgroundColor:
                isDefault ? const Color(0xFFF97C68) : Colors.white,
                showFilters: isDefault,
                showSearchBar: isDefault,
                isAISuggestionPanelVisible: false,
              );
            }),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(() {
                  return controller.isDefaultView
                      ? _buildDefaultView()
                      : _buildSelectedDetail(context);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocationRow('Cartagena, Colombia'),
          SizedBox(height: 10.h),
          _buildLocationRow('Cartagena, Bolivar, Colombia'),
          SizedBox(height: 10.h),
          _buildLocationRow('Cartagena Province, Bolivar, Colombia'),
        ],
      ),
    );
  }

  Widget _buildLocationRow(String location) {
    return Row(
      children: [
        Image.asset(
          'assets/images/location.png',
          height: 24.h,
          width: 24.w,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            location,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedDetail(BuildContext context) {
    final country = controller.selectedCountry.value!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Image.asset(
            country.headerImage,
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                country.region,
                style: TextStyle(fontSize: 13.sp, color: Color(0xFF72544F)),
              ),
              SizedBox(height: 4.h),
              Text(
                country.name,
                style: TextStyle(
                    fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
              _buildIconRow(Icons.cloud, 'Weather', country.weather),
              _buildIconRow(Icons.attach_money, 'Currency', country.currency),
              _buildIconRow(Icons.language, 'Language', country.language),
              _buildIconRow(Icons.calendar_month, 'Best Time To Visit',
                  country.bestTimeToVisit),
              SizedBox(height: 20.h),
              Text(
                'All Cities (${country.cities.length})',
                style:
                TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: List.generate(country.cities.length, (index) {
              final city = country.cities[index];
              final double cardWidth = (MediaQuery.of(context).size.width - 20.w * 2 - 12.w) / 2;
              return SizedBox(
                width: cardWidth,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => PlaceDetails(item: city));
                  },
                    child: _buildCityCard(city, imageHeight: 180)),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget _buildIconRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: Colors.black87),
          SizedBox(width: 10.w),
          Text(
            '$title: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCityCard(CityModel city, {double imageHeight = 180}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
            child: Image.asset(
              city.imageUrls.first,
              height: imageHeight.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Text section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${city.placeCount} Places',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${city.name}, Saudi Arabia',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
