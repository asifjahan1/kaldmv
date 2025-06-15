import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedCategory = 'Things To Do'.obs;

  var categories = [
    CategoryItem(name: 'Things To Do', imageUrl: 'assets/images/things_to_do.png'),
    CategoryItem(name: 'Food & Drink', imageUrl: 'assets/images/food_drink.png'),
    CategoryItem(name: 'Shopping', imageUrl: 'assets/images/shopping.png'),
    CategoryItem(name: 'Stay', imageUrl: 'assets/images/stay.png'),
  ].obs;

  RxList<ActivityItem> thingsToDoList = <ActivityItem>[
    ActivityItem(
      title: 'Elephant Rock',
      location: 'AlUla, Saudi Arabia',
      rating: 4.5,
      reviewCount: 42,
      category: 'Activity · Culture · Sight · AlUla',
      imagePath: 'assets/images/sample_city.jpg',
      price: 'Free',
    ),
    ActivityItem(
      title: 'Heritage Village',
      location: 'AlUla, Saudi Arabia',
      rating: 4.7,
      reviewCount: 23,
      category: 'Culture · History',
      imagePath: 'assets/images/sample_city.jpg',
      price: '\$10',
    ),
  ].obs;

  // Visibility toggle for AI panel
  RxBool showAISuggestionPanel = false.obs;

  // Text controllers
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController filePathController = TextEditingController();
  TextEditingController specialRequirementController = TextEditingController();
  TextEditingController groupTypeController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController budgetController = TextEditingController();

  // Dropdown selections
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  RxString selectedBudget = ''.obs;
  RxString selectedGroupType = ''.obs;

  // Dropdown options
  List<String> durationTimes = [
    '1 Day', '2 Days', '3 Days', '4 Days',
    '5 Days', '6 Days', '7 Days', '8 Days',
    '9 Days', '10 Days', '11 Days', '12 Days',
    '13 Days', '14 Days', '15 Days', '16 Days'
  ];

  List<String> budgetRanges = [
    '\$100 - \$300', '\$300 - \$500', '\$500 - \$1000', 'Above \$1000'
  ];

  List<String> groupTypes = [
    'Solo', 'Couple', 'Family', 'Friends'
  ];

  // Sample data for popular countries and cities
  var popularCountries = [
    PopularPlace(name: 'United Kingdom', placeCount: 6, imageUrl: 'assets/images/uk.png'),
    PopularPlace(name: 'Saudi Arabia', placeCount: 4, imageUrl: 'assets/images/ksa.png'),
    PopularPlace(name: 'Dubai', placeCount: 8, imageUrl: 'assets/images/ksa1.png'),
    PopularPlace(name: 'Turkey', placeCount: 5, imageUrl: 'assets/images/iran.png'),
  ].obs;

  var popularCities = [
    PopularPlace(name: 'London, United Kingdom', placeCount: 6, imageUrl: 'assets/images/uk1.png'),
    PopularPlace(name: 'AIUIa, Saudi Arabia', placeCount: 8, imageUrl: 'assets/images/ksa2.png'),
    PopularPlace(name: 'Ispahan, Iran', placeCount: 5, imageUrl: 'assets/images/iran.png'),
    PopularPlace(name: 'Turkey', placeCount: 4, imageUrl: 'assets/images/istanbul.png'),
    PopularPlace(name: 'United Kingdom', placeCount: 6, imageUrl: 'assets/images/uk.png'),
    PopularPlace(name: 'Birmingham, United Kingdom', placeCount: 8, imageUrl: 'assets/images/birmingham.png'),
  ].obs;

  void setCategory(String category) {
    selectedCategory.value = category;
  }
}

class CategoryItem {
  final String name;
  final String imageUrl;

  CategoryItem({required this.name, required this.imageUrl});
}

class PopularPlace {
  final String name;
  final int placeCount;
  final String imageUrl;

  PopularPlace({required this.name, required this.placeCount, required this.imageUrl});
}

class ActivityItem {
  final String? title;
  final String? location;
  final double? rating;
  final int? reviewCount;
  final String? category;
  final String? imagePath;
  final String? price;

  ActivityItem({
    this.title,
    this.location,
    this.rating,
    this.reviewCount,
    this.category,
    this.imagePath,
    this.price,
  });
}
