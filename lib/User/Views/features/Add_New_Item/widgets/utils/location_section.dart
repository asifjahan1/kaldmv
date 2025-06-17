import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class LocationSection extends StatelessWidget {
  final AddNewItemController controller;
  final LatLng placeLatLng;

  const LocationSection({
    super.key,
    required this.controller,
    required this.placeLatLng,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Location',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),
      
          _buildLabel('City/Town*'),
          _buildDropdownField(
            controller.cityController,
            'Select City/Town',
            controller.cityItems,
            controller.selectedCity.value,
                (value) => controller.selectedCity.value = value!,
          ),
      
          _buildLabel('Create New City*'),
          _buildDropdownField(
            controller.cityController,
            'Select City',
            controller.cityItems,
            controller.selectedCity.value,
                (value) => controller.selectedCity.value = value!,
          ),
      
          _buildLabel('Time Zone*'),
          _buildDropdownField(
            controller.timeZoneController,
            'Riyadh',
            controller.cityItems,
            controller.selectedCity.value,
                (value) => controller.selectedCity.value = value!,
          ),
      
          _buildLabel('Place Address*'),
          CustomTextField(
            textEditingController: controller.timeZoneController,
            hintText: 'Full Address',
            fillColor: Colors.white,
            borderSide: BorderSide(color: const Color(0xFF000000).withOpacity(0.3)),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
          ),
          SizedBox(height: 10.h),
      
          // Lock Pin Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabel('Set Location on Map*'),
              Row(
                children: [
                  Icon(Icons.lock, size: 20.sp, color: const Color(0xFF72544F)),
                  SizedBox(width: 5.w),
                  Text(
                    'Lock Pin Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: const Color(0xFF72544F),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5.h),
      
          // Google Map Section
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: SizedBox(
              height: 300.h,
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
                onMapCreated: (GoogleMapController mapController) {
                  log('Map created');
                },
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 5.h),
        ],
      );

  Widget _buildDropdownField(
    TextEditingController textController,
    String hint,
    List<String> items,
    String selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return CustomTextField(
      textEditingController: textController,
      hintText: hint,
      fillColor: Colors.white,
      borderSide: BorderSide(color: const Color(0xFF000000).withOpacity(0.3)),
      hintTextColor: const Color(0xFFC3C0C0),
      fontSize: 14.sp,
      height: 40.h,
      isDropdown: true,
      dropdownItems: items,
      selectedDropdownValue: selectedValue,
      onDropdownChanged: onChanged,
    );
  }
}
