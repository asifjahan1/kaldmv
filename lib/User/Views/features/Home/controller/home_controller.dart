import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:kaldmv/User/Views/features/Home/model/popular_country_model.dart';
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
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController budgetController = TextEditingController();

  // Dropdown selections
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  RxString selectedBudget = ''.obs;
  RxString selectedGroupType = ''.obs;
  RxList<String> selectedPreferenceTypes = <String>[].obs;
  RxString selectedAccomodationTypes = ''.obs;
  RxString selectedTransportationTypes = ''.obs;
  RxString calculatedDuration = ''.obs;

  // Dropdown options with display and API values
  final List<Map<String, String>> budgetRanges = [
    {'display': 'Basic (\$0 - \$500)', 'api': 'budget'},
    {'display': 'Mid-range (\$500 - \$1500)', 'api': 'mid-range'},
    {'display': 'Luxury (\$1500 - \$5000)', 'api': 'luxury'},
    {'display': 'Premium (\$5000+)', 'api': 'luxury'},
  ];

  final List<Map<String, String>> groupTypes = [
    {'display': 'Solo Traveler', 'api': 'solo'},
    {'display': 'Couple', 'api': 'couple'},
    {'display': 'Family', 'api': 'family'},
    {'display': 'Friends', 'api': 'family'},
    {'display': 'Business', 'api': 'family'},
  ];

  final List<Map<String, String>> accomodationTypes = [
    {'display': 'Hotel', 'api': 'mid-range'},
    {'display': 'Resort', 'api': 'luxury'},
    {'display': 'Apartment', 'api': 'budget'},
    {'display': 'Hostel', 'api': 'budget'},
    {'display': 'Villa', 'api': 'luxury'},
  ];

  final List<Map<String, String>> transportationTypes = [
    {'display': 'Flight', 'api': 'mid-range'},
    {'display': 'Train', 'api': 'budget'},
    {'display': 'Bus', 'api': 'budget'},
    {'display': 'Car Rental', 'api': 'mid-range'},
    {'display': 'Cruise', 'api': 'luxury'},
  ];

  final List<String> preferenceTypes = [
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

  @override
  void onInit() {
    super.onInit();
    fetchPopularCountries();
    // Sync TextEditingControllers with Rx variables
    ever(selectedBudget, (_) => budgetController.text = selectedBudget.value);
    ever(
      selectedGroupType,
      (_) => groupTypeController.text = selectedGroupType.value,
    );
    ever(
      selectedAccomodationTypes,
      (_) => accomodationController.text = selectedAccomodationTypes.value,
    );
    ever(
      selectedTransportationTypes,
      (_) => transportationController.text = selectedTransportationTypes.value,
    );
    ever(selectedPreferenceTypes, (_) => updatePreferenceText());
  }

  void updatePreferenceText() {
    preferenceController.text = selectedPreferenceTypes.isEmpty
        ? ''
        : selectedPreferenceTypes.join(', ');
  }

  // Sample data for popular countries and cities
  // var popularCountries = [
  //   PopularPlace(
  //     name: 'United Kingdom',
  //     placeCount: 6,
  //     imageUrl: 'assets/images/uk.png',
  //   ),
  //   PopularPlace(
  //     name: 'Saudi Arabia',
  //     placeCount: 4,
  //     imageUrl: 'assets/images/ksa.png',
  //   ),
  //   PopularPlace(
  //     name: 'Dubai',
  //     placeCount: 8,
  //     imageUrl: 'assets/images/ksa1.png',
  //   ),
  //   PopularPlace(
  //     name: 'Turkey',
  //     placeCount: 5,
  //     imageUrl: 'assets/images/iran.png',
  //   ),
  // ].obs;

  RxList<PopularCountryModel> popularCountries = <PopularCountryModel>[].obs;

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

  String mapToApiValue(String displayValue, List<Map<String, String>> options) {
    final option = options.firstWhere(
      (e) => e['display'] == displayValue,
      orElse: () => {'api': 'budget'},
    );
    return option['api']!;
  }

  Future<void> generateItinerary() async {
    try {
      EasyLoading.show(status: "Loading...");
      final url = ApiUrl.generateItnerary;
      log("generateItinerary url $url");

      // Validate required fields
      if (countryController.text.trim().isEmpty ||
          cityController.text.trim().isEmpty ||
          startDateController.text.trim().isEmpty ||
          endDateController.text.trim().isEmpty) {
        EasyLoading.showError("Please fill in all required fields");
        return;
      }

      final Map<String, dynamic> inputData = {
        "Country": countryController.text.trim(),
        "City": cityController.text.trim(),
        "Start_date": startDateController.text.trim(),
        "End_date": endDateController.text.trim(),
        "Start_Time": startTimeController.text.trim(),
        "End_Time": endTimeController.text.trim(),
        "Hotel_budget": mapToApiValue(
          accomodationController.text.trim(),
          accomodationTypes,
        ),
        "food_budget": mapToApiValue(
          budgetController.text.trim(),
          budgetRanges,
        ),
        "transportation_budget": mapToApiValue(
          transportationController.text.trim(),
          transportationTypes,
        ),
        "Group_type": mapToApiValue(
          groupTypeController.text.trim(),
          groupTypes,
        ),
        "preferences": selectedPreferenceTypes.toList(),
        "Special_requirements": specialRequirementController.text.trim(),
      };

      log('generateItinerary url (JSON): ${jsonEncode(inputData)}');

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(inputData),
      );

      log("generateItinerary url Status Code: ${response.statusCode}");
      log("generateItinerary url Body: ${response.body}");

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        EasyLoading.showSuccess("Success");
      } else {
        var responseData = jsonDecode(response.body);
        EasyLoading.showError(
          responseData["message"] ?? "Failed to generate itinerary",
        );
      }
    } catch (e) {
      log("generateItinerary error: $e");
      EasyLoading.showError("An error occurred");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> fetchPopularCountries() async {
    try {
      EasyLoading.show(status: 'Loading countries...');
      final response = await http.get(
        Uri.parse(ApiUrl.getAllCountries),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['success'] == true && data['data'] is List) {
          final List<PopularCountryModel> fetchedCountries =
              (data['data'] as List)
                  .map((e) => PopularCountryModel.fromJson(e))
                  .toList();

          popularCountries.value = fetchedCountries;
          EasyLoading.dismiss();
        } else {
          EasyLoading.showError("Unexpected data format");
        }
      } else {
        EasyLoading.showError("Failed to load countries");
      }
    } catch (e) {
      EasyLoading.showError("Error fetching countries: $e");
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
