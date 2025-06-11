// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../controller/bottom_nav_bar_controller.dart';
// import 'custom_bottom_navbar_screen.dart';
//
// class BottomNavBarScreen extends StatelessWidget {
//   final BottomNavController controller = Get.put(BottomNavController());
//
//   BottomNavBarScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//           () => Scaffold(
//         backgroundColor: Colors.black,
//         body: Stack(
//           children: [
//             controller.currentScreen,
//             Positioned(
//               left: -10.w,
//               right: -10.w,
//               bottom: 10.h,
//               child: CustomBottomNavBar(
//                 selectedIndex: controller.selectedIndex.value,
//                 onItemTapped: controller.changeIndex,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
