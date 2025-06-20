// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:file_picker/file_picker.dart';

// class FileUploadController extends GetxController {
//   // Holds selected files for this instance
//   final RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;

//   // Status for UI or debugging (idle, loading, success, error)
//   final RxString status = 'idle'.obs;

//   /// Picks image files (jpg/jpeg/png)
//   Future<void> pickFiles() async {
//     try {
//       status.value = 'loading';

//       final result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['jpg', 'jpeg', 'png'],
//       );

//       if (result != null && result.files.isNotEmpty) {
//         selectedFiles.assignAll(result.files);
//         status.value = 'success';

//         // Optional debug log to trace instance uniqueness
//         debugPrint(
//           'Files picked in controller with hash: ${this.hashCode} | Files count: ${selectedFiles.length}',
//         );
//       } else {
//         status.value = 'cancelled';
//       }
//     } catch (e) {
//       status.value = 'error';
//       debugPrint('File picking error in controller ${this.hashCode}: $e');
//     }
//   }

//   /// Clears selected files
//   void clearFiles() {
//     selectedFiles.clear();
//     status.value = 'idle';
//     debugPrint('Files cleared for controller: ${this.hashCode}');
//   }
// }

import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadController extends GetxController {
  final RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      selectedFiles.assignAll(result.files);
    }
  }

  void clearFiles() {
    selectedFiles.clear();
  }
}
