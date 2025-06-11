import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/global_widegts/custom_header.dart';
import '../../Search/controller/search_controller.dart';
import '../controller/tsfs_controller.dart';
import 'custom_drawer.dart';

class TSFSScreen extends StatelessWidget {
  TSFSScreen({super.key});

  final TSFSController controller = Get.find<TSFSController>();
  final SearchhController searchController = Get.find<SearchhController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              final isDefault = searchController.isDefaultView;
              return CustomHeader(
                menuIconPath: 'assets/images/menu11.png',
                logoPath: 'assets/images/logo22.png',
                backgroundColor:
                isDefault ? const Color(0xFFF97C68) : Colors.white,
                showFilters: isDefault,
                showSearchBar: isDefault,
                isAISuggestionPanelVisible: false,
              );
            }),

            Obx(() => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(('Things to do '), style:TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                  Text('(${controller.items.length} results)', style: TextStyle(color: Color(0xFF867B79)),),
                ],
              ),
            )),

            // Wrap ListView.builder in Expanded to avoid unbounded height error
            Obx(() => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    return GestureDetector(
                      onTap: () => controller.onItemTap(index),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: Image.asset(
                                    item.imagePath,
                                    height: 150.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return Container(
                                        height: 150.h,
                                        color: Colors.grey,
                                        child: const Center(
                                            child:
                                            Text('Image not available')),
                                      );
                                    },
                                  ),
                                ),

                                // Top-left image
                                Positioned(
                                  top: 8.h,
                                  left: 8.w,
                                  child: Image.asset(
                                    'assets/images/rest.png',
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                                ),

                                // Top-right icon
                                Positioned(
                                  top: 8.h,
                                  right: 8.w,
                                  child: CircleAvatar(

                                    child: Icon(
                                      Icons.save,
                                      color: Colors.white,
                                      size: 26.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Image.asset('assets/images/closed.png',
                                        height: 28.h,
                                        width: 28.w,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        item.provider,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFF2300),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    item.location,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 16.sp,
                                            color: Colors.yellow[700],
                                          ),
                                          SizedBox(width: 5.w),
                                          Text('${item.rating}',
                                              style:
                                              TextStyle(fontSize: 12.sp)),
                                          Text(
                                            ' (${(index + 0) * 1} Reviews)',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Text('Free', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                      ),
                                      ),
                                    ],
                                  ),
                                  if (item.isClosed)
                                    Text(
                                      'Closed',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.red,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
