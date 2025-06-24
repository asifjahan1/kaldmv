import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:kaldmv/core/const/urls.dart';

class HomeController extends GetxController {
  var selectedCategory = 'Things To Do'.obs;

  var categories = [
    CategoryItem(
      name: 'Things To Do',
      imageUrl: 'assets/images/things_to_do.png',
    ),
    CategoryItem(
      name: 'Food & Drink',
      imageUrl: 'assets/images/food_drink.png',
    ),
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
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController preferenceController = TextEditingController();
  TextEditingController accomodationController = TextEditingController();
  TextEditingController transportationController = TextEditingController();
  TextEditingController specialRequirementController = TextEditingController();
  TextEditingController groupTypeController = TextEditingController();
  // TextEditingController durationController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController budgetController = TextEditingController();

  // Dropdown selections
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  RxString selectedBudget = ''.obs;
  RxString selectedGroupType = ''.obs;
  RxString selectedPreferenceTypes = ''.obs;
  RxString selectedAccomodationTypes = ''.obs;
  RxString selectedTransportationTypes = ''.obs;
  RxString calculatedDuration = ''.obs;

  // Dropdown options
  // List<String> startTimes = [
  //   '1 Day',
  //   '2 Days',
  //   '3 Days',
  //   '4 Days',
  //   '5 Days',
  //   '6 Days',
  //   '7 Days',
  //   '8 Days',
  //   '9 Days',
  //   '10 Days',
  //   '11 Days',
  //   '12 Days',
  //   '13 Days',
  //   '14 Days',
  //   '15 Days',
  //   '16 Days',
  // ];

  // List<String> endTimes = [
  //   '1 Day',
  //   '2 Days',
  //   '3 Days',
  //   '4 Days',
  //   '5 Days',
  //   '6 Days',
  //   '7 Days',
  //   '8 Days',
  //   '9 Days',
  //   '10 Days',
  //   '11 Days',
  //   '12 Days',
  //   '13 Days',
  //   '14 Days',
  //   '15 Days',
  //   '16 Days',
  // ];

  List<String> budgetRanges = [
    'Basic (\$0 - \$500)',
    'Mid-range(\$500 - \$1500)',
    'Luxury (\$1500 - \$5000)',
    'Premium (\$5000+)',
  ];

  List<String> groupTypes = [
    'Solo Traveler',
    'Couple',
    'Family',
    'Friends',
    'Business',
  ];

  List<String> accomodationTypes = [
    'Hotel',
    'Resort',
    'Apartment',
    'Hostel',
    'Villa',
  ];

  List<String> transportationTypes = [
    'Flight',
    'Train',
    'Bus',
    'Car Portal',
    'Cruise',
  ];

  List<String> preferenceTypes = [
    'Adventure & Outdoor Activities',
    'Culture Experiences',
    'Food & Culinary Tours',
    'Nightlife & Entertainment',
    'Shopping',
    'Relaxation & Spa',
    'Nature & Wildlife',
    'Historical Sites',
    'Photography',
    'Sports & Fitness',
    'Art & Museums',
    'Music & Festivals',
    'Beach & Water Activities',
    'Mountain & Hiking',
    'Luxury Experience',
  ];

  // Sample data for popular countries and cities
  var popularCountries = [
    PopularPlace(
      name: 'United Kingdom',
      placeCount: 6,
      imageUrl: 'assets/images/uk.png',
    ),
    PopularPlace(
      name: 'Saudi Arabia',
      placeCount: 4,
      imageUrl: 'assets/images/ksa.png',
    ),
    PopularPlace(
      name: 'Dubai',
      placeCount: 8,
      imageUrl: 'assets/images/ksa1.png',
    ),
    PopularPlace(
      name: 'Turkey',
      placeCount: 5,
      imageUrl: 'assets/images/iran.png',
    ),
  ].obs;

  var popularCities = [
    PopularPlace(
      name: 'London, United Kingdom',
      placeCount: 6,
      imageUrl: 'assets/images/uk1.png',
    ),
    PopularPlace(
      name: 'AIUIa, Saudi Arabia',
      placeCount: 8,
      imageUrl: 'assets/images/ksa2.png',
    ),
    PopularPlace(
      name: 'Ispahan, Iran',
      placeCount: 5,
      imageUrl: 'assets/images/iran.png',
    ),
    PopularPlace(
      name: 'Turkey',
      placeCount: 4,
      imageUrl: 'assets/images/istanbul.png',
    ),
    PopularPlace(
      name: 'United Kingdom',
      placeCount: 6,
      imageUrl: 'assets/images/uk.png',
    ),
    PopularPlace(
      name: 'Birmingham, United Kingdom',
      placeCount: 8,
      imageUrl: 'assets/images/birmingham.png',
    ),
  ].obs;

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void calculateDuration() {
    if (startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      try {
        DateTime startDate = DateFormat(
          'yyyy-MM-dd',
        ).parse(startDateController.text);
        DateTime endDate = DateFormat(
          'yyyy-MM-dd',
        ).parse(endDateController.text);
        int durationDays = endDate.difference(startDate).inDays + 1;
        if (durationDays >= 1) {
          calculatedDuration.value =
              '$durationDays Day${durationDays > 1 ? 's' : ''}';
        } else {
          calculatedDuration.value = 'Invalid duration';
        }
      } catch (e) {
        calculatedDuration.value = 'Invalid date format';
      }
    } else {
      calculatedDuration.value = '';
    }
  }

  Future<void> generateItnerary() async {
    try {
      EasyLoading.show(status: "Loading...");
      final url = ApiUrl.generateItnerary;
      log("generateItnerary url $url");

      final Map<String, dynamic> inputData = {
        "Country": "Japan",
        "City": "Tokyo",
        "Start_date": "2025-06-01",
        "End_date": "2025-06-07",
        "Start_Time": "09:00",
        "End_Time": "17:00",
        "Hotel_budget": "luxury",
        "food_budget": "luxury",
        "transportation_budget": "mid-range",
        "Group_type": "family",
        "preferences": ["adventure", "outdoor activities"],
        "Special_requirements": "Wheelchair Accessing",

        // "Country": countryController.text.trim(),
        // "City": cityController.text.trim(),
        // "Start_date": startDateController.text.trim(),
        // "End_date": endDateController.text.trim(),
        // "Start_Time": startTimeController.text.trim(),
        // "End_Time": endTimeController.text.trim(),
        // "Hotel_budget": accomodationController.text.trim(),
        // "food_budget": budgetController.text.trim(),
        // "transportation_budget": transportationController.text.trim(),
        // "Group_type": groupTypeController.text.trim(),
        // "preferences": preferenceController.text.trim(),
        // "Special_requirements": specialRequirementController.text.trim(),
      };

      log('generateItnerary url (JSON): ${jsonEncode(inputData)}');

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(inputData),
      );

      log("generateItnerary url Status Code: ${response.statusCode}");
      log("generateItnerary url Body: ${response.body}");

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        EasyLoading.showSuccess("success");
      } else {
        var responseData = jsonDecode(response.body);
        EasyLoading.showError(responseData["message"]);
      }
    } catch (e) {
      log("generateItnerary error: $e");
    } finally {
      EasyLoading.dismiss();
    }
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

  PopularPlace({
    required this.name,
    required this.placeCount,
    required this.imageUrl,
  });
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
