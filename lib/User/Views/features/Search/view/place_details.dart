// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kaldmv/User/Views/features/Search/controller/video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:kaldmv/User/Views/features/Home/controller/tsfs_controller.dart';
import 'package:kaldmv/User/Views/features/Search/model/city_model.dart';
import 'package:kaldmv/core/global_widegts/custom_button.dart';
import '../../../../../core/global_widegts/custom_header.dart';
import '../../Home/views/custom_drawer.dart';
import '../controller/search_controller.dart';

// ignore_for_file: unnecessary_null_comparison

class PlaceDetails extends StatelessWidget {
  final CityModel item;
  PlaceDetails({super.key, required this.item});

  final SearchhController searchController = Get.find<SearchhController>();
  final TSFSController controller = Get.find<TSFSController>();
  final LatLng placeLatLng = const LatLng(21.4858, 39.1925); // Jeddah
  final PageController _pageController = PageController();
  final RxDouble _currentPage = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      _currentPage.value = _pageController.page ?? 0.0;
    });

    return GetBuilder<VideoController>(
      init: VideoController(), // Initialize the controller
      builder: (videoController) {
        return Scaffold(
          drawer: const CustomDrawer(),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(
                    menuIconPath: 'assets/images/menu11.png',
                    logoPath: 'assets/images/logo22.png',
                    backgroundColor: Colors.white,
                    showFilters: searchController.isDefaultView,
                    showSearchBar: searchController.isDefaultView,
                    isAISuggestionPanelVisible: false,
                  ),
                  // Header Image Slider and Bubble Indicator
                  Stack(
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: PageView(
                          controller: _pageController,
                          children: item.imageUrls.isNotEmpty
                              ? item.imageUrls.map((imagePath) {
                                  return Image.asset(
                                    imagePath,
                                    height: 220.h,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Center(
                                              child: Icon(Icons.error),
                                            ),
                                  );
                                }).toList()
                              : [
                                  const Center(
                                    child: Text('No images available'),
                                  ),
                                ],
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 16.w,
                        right: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            item.imageUrls.isNotEmpty
                                ? item.imageUrls.length
                                : 1,
                            (index) {
                              return Obx(() {
                                final isActive =
                                    (_currentPage.value - index).abs() < 0.5;
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                                  width: isActive ? 6.w : 5.w,
                                  height: isActive ? 6.h : 5.h,
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? Colors.white
                                        : Colors.white.withAlpha(80),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        color: const Color(0xFF3F201C),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Container(
                                      height: 1.5.h,
                                      width: 35.w,
                                      color: const Color(0xFFF97C68),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'THINGS TO DO',
                                      style: TextStyle(
                                        color: const Color(0xFF3F201C),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Container(
                                      height: 1.5.h,
                                      width: 90.w,
                                      color: const Color(0xFFF97C68),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    log('Bookmark tapped');
                                  },
                                  child: Image.asset(
                                    'assets/images/bookmark.png',
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                IconButton(
                                  onPressed: () {
                                    log('Share tapped');
                                  },
                                  icon: const Icon(Icons.share),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Souk Al-Zal Traditional\nMarket',
                                  style: TextStyle(fontSize: 24.sp),
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    Image.asset(
                                      'assets/images/checkmark.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Text(
                                  '${item.rating}',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFFEC622),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                const Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.yellow,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '(${item.review} Reviews)',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xFF867B79),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Activity, Hotel, Luxury',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: const Color(0xFF72544F),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        const Divider(color: Color(0xFFEEE5E4)),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildIconColumn(
                                  Icons.connected_tv,
                                  'Air Condition',
                                ),
                                _buildIconColumn(
                                  Icons.car_repair,
                                  'Car Parking',
                                ),
                                _buildIconColumn(
                                  Icons.price_check,
                                  'Cocktails',
                                ),
                                _buildIconColumn(
                                  Icons.sd_card_sharp,
                                  'Credit Cards',
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildIconColumn(
                                  Icons.location_on,
                                  'Non Smoking',
                                ),
                                _buildIconColumn(Icons.star, 'Reservations'),
                                _buildIconColumn(
                                  Icons.price_check,
                                  'Swimming Pool',
                                ),
                                _buildIconColumn(Icons.shopping_bag, 'Wifi'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        const Divider(color: Color(0xFFEEE5E4)),
                        SizedBox(height: 20.h),
                        Text(
                          'About Souk Al-Zal',
                          style: TextStyle(
                            color: const Color(0xFF3F201C),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Souk Al-Zal is located in the Al-Dirah neighborhood in the heart of Riyadh, about 5.4 km from Al-Murabba Historical Palace. It covers an area of 38,000 square meters and is one of Riyadh’s oldest traditional markets. Its alleyways carry 100 years of history.\n\nA historical landmark',
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            color: const Color(0xFF72544F),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Map',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: SizedBox(
                            height: 180.h,
                            width: double.infinity,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: placeLatLng,
                                zoom: 14,
                              ),
                              markers: {
                                Marker(
                                  markerId: const MarkerId('place'),
                                  position: placeLatLng,
                                  infoWindow: const InfoWindow(
                                    title: 'Souk Al-Zal',
                                  ),
                                ),
                              },
                              onMapCreated: (GoogleMapController controller) {
                                log('Map created');
                              },
                              myLocationButtonEnabled: false,
                              zoomControlsEnabled: false,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        _buildContactRow(
                          Icons.location_on,
                          '123 Souk Rd, Al-Balad, Jeddah',
                        ),
                        _buildContactRow(Icons.phone, '+966-123-456-789'),
                        _buildContactRow(Icons.language, 'www.souk-alzal.com'),
                        _buildContactRow(
                          Icons.mail_outline,
                          'info@souk-alzal.com',
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Opening Hours',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        _buildTimeRow('Monday', '10:00 - 13:00'),
                        _buildTimeRow('Tuesday', '10:00 - 13:00'),
                        _buildTimeRow('Wednesday', 'Closed', closed: true),
                        _buildTimeRow('Thursday', '10:00 - 13:00'),
                        _buildTimeRow('Friday', '12:00 - 14:00'),
                        _buildTimeRow('Saturday', '10:30 - 13:30'),
                        _buildTimeRow('Sunday', '10:00 - 13:00'),
                        SizedBox(height: 20.h),
                        Text(
                          'Video',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: YoutubePlayer(
                                controller: videoController.youtubeController,
                                showVideoProgressIndicator: true,
                                onReady: () {
                                  log('YouTube Player is ready');
                                },
                                onEnded: (data) {
                                  videoController.youtubeController.seekTo(
                                    const Duration(seconds: 0),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: 10.h,
                              left: 10.w,
                              child: Text(
                                'Lost in Istanbul | Ramla Terazza | Riyadh',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: const Offset(1, 1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.h,
                              left: 0.w,
                              right: 0.w,
                              bottom: 0.h,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/youtube.png',
                                  height: 22.5.h,
                                  width: 32.w,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5.h,
                              left: 10.w,
                              child: Row(
                                children: [
                                  Text(
                                    'Watch on',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.5),
                                          offset: const Offset(1, 1),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Image.asset(
                                    'assets/images/yt_logo.png',
                                    height: 16.h,
                                    width: 45.34.w,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 5.h,
                              right: 10.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/timer3.png',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                      Text(
                                        'Watch Later',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 8.w),
                                  Column(
                                    children: [
                                      Icon(Icons.share, color: Colors.white),
                                      Text(
                                        'Share',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'FAQs',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        _buildFAQItem(
                          'What are the best local dishes in Jeddah?',
                        ),
                        _buildFAQItem('Is Souk Al-Zal open during Ramadan?'),
                        _buildFAQItem('Are there guided tours available?'),
                        _buildFAQItem('Is it family friendly?'),
                        SizedBox(height: 10.h),
                        const Divider(color: Color(0xFFEEE5E4)),
                        SizedBox(height: 10.h),
                        _buildReviewSection(context),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIconColumn(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 22.sp, color: const Color(0xFF72544F)),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(fontSize: 11.sp, color: const Color(0xFF72544F)),
        ),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String info) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Icon(icon, size: 18.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(info, style: TextStyle(fontSize: 13.5.sp)),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow(String day, String time, {bool closed = false}) {
    return Row(
      children: [
        SizedBox(width: 80.w, child: Text(day)),
        const Text(': '),
        Text(
          time,
          style: TextStyle(
            color: closed ? Colors.red : Colors.black,
            fontWeight: closed ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildFAQItem(String question) {
    return ExpansionTile(
      title: Text(question, style: TextStyle(fontSize: 13.5.sp)),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'The parking options at The Ritz-Carlton Jeddah are: Complimentary On-Site Parking Complimentary Valet Parking',
            style: TextStyle(fontSize: 13.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewSection(BuildContext context) {
    final rating = item.rating != null
        ? item.rating?.toStringAsFixed(1)
        : 'N/A';
    final reviewCount = item.review != null
        ? '(based on ${item.review} ${item.review == 1 ? 'review' : 'reviews'})'
        : '(based on 0 reviews)';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review $rating ★ $reviewCount',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3F201C),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: const Color(0xFFC3C0C0)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildReviewCategory(context, 'Service', 4.25),
                _buildReviewCategory(context, 'Value for money', 4.25),
                _buildReviewCategory(context, 'Location', 4.25),
                _buildReviewCategory(context, 'Cleanliness', 4.25),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildReviewItem(index);
          },
        ),
        SizedBox(height: 20.h),
        _buildWriteReviewSection(context),
      ],
    );
  }

  Widget _buildReviewCategory(
    BuildContext context,
    String category,
    double rating,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Row(
              children: [
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF72544F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () {
                    log('Question tapped for $category');
                  },
                  child: Image.asset(
                    'assets/images/question.png',
                    height: 18.h,
                    width: 18.w,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 8.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: LinearProgressIndicator(
                    value: rating / 5.0,
                    backgroundColor: const Color(0xFFEEE5E4),
                    color: const Color(0xFF00C853),
                    minHeight: 8.h,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                height: 15.h,
                width: 45.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8EFEE),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  rating.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF72544F),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(int index) {
    final reviews = [
      {
        'text':
            'The check-in time at The Ritz-Carlton Jeddah is 3:00 pm and the check-out time is 12:00 pm.',
        'reviewerName': 'David Albani',
        'time': '8 weeks ago',
      },
      {
        'text':
            'The distance from King Abdulaziz International Airport (JED) is located approximately 31.7KM from the hotel.',
        'reviewerName': 'Sarah Khan',
        'time': '7 weeks ago',
      },
      {
        'text':
            'The Ritz-Carlton Jeddah has electric vehicle charging stations.',
        'reviewerName': 'Ahmed Al-Sayed',
        'time': '6 weeks ago',
      },
      {
        'text':
            'The Ritz-Carlton Jeddah has in-room Wi-Fi available to all hotel guests.',
        'reviewerName': 'Laila Mahmoud',
        'time': '5 weeks ago',
      },
      {
        'text':
            'The parking options at The Ritz-Carlton Jeddah are: Complimentary On-Site Parking and Complimentary Valet Parking.',
        'reviewerName': 'Omar Farooq',
        'time': '4 week ago',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const AssetImage('assets/images/reviewer1.png'),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          reviews[index]['reviewerName']!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF3F201C),
                          ),
                        ),
                        Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              Icons.star,
                              size: 16.sp,
                              color: starIndex < 5
                                  ? Color(0xFFFEC622)
                                  : const Color(0xFFEEE5E4),
                            );
                          }),
                        ),
                        SizedBox(width: 30.w),
                      ],
                    ),
                    Text(
                      reviews[index]['time']!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF867B79),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  reviews[index]['text']!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF867B79),
                  ),
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {
                    log('Reply tapped for ${reviews[index]['reviewerName']}');
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/reply.png',
                        color: const Color(0xFF867B79),
                        height: 18.h,
                        width: 18.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Reply',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF867B79),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWriteReviewSection(BuildContext context) {
    // Use GetX's reactive map to store ratings
    final RxMap<String, double> categoryRatings = {
      'Service': 0.0,
      'Value for money': 0.0,
      'Location': 0.0,
      'Cleanliness': 0.0,
    }.obs;

    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEEE5E4)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Write a review',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF867B79),
            ),
          ),
          SizedBox(height: 10.h),
          Obx(
            () => Column(
              children: categoryRatings.entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Row(
                          children: [
                            Text(
                              entry.key,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF72544F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: () {
                                log('Question tapped for ${entry.key}');
                              },
                              child: Image.asset(
                                'assets/images/question.png',
                                height: 18.h,
                                width: 18.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: Icon(
                              Icons.star,
                              size: 20.sp,
                              color: index < entry.value
                                  ? Colors.yellow
                                  : const Color(0xFFD4D4D4),
                            ),
                            onPressed: () {
                              categoryRatings[entry.key] = (index + 1)
                                  .toDouble();
                              log('Rating for ${entry.key}: ${index + 1}');
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10.h),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Write your review...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: () {
              log('Submitted ratings: $categoryRatings');
            },
            text: 'Submit Review',
            backgroundColor: const Color(0xFF23D3D3),
          ),
        ],
      ),
    );
  }
}
