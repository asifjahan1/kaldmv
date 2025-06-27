// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kaldmv/User/Views/features/Add_New_Item/view/add_new_item_screen.dart';
// import 'package:kaldmv/User/Views/features/Home/views/home_page.dart';
// import 'package:kaldmv/User/Views/features/Profile/views/Guest_profile/guest_profile.dart';
// import 'package:kaldmv/User/Views/features/Profile/views/Owner_Profile/owner_profile.dart';
// import 'package:kaldmv/User/Views/features/Search/view/search_screen.dart';
// import 'package:kaldmv/User/Views/features/Whishlist/views/whishlist_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Home/views/tsfs_screen.dart';

// class BottomNavController extends GetxController {
//   // Selected index for bottom navigation
//   var selectedIndex = 0.obs;

//   // Search related reactive variables
//   var searchType = ''.obs;
//   var searchIndex = 0.obs;
//   var searchPlaceName = ''.obs;

//   // Role stored as reactive variable (default to 'Guest')
//   var storedRole = ''.obs;
//   var isRoleLoaded = false.obs;

//   // Index for the "Add New Item" screen for easy reference
//   static const int addItemScreenIndex = 4;

//   // Custom content widgets for specific tabs (optional dynamic content)
//   var customSearchContent = Rx<Widget?>(null);
//   var customTab2Content = Rxn<Widget>();

//   @override
//   void onInit() {
//     super.onInit();
//     loadRole();
//   }

//   Future<void> loadRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     storedRole.value =
//         prefs.getString('user_role')?.toLowerCase() ??
//         'guest'; // Read as lowercase
//     isRoleLoaded.value = true;
//   }

//   Widget getProfileScreen() {
//     if (storedRole.value.toLowerCase() == 'admin') {
//       return OwnerProfile(isOwner: true);
//     } else if (storedRole.value.toLowerCase() == 'user') {
//       return GuestProfile();
//     } else {
//       return const Center(child: Text('Error: Invalid user role'));
//     }
//   }

//   // Widget getProfileScreen() {
//   //   if (storedRole.value.toLowerCase() == 'owner') {
//   //     return OwnerProfile(isOwner: true);
//   //   } else if (storedRole.value.toLowerCase() == 'guest') {
//   //     return GuestProfile();
//   //   } else {
//   //     return const Center(child: Text('Error: Invalid user role'));
//   //   }
//   // }

//   /// Change selected bottom nav index
//   // void changeIndex(int index) {
//   //   selectedIndex.value = index;
//   // }
//   Future<void> changeIndex(int index) async {
//     final prefs = await SharedPreferences.getInstance();
//     storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'guest';
//     selectedIndex.value = index;
//   }

//   Future<void> refreshRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'guest';
//   }

//   /// Open Search Screen with specific parameters and select Search tab (index 1)
//   void openSearchScreen(String type, int index, String name) {
//     searchType.value = type;
//     searchIndex.value = index;
//     searchPlaceName.value = name;
//     customSearchContent.value = null;
//     selectedIndex.value = 1;
//   }

//   /// Open TSFSScreen inside Search tab (tab index 1)
//   void openTSFSScreen() {
//     customSearchContent.value = TSFSScreen();
//     selectedIndex.value = 1;
//   }

//   /// Open TSFSScreen inside second tab (tab index 2)
//   void openTSFSScreenInTab2() {
//     customTab2Content.value = TSFSScreen();
//     selectedIndex.value = 2;
//   }

//   /// Returns the currently selected screen widget based on selectedIndex
//   Widget get currentScreen {
//     if (!isRoleLoaded.value) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     switch (selectedIndex.value) {
//       case 0:
//         return HomePage();
//       case 1:
//         return SearchScreen(
//           type: searchType.value,
//           index: searchIndex.value,
//           placeName: searchPlaceName.value,
//           customContent: customSearchContent.value,
//         );
//       case 2:
//         return WhishlistScreen();
//       // case 3:
//       //   if (storedRole.value == 'admin') {
//       //     return OwnerProfile(isOwner: true);
//       //   } else if (storedRole.value == 'user') {
//       //     return GuestProfile();
//       //   } else {
//       //     return const Center(child: Text('❌ Invalid Role'));
//       //   }
//       case 3:
//         if (storedRole.value == 'owner') {
//           return OwnerProfile(isOwner: true);
//         } else if (storedRole.value == 'guest') {
//           return GuestProfile();
//         } else {
//           return const Center(child: Text('❌ Invalid Role'));
//         }
//       case addItemScreenIndex:
//         return AddNewPlaceScreen();
//       default:
//         return HomePage();
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Add_New_Item/view/add_new_item_screen.dart';
// import '../../Home/views/home_page.dart';
// import '../../Profile/views/Guest_profile/guest_profile.dart';
// import '../../Profile/views/Owner_Profile/owner_profile.dart';
// import '../../Search/view/search_screen.dart';
// import '../../Whishlist/views/whishlist_screen.dart';
// import '../../Home/views/tsfs_screen.dart';

// class BottomNavController extends GetxController {
//   var selectedIndex = 0.obs;
//   var storedRole = ''.obs;
//   var isRoleLoaded = false.obs;

//   var searchType = ''.obs;
//   var searchIndex = 0.obs;
//   var searchPlaceName = ''.obs;
//   var customSearchContent = Rx<Widget?>(null);
//   var customTab2Content = Rxn<Widget>();

//   static const int addItemScreenIndex = 4;

//   @override
//   void onInit() {
//     super.onInit();
//     loadRole();
//   }

//   Future<void> loadRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'user';
//     isRoleLoaded.value = true;
//   }

//   Widget getProfileScreen() {
//     final role = storedRole.value;
//     if (role == 'admin') return OwnerProfile(isOwner: true);
//     if (role == 'user') return GuestProfile();
//     return const Center(child: Text('Invalid user role'));
//   }

//   Future<void> changeIndex(int index) async {
//     final prefs = await SharedPreferences.getInstance();
//     storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'user';
//     selectedIndex.value = index;
//   }

//   Widget get currentScreen {
//     if (!isRoleLoaded.value) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     switch (selectedIndex.value) {
//       case 0:
//         return HomePage();
//       case 1:
//         return SearchScreen(
//           type: searchType.value,
//           index: searchIndex.value,
//           placeName: searchPlaceName.value,
//           customContent: customSearchContent.value,
//         );
//       case 2:
//         return WhishlistScreen();
//       case 3:
//         return getProfileScreen();
//       case addItemScreenIndex:
//         return AddNewPlaceScreen();
//       default:
//         return HomePage();
//     }
//   }

//   void openSearchScreen(String type, int index, String name) {
//     searchType.value = type;
//     searchIndex.value = index;
//     searchPlaceName.value = name;
//     customSearchContent.value = null;
//     selectedIndex.value = 1;
//   }

//   void openTSFSScreen() {
//     customSearchContent.value = TSFSScreen();
//     selectedIndex.value = 1;
//   }

//   void openTSFSScreenInTab2() {
//     customTab2Content.value = TSFSScreen();
//     selectedIndex.value = 2;
//   }
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kaldmv/User/Views/features/Home/views/home_page.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/view/add_new_item_screen.dart';
import 'package:kaldmv/User/Views/features/Profile/views/Guest_profile/guest_profile.dart';
import 'package:kaldmv/User/Views/features/Profile/views/Owner_Profile/owner_profile.dart';
import 'package:kaldmv/User/Views/features/Search/view/search_screen.dart';
import 'package:kaldmv/User/Views/features/Whishlist/views/whishlist_screen.dart';
import 'package:kaldmv/User/Views/features/Home/views/tsfs_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  var storedRole = ''.obs; // 'admin' or 'user'
  var isRoleLoaded = false.obs;

  var searchType = ''.obs;
  var searchIndex = 0.obs;
  var searchPlaceName = ''.obs;

  var customSearchContent = Rx<Widget?>(null);
  var customTab2Content = Rxn<Widget>();

  static const int addItemScreenIndex = 4;

  @override
  void onInit() {
    super.onInit();
    loadRole();
  }

  /// Loads role from SharedPreferences
  Future<void> loadRole() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final role = prefs.getString('user_role')?.toLowerCase() ?? 'user';
      storedRole.value = (role == 'admin' || role == 'user') ? role : 'user';
      isRoleLoaded.value = true;
      log('[BottomNav] Role loaded: ${storedRole.value}');
    } catch (e) {
      log('[BottomNav] Role load error: $e');
      storedRole.value = 'user';
      isRoleLoaded.value = true;
    }
  }

  /// Manual refresh role
  Future<void> refreshRole() async => await loadRole();

  /// Display-friendly role name
  String get displayRole => storedRole.value == 'admin' ? 'Owner' : 'Guest';

  /// Route to correct profile screen
  Widget getProfileScreen() {
    if (storedRole.value == 'admin') {
      return const OwnerProfile(
        activePlacesCount: 1,
        totalReviewsCount: 5,
        totalViewsCount: 3,
      );
    } else {
      return const GuestProfile();
    }
  }

  /// Safely update selected tab index & refresh role
  Future<void> changeIndex(int index) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final role = prefs.getString('user_role')?.toLowerCase() ?? 'user';
      storedRole.value = (role == 'admin' || role == 'user') ? role : 'user';
      selectedIndex.value = index;
      log('[BottomNav] Changed tab to $index | role: ${storedRole.value}');
    } catch (e) {
      log('[BottomNav] changeIndex error: $e');
      selectedIndex.value = index;
      storedRole.value = 'user';
    }
  }

  /// Reset all nav states
  void resetNavigation() {
    selectedIndex.value = 0;
    searchType.value = '';
    searchIndex.value = 0;
    searchPlaceName.value = '';
    customSearchContent.value = null;
    customTab2Content.value = null;
    storedRole.value = 'user';
    isRoleLoaded.value = false;
    log('[BottomNav] Navigation state reset');
  }

  /// Main screen switch logic
  Widget get currentScreen {
    if (!isRoleLoaded.value) {
      return const Center(child: CircularProgressIndicator());
    }

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
        return customTab2Content.value ?? WhishlistScreen();
      case 3:
        return getProfileScreen();
      case addItemScreenIndex:
        if (storedRole.value == 'admin') {
          return AddNewPlaceScreen();
        } else {
          return const Center(
            child: Text(
              "Only Owners can add new places.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
      default:
        log('[BottomNav] Invalid index: ${selectedIndex.value}');
        return HomePage();
    }
  }

  /// Quick search tab jump
  void openSearchScreen(String type, int index, String name) {
    searchType.value = type;
    searchIndex.value = index;
    searchPlaceName.value = name;
    customSearchContent.value = null;
    selectedIndex.value = 1;
    log('[BottomNav] openSearchScreen → $type | $index | $name');
  }

  /// Load TSFS screen in Search tab
  void openTSFSScreen() {
    customSearchContent.value = TSFSScreen();
    selectedIndex.value = 1;
    log('[BottomNav] openTSFSScreen in Search tab');
  }

  /// Load TSFS screen in Tab 2
  void openTSFSScreenInTab2() {
    customTab2Content.value = TSFSScreen();
    selectedIndex.value = 2;
    log('[BottomNav] openTSFSScreen in Tab 2');
  }
}
