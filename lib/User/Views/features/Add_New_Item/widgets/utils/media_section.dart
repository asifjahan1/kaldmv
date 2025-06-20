// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
// import 'package:kaldmv/User/Views/features/Add_New_Item/controller/file_upload_controller.dart';
// import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/dotted_builder_widget.dart';
// import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

// class MediaSection extends StatelessWidget {
//   final AddNewItemController controller;

//   const MediaSection({
//     super.key,
//     required this.controller, required Widget Function(BuildContext context, FileUploadController controller) buildDottedBorderWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final featuredImageController =
//         Get.put(FileUploadController(), tag: 'featured_image');
//     final galleryImageController =
//         Get.put(FileUploadController(), tag: 'gallery_image');

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 10.h),
//           Text(
//             'Media',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
//           ),
//           SizedBox(height: 10.h),

//           Text('Featured image', style: _labelStyle()),
//           SizedBox(height: 10.h),
//           buildDottedBorderWidget(context, featuredImageController),
//           SizedBox(height: 10.h),

//           Text('Gallery images*', style: _labelStyle()),
//           SizedBox(height: 10.h),
//           buildDottedBorderWidget(context, galleryImageController),
//           SizedBox(height: 10.h),

//           Text('Video', style: _labelStyle()),
//           SizedBox(height: 5.h),
//           CustomTextField(
//             textEditingController: controller.videoController,
//             hintText: 'Youtube Video URL',
//             textColor: Colors.black,
//             fillColor: Colors.white,
//             borderSide: BorderSide(
//               color: const Color(0xFF000000).withOpacity(0.3),
//             ),
//             hintTextColor: const Color(0xFFC3C0C0),
//             fontSize: 14.sp,
//             height: 40.h,
//           ),
//         ],
//       ),
//     );
//   }

//   TextStyle _labelStyle() {
//     return TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp);
//   }

// }

// new
// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/file_upload_controller.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/dotted_builder_widget.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class MediaSection extends StatelessWidget {
  final AddNewItemController controller;

  const MediaSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Create unique controller instances for each image section
    Get.create<FileUploadController>(
      () => FileUploadController(),
      tag: 'featured_image',
    );
    Get.create<FileUploadController>(
      () => FileUploadController(),
      tag: 'gallery_image',
    );

    // Retrieve those instances with tags
    final featuredImageController = Get.find<FileUploadController>(
      tag: 'featured_image',
    );
    final galleryImageController = Get.find<FileUploadController>(
      tag: 'gallery_image',
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Media',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),

          Text('Featured image', style: _labelStyle()),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 130.w),
            child: buildDottedBorderWidget(context, featuredImageController),
          ),
          SizedBox(height: 10.h),

          Text('Gallery images*', style: _labelStyle()),
          SizedBox(height: 10.h),
          buildDottedBorderWidget(context, galleryImageController),
          SizedBox(height: 10.h),

          Text('Video', style: _labelStyle()),
          SizedBox(height: 5.h),
          CustomTextField(
            textEditingController: controller.videoController,
            hintText: 'Youtube Video URL',
            textColor: Colors.black,
            fillColor: Colors.white,
            borderSide: BorderSide(
              color: const Color(0xFF000000).withOpacity(0.3),
            ),
            hintTextColor: const Color(0xFFC3C0C0),
            fontSize: 14.sp,
            height: 40.h,
          ),
        ],
      ),
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp);
  }
}
