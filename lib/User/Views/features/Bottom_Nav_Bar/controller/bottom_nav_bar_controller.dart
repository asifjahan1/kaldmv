import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/view/add_new_item_screen.dart';
import 'package:kaldmv/User/Views/features/Home/views/home_page.dart';
import 'package:kaldmv/User/Views/features/Profile/views/Guest_profile/guest_profile.dart';
import 'package:kaldmv/User/Views/features/Profile/views/Owner_Profile/owner_profile.dart';
import 'package:kaldmv/User/Views/features/Search/view/search_screen.dart';
import 'package:kaldmv/User/Views/features/Whishlist/views/whishlist_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Home/views/tsfs_screen.dart';

class BottomNavController extends GetxController {
  // Selected index for bottom navigation
  var selectedIndex = 0.obs;

  // Search related reactive variables
  var searchType = ''.obs;
  var searchIndex = 0.obs;
  var searchPlaceName = ''.obs;

  // Role stored as reactive variable (default to 'guest')
  var storedRole = 'guest'.obs;

  // Index for the "Add New Item" screen for easy reference
  static const int addItemScreenIndex = 4;

  // Custom content widgets for specific tabs (optional dynamic content)
  var customSearchContent = Rx<Widget?>(null);
  var customTab2Content = Rxn<Widget>();

  @override
  void onInit() {
    super.onInit();
    loadRole();
  }

  Future<void> loadRole() async {
    final prefs = await SharedPreferences.getInstance();
    storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'guest';
    debugPrint('Loaded user role: ${storedRole.value}');
  }

  Widget getProfileScreen() {
    if (storedRole.value == 'owner') {
      return OwnerProfile(isOwner: true);
    } else if (storedRole.value == 'guest') {
      return GuestProfile();
    } else {
      return Center(child: Text('Error: Invalid user role'));
    }
  }

  /// Change selected bottom nav index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  /// Open Search Screen with specific parameters and select Search tab (index 1)
  void openSearchScreen(String type, int index, String name) {
    searchType.value = type;
    searchIndex.value = index;
    searchPlaceName.value = name;
    customSearchContent.value = null; // reset custom content
    selectedIndex.value = 1;
  }

  /// Open TSFSScreen inside Search tab (tab index 1)
  void openTSFSScreen() {
    customSearchContent.value = TSFSScreen();
    selectedIndex.value = 1;
  }

  /// Open TSFSScreen inside second tab (tab index 2)
  void openTSFSScreenInTab2() {
    customTab2Content.value = TSFSScreen();
    selectedIndex.value = 2;
  }

  /// Returns the currently selected screen widget based on selectedIndex
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
        return WhishlistScreen();
      case 3:
        if (storedRole.value == 'owner') {
          debugPrint('Displaying OwnerProfile screen');
          final args = Get.arguments as Map<String, dynamic>? ?? {};
          return OwnerProfile(
            isOwner: true,
            activePlacesCount: args['activePlacesCount'] ?? 1,
            totalReviewsCount: args['totalReviewsCount'] ?? 5,
            totalViewsCount: args['totalViewsCount'] ?? 3,
          );
        } else if (storedRole.value == 'guest') {
          return GuestProfile();
        } else {
          return Center(child: Text('Error: Invalid user role'));
        }
      case addItemScreenIndex:
        return AddNewItemScreen();
      default:
        return HomePage();
    }
  }
}
