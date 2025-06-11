import 'package:get/get.dart';

import '../User/Auth/screens/forget_pasword_screen.dart';
import '../User/Auth/screens/login_screen.dart';
import '../splash_screen/splash_screen.dart';

class AppRoute {
  static String splashScreen = '/splashScreen';
  static String loginScreen = "/loginScreen";
  static String forgetScreen = "/forgetScreen";
  static String resetPassScreen = "/resetPassScreen";
  static String businessProfile = "/businessProfile";
  static String consumerProfile = "/consumerProfile";

  static String getSplashScreen() => splashScreen;

  static String getLoginScreen() => loginScreen;

  static String getForgetScreen() => forgetScreen;

  static String getResetPassScreen() => resetPassScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: forgetScreen, page: () => ForgetPasswordScreen()),
    // GetPage(name: resetPassScreen, page: () => ResetPassword()),
  ];
}
