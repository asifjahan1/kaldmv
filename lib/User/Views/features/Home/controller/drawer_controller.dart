// drawer_controller.dart
import 'package:get/get.dart';

class DrawerControllerX extends GetxController {
  RxBool showDrawer = false.obs;

  void toggleDrawer() {
    showDrawer.value = !showDrawer.value;
  }

  void closeDrawer() {
    showDrawer.value = false;
  }
}
