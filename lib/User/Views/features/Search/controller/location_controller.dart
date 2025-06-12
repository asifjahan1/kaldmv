// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class LocationController extends GetxController {
//   var currentPosition = Rx<LatLng?>(null);
//
//   @override
//   void onInit() {
//     super.onInit();
//     getCurrentLocation();
//   }
//
//   Future<SnackbarController> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Get.snackbar("Error", "Location services are disabled.");
//     }
//
//     // Check permission
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Get.snackbar("Error", "Location permission denied");
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Get.snackbar("Error", "Location permission permanently denied");
//     }
//
//     // Get current position
//     final position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     currentPosition.value = LatLng(position.latitude, position.longitude);
//   }
// }
