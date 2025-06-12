import 'dart:developer';
import 'package:get/get.dart';
import '../../Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import '../model/fcfs_item_model.dart';

class TSFSController extends GetxController {
  final RxList<TSFSItem> items = <TSFSItem>[].obs;
  final RxList<TSFSItem> filteredItems = <TSFSItem>[].obs;
  final RxString selectedValue = 'Open Now'.obs;
  final RxBool isGridView = false.obs;
  late final BottomNavController bottomNavController;

  // Dropdown filter options
  List<String> get dropdownOptions => ['All', 'Open Now', 'Closed', 'Highly Rated'];

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
    final sampleItems = [
      TSFSItem(
        title: 'Elephant Rock',
        subTitle: 'Activity, Culture, Sight, AIUIa',
        location: 'AIUIa, Saudi Arabia',
        imagePath: 'assets/images/elephant_rock.png',
        rating: 0,
        isClosed: false,
        provider: 'Closed',
      ),
      TSFSItem(
        title: "King's Fountain",
        subTitle: 'Activity, Sight, Jeddah',
        location: 'Meeza Internatuinal Tourism Services Co. LTD, AL Andalus, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/king.png',
        rating: 4.5,
        isClosed: false,
        provider: 'Closed',
      ),
      TSFSItem(
        title: 'Fakeeh Aquarium',
        subTitle: 'Activity, Jeddah',
        location: 'Fakieh Aquarium Next to Al Nawras, On oposite AL Shallal THeme Park- Cornice ROad Jeddah, Saudi Arabia.',
        imagePath: 'assets/images/fakeen.png',
        rating: 0,
        isClosed: false,
        provider: 'Closed',
      ),
      TSFSItem(
        title: 'Al Jazirah Stadium',
        subTitle: 'Activity, Sight, Jeddah',
        location: 'King Abdulaziz International Airport, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/stadium.png',
        rating: 0,
        isClosed: true,
        provider: 'Closed',
      ),
      TSFSItem(
        title: "King's Fountain",
        subTitle: 'Activity, Sight, Jeddah',
        location: 'Meeza Internatuinal Tourism Services Co. LTD, AL Andalus, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/king.png',
        rating: 4.5,
        isClosed: false,
        provider: 'Closed',
      ),
      TSFSItem(
        title: 'Elephant Rock',
        subTitle: 'Activity, Culture, Sight, AIUIa',
        location: 'AIUIa, Saudi Arabia',
        imagePath: 'assets/images/elephant_rock.png',
        rating: 0,
        isClosed: false,
        provider: 'Closed',
      ),
    ];

    items.assignAll(sampleItems);
    filteredItems.assignAll(sampleItems);
  }

  /// Filtering logic for dropdown
  void filterItems(String selected) {
    selectedValue.value = selected;

    switch (selected) {
      case 'All':
        filteredItems.assignAll(items);
        break;
      case 'Open Now':
        filteredItems.assignAll(items.where((item) => !item.isClosed).toList());
        break;
      case 'Closed':
        filteredItems.assignAll(items.where((item) => item.isClosed).toList());
        break;
      case 'Highly Rated':
        filteredItems.assignAll(items.where((item) => item.rating >= 4.0).toList());
        break;
      default:
        filteredItems.assignAll(items);
    }
  }

  void onItemTap(int index) {
    bottomNavController.changeIndex(1);
  }

  void toggleView() {
    isGridView.value = !isGridView.value;
  }
}
