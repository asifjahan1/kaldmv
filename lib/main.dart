import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaldmv/User/Views/features/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:kaldmv/User/Views/features/Home/controller/home_controller.dart';
import 'package:kaldmv/User/Views/features/Search/controller/search_controller.dart';
import 'User/Views/features/Home/controller/header_controller.dart';
import 'User/Views/features/Home/controller/tsfs_controller.dart';
import 'core/const/app_colors.dart';
import 'route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configEasyLoading();
  Get.put(HomeController(), permanent: true);
  Get.put(SearchhController(), permanent: true);
  Get.put(BottomNavController(), permanent: true);
  Get.put(HeaderController(), permanent: true);
  Get.put(TSFSController(), permanent: true);

  runApp(const MyApp());
}

void configEasyLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.grayColor
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..maskColor = Colors.green
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'kaldmv',
            getPages: AppRoute.routes,
            initialRoute: AppRoute.splashScreen,
            builder: EasyLoading.init(),
            theme: ThemeData(
              fontFamily: GoogleFonts.dmSans().fontFamily,
              textTheme: GoogleFonts.dmSansTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
          ),
    );
  }
}
