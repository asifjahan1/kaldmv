import 'dart:developer';
import 'package:get/get.dart';
import '../../Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import '../model/tsfs_item_model.dart';

class TSFSController extends GetxController {
  final RxList<TSFSItem> items = <TSFSItem>[].obs;
  final RxList<TSFSItem> filteredItems = <TSFSItem>[].obs;
  final RxList<TSFSItem> bookmarkedItems = <TSFSItem>[].obs;
  final RxString selectedValue = 'Open Now'.obs;
  final RxBool isGridView = false.obs;
  final RxString selectedCategory = ''.obs;
  final RxString categoryImage = 'assets/images/rest.png'.obs;
  late final BottomNavController bottomNavController;

  // Dropdown filter options
  List<String> get dropdownOptions => [
    'All',
    'Open Now',
    'Closed',
    'Highly Rated',
  ];

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
        place: 'Riyad',
        title: 'Elephant Rock',
        subTitle: 'Activity, Culture, Sight, AIUIa',
        location: 'AIUIa, Saudi Arabia',
        imagePath: 'assets/images/elephant_rock.png',
        rating: 0,
        isClosed: false,
        provider: 'Closed',
        isBookmarked: false,
        category: 'things_to_do',
      ),
      TSFSItem(
        place: 'Taif',
        title: "King's Fountain",
        subTitle: 'Activity, Sight, Jeddah',
        location:
            'Meeza Internatuinal Tourism Services Co. LTD, AL Andalus, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/king.png',
        rating: 4.5,
        isClosed: false,
        provider: 'Closed',
        isBookmarked: false,
        category: 'things_to_do',
      ),
      TSFSItem(
        place: 'Mecca',
        title: 'Fakeeh Aquarium',
        subTitle: 'Activity, Jeddah',
        location:
            'Fakieh Aquarium Next to Al Nawras, On oposite AL Shallal THeme Park- Cornice ROad Jeddah, Saudi Arabia.',
        imagePath: 'assets/images/fakeen.png',
        rating: 0,
        isClosed: false,
        provider: 'Closed',
        isBookmarked: false,
        category: 'things_to_do',
      ),
      TSFSItem(
        place: 'Madinah',
        title: 'Al Jazirah Stadium',
        subTitle: 'Activity, Sight, Jeddah',
        location: 'King Abdulaziz International Airport, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/stadium.png',
        rating: 0,
        isClosed: true,
        provider: 'Closed',
        isBookmarked: false,
        category: 'stay',
      ),
      TSFSItem(
        place: 'Istanbul',
        title: "King's Fountain",
        subTitle: 'Activity, Sight, Jeddah',
        location:
            'Meeza Internatuinal Tourism Services Co. LTD, AL Andalus, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/king.png',
        rating: 4.5,
        isClosed: false,
        provider: 'Closed',
        isBookmarked: false,
        category: 'shopping',
      ),
      TSFSItem(
        place: 'London',
        title: 'Elephant Rock',
        subTitle: 'Activity, Culture, Sight, AIUIa',
        location: 'AIUIa, Saudi Arabia',
        imagePath: 'assets/images/elephant_rock.png',
        rating: 0,
        isClosed: false,
        provider: 'Closed',
        isBookmarked: false,
        category: 'things_to_do',
      ),
      TSFSItem(
        place: 'Jeddah',
        title: 'Jeddah Food Market',
        subTitle: 'Food, Jeddah',
        location: 'Al-Balad, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/food_market.png',
        rating: 4.2,
        isClosed: false,
        provider: 'Local Vendors',
        isBookmarked: false,
        category: 'food_drink', // Fixed from 'food & drink'
      ),
      TSFSItem(
        place: 'Ankara',
        title: 'Red Sea Mall',
        subTitle: 'Shopping, Jeddah',
        location: 'King Abdulaziz Road, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/mall.png',
        rating: 4.0,
        isClosed: false,
        provider: 'Retail',
        isBookmarked: false,
        category: 'shopping',
      ),
      TSFSItem(
        place: 'Isfahan',
        title: 'Ritz-Carlton Jeddah',
        subTitle: 'Hotel, Luxury, Jeddah',
        location: 'Al-Hamra, Jeddah, Saudi Arabia',
        imagePath: 'assets/images/ritz.png',
        rating: 4.8,
        isClosed: false,
        provider: 'Hotel',
        isBookmarked: false,
        category: 'stay',
      ),
    ];

    items.assignAll(sampleItems);
    filteredItems.assignAll(sampleItems);
  }

  void filterByCategory(String category, String imagePath) {
    selectedCategory.value = category;
    categoryImage.value = imagePath.isEmpty
        ? 'assets/images/rest.png'
        : imagePath;
    if (category.isEmpty) {
      filteredItems.assignAll(items);
    } else {
      filteredItems.assignAll(
        items.where((item) => item.category == category).toList(),
      );
    }
    filterItems(selectedValue.value);
  }

  void filterItems(String selected) {
    selectedValue.value = selected;
    switch (selected) {
      case 'All':
        filteredItems.assignAll(
          items
              .where(
                (item) =>
                    selectedCategory.value.isEmpty ||
                    item.category == selectedCategory.value,
              )
              .toList(),
        );
        break;
      case 'Open Now':
        filteredItems.assignAll(
          items
              .where(
                (item) =>
                    !item.isClosed &&
                    (selectedCategory.value.isEmpty ||
                        item.category == selectedCategory.value),
              )
              .toList(),
        );
        break;
      case 'Closed':
        filteredItems.assignAll(
          items
              .where(
                (item) =>
                    item.isClosed &&
                    (selectedCategory.value.isEmpty ||
                        item.category == selectedCategory.value),
              )
              .toList(),
        );
        break;
      case 'Highly Rated':
        filteredItems.assignAll(
          items
              .where(
                (item) =>
                    item.rating >= 4.0 &&
                    (selectedCategory.value.isEmpty ||
                        item.category == selectedCategory.value),
              )
              .toList(),
        );
        break;
      default:
        filteredItems.assignAll(
          items
              .where(
                (item) =>
                    selectedCategory.value.isEmpty ||
                    item.category == selectedCategory.value,
              )
              .toList(),
        );
    }
  }

  void onItemTap(int index) {
    bottomNavController.changeIndex(1);
  }

  void toggleView() {
    isGridView.value = !isGridView.value;
  }

  void toggleBookmark(int index) {
    final item = filteredItems[index];
    item.isBookmarked = !item.isBookmarked;
    if (item.isBookmarked) {
      if (!bookmarkedItems.contains(item)) {
        bookmarkedItems.add(item);
      }
    } else {
      bookmarkedItems.remove(item);
    }
    filteredItems.refresh();
    bookmarkedItems.refresh();
  }
}
