import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'splash_getway.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after 3 seconds
    Future.delayed(const Duration(milliseconds: 1800), () {
      Get.off(() => const SplashGateway());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 91.15.h,
          width: 253.w,
        ),
      ),
    );
  }
}
