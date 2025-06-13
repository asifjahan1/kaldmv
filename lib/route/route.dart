import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/views/tsfs_screen.dart';

import '../User/Auth/screens/forget_pasword_screen.dart';
import '../User/Auth/screens/login_screen.dart';
import '../splash_screen/splash_screen.dart';

class AppRoute {
  static String splashScreen = '/splashScreen';
  static String loginScreen = "/loginScreen";
  static String forgetScreen = "/forgetScreen";
  static String resetPassScreen = "/resetPassScreen";
  static String tsfsScreen = "/tsfsScreen";

  static String getSplashScreen() => splashScreen;

  static String getLoginScreen() => loginScreen;

  static String getForgetScreen() => forgetScreen;

  static String getResetPassScreen() => resetPassScreen;

  static String getTSFSScreen() => tsfsScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: forgetScreen, page: () => ForgetPasswordScreen()),
    // GetPage(name: resetPassScreen, page: () => ResetPassword()),
    GetPage(name: tsfsScreen, page: () => TSFSScreen()),
  ];
}
