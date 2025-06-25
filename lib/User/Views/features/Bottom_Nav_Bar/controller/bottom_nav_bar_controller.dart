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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Add_New_Item/view/add_new_item_screen.dart';
import '../../Home/views/home_page.dart';
import '../../Profile/views/Guest_profile/guest_profile.dart';
import '../../Profile/views/Owner_Profile/owner_profile.dart';
import '../../Search/view/search_screen.dart';
import '../../Whishlist/views/whishlist_screen.dart';
import '../../Home/views/tsfs_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  var storedRole = ''.obs;
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

  /// Loads user role from SharedPreferences and sets isRoleLoaded to true
  Future<void> loadRole() async {
    final prefs = await SharedPreferences.getInstance();
    storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'user';
    isRoleLoaded.value = true;
  }

  /// Refreshes the role from SharedPreferences (for explicit manual refresh)
  Future<void> refreshRole() async {
    final prefs = await SharedPreferences.getInstance();
    storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'user';
  }

  /// Returns the profile screen widget based on storedRole
  Widget getProfileScreen() {
    final role = storedRole.value;
    if (role == 'admin') return OwnerProfile(isOwner: true);
    if (role == 'user') return GuestProfile();
    return const Center(child: Text('Invalid user role'));
  }

  /// Change selected bottom nav index and refresh stored role
  Future<void> changeIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    storedRole.value = prefs.getString('user_role')?.toLowerCase() ?? 'user';
    selectedIndex.value = index;
  }

  /// Returns the current screen widget based on selectedIndex and role
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
        return WhishlistScreen();
      case 3:
        return getProfileScreen();
      case addItemScreenIndex:
        return AddNewPlaceScreen();
      default:
        return HomePage();
    }
  }

  /// Opens search screen and selects search tab
  void openSearchScreen(String type, int index, String name) {
    searchType.value = type;
    searchIndex.value = index;
    searchPlaceName.value = name;
    customSearchContent.value = null;
    selectedIndex.value = 1;
  }

  /// Opens TSFSScreen inside Search tab (tab index 1)
  void openTSFSScreen() {
    customSearchContent.value = TSFSScreen();
    selectedIndex.value = 1;
  }

  /// Opens TSFSScreen inside tab index 2
  void openTSFSScreenInTab2() {
    customTab2Content.value = TSFSScreen();
    selectedIndex.value = 2;
  }
}
