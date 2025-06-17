import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadController extends GetxController {
  final RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null && result.files.isNotEmpty) {
      selectedFiles.assignAll(result.files);
    }
  }

  void clearFiles() {
    selectedFiles.clear();
  }
}
