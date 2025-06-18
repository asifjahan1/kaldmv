import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/view/add_new_item_screen.dart';
import 'package:kaldmv/User/Views/features/Home/views/tsfs_screen.dart';

import '../User/Auth/screens/forget_pasword_screen.dart';
import '../User/Auth/screens/login_screen.dart';
import '../User/Views/features/Profile/views/Owner_Profile/owner_profile.dart';
import '../splash_screen/splash_screen.dart';

class AppRoute {
  static String splashScreen = '/splashScreen';
  static String loginScreen = "/loginScreen";
  static String forgetScreen = "/forgetScreen";
  static String resetPassScreen = "/resetPassScreen";
  static String tsfsScreen = "/tsfsScreen";
  static String addNewItemScreen = "/addNewItemScreen";
  static String ownerProfile = "/ownerProfile";

  static String getSplashScreen() => splashScreen;

  static String getLoginScreen() => loginScreen;

  static String getForgetScreen() => forgetScreen;

  static String getResetPassScreen() => resetPassScreen;

  static String getTSFSScreen() => tsfsScreen;

  static String getAddNewItemScreen() => addNewItemScreen;

  static String getOwnerProfile() => ownerProfile;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: forgetScreen, page: () => ForgetPasswordScreen()),
    // GetPage(name: resetPassScreen, page: () => ResetPassword()),
    GetPage(name: tsfsScreen, page: () => TSFSScreen()),
    GetPage(name: addNewItemScreen, page: () => AddNewPlaceScreen()),
    GetPage(
      name: ownerProfile,
      page: () {
        final args = Get.arguments as Map<String, dynamic>? ?? {};
        return OwnerProfile(
          isOwner: args['isOwner'] ?? true,
          activePlacesCount: args['activePlacesCount'] ?? 1,
          totalReviewsCount: args['totalReviewsCount'] ?? 5,
          totalViewsCount: args['totalViewsCount'] ?? 3,
        );
      },
    ),
  ];
}
