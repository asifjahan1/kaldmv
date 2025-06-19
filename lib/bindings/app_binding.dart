import 'package:get/get.dart';
import 'package:kaldmv/User/Auth/controller/login_controller.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/drawer_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/header_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/home_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/tsfs_controller.dart';
import 'package:kaldmv/User/Views/features/Search/controller/search_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(SearchhController(), permanent: true);
    Get.put(BottomNavController(), permanent: true);
    Get.put(HeaderController(), permanent: true);
    Get.put(TSFSController(), permanent: true);
    Get.put(DrawerControllerX(), permanent: true);
  }
}
