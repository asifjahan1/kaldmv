// import 'dart:developer';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/file_upload_controller.dart';

Widget buildDottedBorderWidget(
  BuildContext context,
  FileUploadController controller,
) {
  final sw = MediaQuery.of(context).size.width;
  final sh = MediaQuery.of(context).size.height;

  final FileUploadController controller = Get.put(FileUploadController());

  // Future<void> pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     allowMultiple: false,
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'jpeg', 'png'],
  //   );

  //   if (result != null && result.files.isNotEmpty) {
  //     final file = result.files.first;
  //     log('Selected File: ${file.name} (${file.size} bytes)');
  //     // TODO: Handle the file (upload/store/etc.)
  //   } else {
  //     log('No file selected');
  //   }
  // }

  return Align(
    alignment: Alignment.center,
    child: GestureDetector(
      onTap: controller.pickFiles,
      child: SizedBox(
        height: sh * 0.25,
        width: sw * 0.88,
        child: DottedBorder(
          // borderType: BorderType.RRect,
          // radius: Radius.circular(8.r),
          // dashPattern: const [10, 5],
          // strokeWidth: 2,
          // color: const Color(0xFF1849D6).withAlpha(80),
          // padding: EdgeInsets.all(8.w),
          child: Obx(() {
            final files = controller.selectedFiles;

            return Align(
              alignment: Alignment.center,
              child: files.isEmpty
                  ? _buildUploadPrompt()
                  : _buildFileDisplay(files, controller),
            );
          }),
        ),
      ),
    ),
  );
}

Widget _buildUploadPrompt() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.cloud_upload_outlined,
        size: 40,
        color: const Color(0xFF1849D6).withAlpha(60),
      ),
      SizedBox(height: 8.h),
      RichText(
        text: TextSpan(
          text: "Drag your file(s) or ",
          style: GoogleFonts.dmSans(
            color: const Color(0xFF0B0B0B),
            fontSize: 15.sp,
          ),
          children: [
            TextSpan(
              text: "browse",
              style: GoogleFonts.dmSans(
                color: const Color(0xFF1849D6).withAlpha(80),
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
      Text(
        "Max 10MB files are allowed",
        style: GoogleFonts.dmSans(
          fontSize: 13.sp,
          color: const Color(0xFF6D6D6D),
        ),
      ),
    ],
  );
}

Widget _buildFileDisplay(List files, FileUploadController controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.insert_drive_file_rounded,
        size: 36,
        color: const Color(0xFF1849D6),
      ),
      SizedBox(height: 10.h),
      ...files.map(
        (file) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            file.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      SizedBox(height: 8.h),
      GestureDetector(
        onTap: controller.clearFiles,
        child: Text(
          "Remove All",
          style: GoogleFonts.dmSans(
            fontSize: 12.sp,
            color: Colors.redAccent,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}
