import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/global_widegts/custom_header.dart';
import '../../Home/views/custom_drawer.dart';
import '../controller/search_controller.dart';

class PlaceDetails extends StatelessWidget {
  PlaceDetails({super.key});

  final SearchhController searchController = Get.find<SearchhController>();

  final LatLng placeLatLng = const LatLng(21.4858, 39.1925); // Jeddah

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                final isDefault = searchController.isDefaultView;
                return CustomHeader(
                  menuIconPath: 'assets/images/menu11.png',
                  logoPath: 'assets/images/logo22.png',
                  backgroundColor: Colors.white,
                  showFilters: isDefault,
                  showSearchBar: isDefault,
                  isAISuggestionPanelVisible: false,
                );
              }),
              // Header Image and Title
              Stack(
                children: [
                  Image.asset(
                    'assets/images/saudi_arabia.png',
                    width: double.infinity,
                    height: 220.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10.h,
                    left: 16.w,
                    right: 16.w,
                    child: Text(
                      'Souk Al-Zal Traditional Market',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 6, color: Colors.black45)],
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
                    Text('Historical | Market | Luxury',
                        style: TextStyle(color: Colors.grey[700], fontSize: 13.sp)),
                    SizedBox(height: 10.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildIconColumn(Icons.location_on, 'Jeddah'),
                        _buildIconColumn(Icons.star, '4.5'),
                        _buildIconColumn(Icons.price_check, 'Free'),
                        _buildIconColumn(Icons.shopping_bag, 'Open Market'),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    Text('About Souk Al-Zal',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6.h),
                    Text(
                      'Souk Al-Zal is located in Al-Balad neighborhood. It is one of the top tourist attractions in Saudi Arabia...',
                      style: TextStyle(fontSize: 13.5.sp, color: Colors.black87),
                    ),
                    SizedBox(height: 20.h),

                    // ✅ GOOGLE MAP SECTION
                    Text('Map',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
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
                              infoWindow: const InfoWindow(title: 'Souk Al-Zal'),
                            ),
                          },
                          onMapCreated: (GoogleMapController controller) {},
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Text('Contact',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    _buildContactRow(Icons.location_on, '123 Souk Rd, Al-Balad, Jeddah'),
                    _buildContactRow(Icons.phone, '+966-123-456-789'),
                    _buildContactRow(Icons.language, 'www.souk-alzal.com'),
                    _buildContactRow(Icons.mail_outline, 'info@souk-alzal.com'),

                    SizedBox(height: 20.h),
                    Text('Opening Hours',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    _buildTimeRow('Monday', '10:00 - 13:00'),
                    _buildTimeRow('Tuesday', '10:00 - 13:00'),
                    _buildTimeRow('Wednesday', 'Closed', closed: true),
                    _buildTimeRow('Thursday', '10:00 - 13:00'),
                    _buildTimeRow('Friday', '12:00 - 14:00'),
                    _buildTimeRow('Saturday', '10:30 - 13:30'),
                    _buildTimeRow('Sunday', '10:00 - 13:00'),

                    SizedBox(height: 20.h),
                    Text('Video',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Container(
                      height: 180.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.black12,
                      ),
                      child: Center(child: Icon(Icons.play_circle_fill, size: 50.sp)),
                    ),

                    SizedBox(height: 20.h),
                    Text('FAQs',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    _buildFAQItem('What are the best local dishes in Jeddah?'),
                    _buildFAQItem('Is Souk Al-Zal open during Ramadan?'),
                    _buildFAQItem('Are there guided tours available?'),
                    _buildFAQItem('Is it family friendly?'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 22.sp, color: Colors.black87),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 12.sp)),
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
          Expanded(child: Text(info, style: TextStyle(fontSize: 13.5.sp))),
        ],
      ),
    );
  }

  Widget _buildTimeRow(String day, String time, {bool closed = false}) {
    return Row(
      children: [
        SizedBox(width: 80.w, child: Text(day)),
        Text(': '),
        Text(
          time,
          style: TextStyle(
              color: closed ? Colors.red : Colors.black,
              fontWeight: closed ? FontWeight.bold : FontWeight.normal),
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
            'This is a placeholder answer. You can add real answers later.',
            style: TextStyle(fontSize: 13.sp),
          ),
        ),
      ],
    );
  }
}
