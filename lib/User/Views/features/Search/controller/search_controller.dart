import 'package:get/get.dart';
import '../model/city_model.dart';
import '../model/country_model.dart';

class SearchhController extends GetxController {
  RxString type = ''.obs;
  RxInt index = (-1).obs;
  RxInt selectedCityIndex = (-1).obs;

  // Mapping of country names to their primary city names
  final Map<String, String> countryToPrimaryCity = {
    'Saudi Arabia': 'Riyadh',
    'United Kingdom': 'London',
    'Turkey': 'Istanbul',
  };

  // Method to get the primary city for a country
  String getPrimaryCity(String countryName) {
    return countryToPrimaryCity[countryName] ?? 'Unknown City';
  }

  final RxList<CountryModel> countries = <CountryModel>[
    CountryModel(
      name: 'Saudi Arabia',
      region: 'Middle East',
      weather: '31°C with cloudy rain',
      currency: 'Saudi Arabian Riyal (SAR)',
      language: 'Arabic',
      bestTimeToVisit: 'Winter',
      headerImage: 'assets/images/saudi_arabia.png',
      cities: [
        CityModel(
          name: 'AlUla',
          imageUrls: List.generate(14, (_) => 'assets/images/iran.png'),
          placeCount: 4,
          rating: 4.6,
          review: 1,
        ),
        CityModel(
          name: 'Jeddah',
          imageUrls: List.generate(14, (_) => 'assets/images/ksa1.png'),
          placeCount: 4,
          rating: 4.1,
          review: 2,
        ),
        CityModel(
          name: 'Taif',
          imageUrls: List.generate(14, (_) => 'assets/images/ksa.png'),
          placeCount: 5,
          rating: 4.4,
          review: 3,
        ),
        CityModel(
          name: 'Medina',
          imageUrls: List.generate(14, (_) => 'assets/images/ksa2.png'),
          placeCount: 6,
          rating: 4.4,
          review: 4,
        ),
        CityModel(
          name: 'Bait Ul Mamur',
          imageUrls: List.generate(14, (_) => 'assets/images/istanbul.png'),
          placeCount: 4,
          rating: 4.2,
          review: 5,
        ),
        CityModel(
          name: 'Bait Ul Mamur',
          imageUrls: List.generate(14, (_) => 'assets/images/ksa1.png'),
          placeCount: 4,
          rating: 4.2,
          review: 5,
        ),
      ],
    ),
    CountryModel(
      name: 'United Kingdom',
      region: 'Europe',
      weather: '15°C with partly cloudy',
      currency: 'British Pound (GBP)',
      language: 'English',
      bestTimeToVisit: 'Summer',
      headerImage: 'assets/images/uk.png',
      cities: [
        CityModel(
          name: 'London',
          imageUrls: List.generate(14, (_) => 'assets/images/uk.png'),
          placeCount: 8,
          rating: 4.8,
          review: 10,
        ),
        CityModel(
          name: 'Manchester',
          imageUrls: List.generate(14, (_) => 'assets/images/uk.png'),
          placeCount: 5,
          rating: 4.5,
          review: 7,
        ),
        CityModel(
          name: 'Birmingham',
          imageUrls: List.generate(14, (_) => 'assets/images/uk.png'),
          placeCount: 5,
          rating: 4.5,
          review: 7,
        ),
        CityModel(
          name: 'Wales',
          imageUrls: List.generate(14, (_) => 'assets/images/uk.png'),
          placeCount: 5,
          rating: 4.5,
          review: 7,
        ),
        CityModel(
          name: 'West County',
          imageUrls: List.generate(14, (_) => 'assets/images/uk.png'),
          placeCount: 5,
          rating: 4.5,
          review: 7,
        ),
      ],
    ),
    CountryModel(
      name: 'Turkey',
      region: 'Europe/Asia',
      weather: '22°C with sunny intervals',
      currency: 'Turkish Lira (TRY)',
      language: 'Turkish',
      bestTimeToVisit: 'Spring or Autumn',
      headerImage: 'assets/images/turkey.png',
      cities: [
        CityModel(
          name: 'Istanbul',
          imageUrls: List.generate(14, (_) => 'assets/images/istanbul.png'),
          placeCount: 7,
          rating: 4.9,
          review: 12,
        ),
        CityModel(
          name: 'Ankara',
          imageUrls: List.generate(14, (_) => 'assets/images/istanbul.png'),
          placeCount: 4,
          rating: 4.3,
          review: 5,
        ),
        CityModel(
          name: 'Istanbul',
          imageUrls: List.generate(14, (_) => 'assets/images/istanbul.png'),
          placeCount: 7,
          rating: 4.9,
          review: 12,
        ),
        CityModel(
          name: 'Ankara',
          imageUrls: List.generate(14, (_) => 'assets/images/istanbul.png'),
          placeCount: 4,
          rating: 4.3,
          review: 5,
        ),
      ],
    ),
  ].obs;

  Rx<CountryModel?> selectedCountry = Rx<CountryModel?>(null);

  bool get isDefaultView => type.value.isEmpty || index.value == -1;

  void selectLocation(String selectedType, int selectedIndex) {
    type.value = selectedType;
    index.value = selectedIndex;

    if (selectedType == 'country' &&
        selectedIndex >= 0 &&
        selectedIndex < countries.length) {
      selectedCountry.value = countries[selectedIndex];
      selectedCityIndex.value = -1; // Reset city selection
    } else if (selectedType == 'city' &&
        selectedCountry.value != null &&
        selectedIndex >= 0 &&
        selectedIndex < selectedCountry.value!.cities.length) {
      selectedCityIndex.value = selectedIndex;
    } else {
      selectedCountry.value = countries.isNotEmpty ? countries[0] : null;
      selectedCityIndex.value = -1;
    }
  }
}
