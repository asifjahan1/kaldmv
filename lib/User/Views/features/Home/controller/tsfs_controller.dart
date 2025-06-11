import 'dart:developer';

import 'package:get/get.dart';
import '../../Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import '../model/fcfs_item_model.dart';

class TSFSController extends GetxController {
  final RxList<TSFSItem> items = <TSFSItem>[].obs;
  late final BottomNavController bottomNavController;

  @override
  void onInit() {
    super.onInit();
    try {
      bottomNavController = Get.find<BottomNavController>();
    } catch (e) {
      bottomNavController = Get.put(BottomNavController());
      log('BottomNavController initialized due to null: $e');
    }
    _initializeItems();
  }

  void _initializeItems() {
    items.assignAll([
      TSFSItem(
        title: 'Elephant Rock',
        location: 'AlUla, Saudi Arabia',
        imagePath: 'assets/images/elephant_rock.png',
        rating: 0,
        isClosed: false,
        provider: 'Activity, Culture, Sight, AlUla',
      ),
      TSFSItem(
        title: "King's Fountain",
        location: 'Mecca International Tourism Services Co Ltd, Al Andalah, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/king.png',
        rating: 4.5,
        isClosed: false,
        provider: 'Closed',
      ),
      TSFSItem(
        title: 'Fakeeh Aquarium',
        location: 'Fakeeh Aquarium Next to Al Nawras, Opposite Al Shallal Theme Park, Corniche Road Jeddah, Saudi Arabia',
        imagePath: 'assets/images/fakeen.png',
        rating: 0,
        isClosed: false,
        provider: 'Activity, Jeddah',
      ),
      TSFSItem(
        title: 'Al Jazirah Stadium',
        location: 'King Abdulaziz International Airport, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/stadium.png',
        rating: 0,
        isClosed: false,
        provider: 'Stadium',
      ),
    ]);
  }

  void onItemTap(int index) {
    if (index < 4) {
      bottomNavController.changeIndex(1);
    }
  }
}
