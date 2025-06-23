import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/controller/login_controller.dart';
import 'package:kaldmv/User/Auth/controller/signup_controller.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/file_upload_controller.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/drawer_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/header_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/home_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/tsfs_controller.dart';
import 'package:kaldmv/User/Views/features/Profile/controller/profile_controller.dart';
import 'package:kaldmv/User/Views/features/Search/controller/search_controller.dart';
import 'package:kaldmv/User/Views/features/Search/controller/video_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(AddNewItemController(), permanent: true);
    Get.put(VideoController(), permanent: true);
    Get.put(SignupController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(HeaderController(), permanent: true);
    Get.put(HeaderController(), permanent: true);
    Get.put(SearchhController(), permanent: true);
    Get.put(BottomNavController(), permanent: true);
    Get.put(HeaderController(), permanent: true);
    Get.put(TSFSController(), permanent: true);
    Get.put(DrawerControllerX(), permanent: true);
    Get.put(CustomTextFieldController(), permanent: true);

    final featuredImageController = Get.create<FileUploadController>(
      () => FileUploadController(),
      tag: 'featured_image',
    );

    final galleryImageController = Get.create<FileUploadController>(
      () => FileUploadController(),
      tag: 'gallery_image',
    );
  }
}
