import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaldmv/bindings/app_binding.dart';
import 'core/const/app_colors.dart';
import 'route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configEasyLoading();

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
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'kaldmv',
        getPages: AppRoute.routes,
        initialBinding: AppBinding(),
        initialRoute: AppRoute.splashScreen,
        builder: EasyLoading.init(),
        theme: ThemeData(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
        ),
      ),
    );
  }
}
