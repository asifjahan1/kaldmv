// header_controller.dart
import 'package:get/get.dart';

class HeaderController extends GetxController {
  var selectedIndex = 0.obs;
  var showMenuIcon = true.obs;
  RxBool isDefaultView = true.obs;

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  void toggleMenuIcon(bool show) {
    showMenuIcon.value = show;
  }

  void setDefaultView(bool value) {
    isDefaultView.value = value;
  }
}


/*
import 'package:get/get.dart';

class HeaderController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void selectItem(int index) {
    if (index < 0) return;
    selectedIndex.value = index;
  }
}

 */