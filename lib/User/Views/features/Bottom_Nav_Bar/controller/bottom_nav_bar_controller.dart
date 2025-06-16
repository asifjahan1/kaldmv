import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/view/add_new_item_screen.dart';
import 'package:kaldmv/User/Views/features/Home/views/home_page.dart';
import 'package:kaldmv/User/Views/features/Search/view/search_screen.dart';
import '../../Home/views/tsfs_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  var searchType = ''.obs;
  var searchIndex = 0.obs;
  var searchPlaceName = ''.obs;

  static const int addItemScreenIndex = 4;

  var customSearchContent = Rx<Widget?>(null);
  var customTab2Content = Rxn<Widget>();

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void openSearchScreen(String type, int index, String name) {
    searchType.value = type;
    searchIndex.value = index;
    searchPlaceName.value = name;
    customSearchContent.value = null;
    selectedIndex.value = 1;
  }

  void openTSFSScreen() {
    customSearchContent.value = TSFSScreen();
    selectedIndex.value = 1;
  }

  void openTSFSScreenInTab2() {
    customTab2Content.value = TSFSScreen();
    selectedIndex.value = 2;
  }

  Widget get currentScreen {
    switch (selectedIndex.value) {
      case 0:
        return HomePage();
      case 1:
        return SearchScreen(
          type: searchType.value,
          index: searchIndex.value,
          placeName: searchPlaceName.value,
          customContent: customSearchContent.value,
        );
      case 2:
        return customTab2Content.value ??
            const Center(
              child: Text('Wishlist', style: TextStyle(color: Colors.black)),
            );
      case 3:
        return const Center(
          child: Text('Profile', style: TextStyle(color: Colors.black)),
        );
      case addItemScreenIndex:
        return AddNewItemScreen();
      default:
        return HomePage();
    }
  }
}
