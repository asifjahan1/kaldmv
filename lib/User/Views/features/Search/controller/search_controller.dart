// controllers/search_controller.dart
import 'package:get/get.dart';
import '../model/city_model.dart';
import '../model/country_model.dart';

class SearchhController extends GetxController {
  RxString type = ''.obs;
  RxInt index = (-1).obs;

  bool get isDefaultView => type.value.isEmpty || index.value == -1;

  void selectLocation(String selectedType, int selectedIndex) {
    type.value = selectedType;
    index.value = selectedIndex;

    if (selectedType == 'country') {
      selectedCountry.value = CountryModel(
        name: 'Saudi Arabia',
        region: 'Middle East',
        weather: '31°C with cloudy rain',
        currency: 'Saudi Arabian Riyal (SAR)',
        language: 'Arabic',
        bestTimeToVisit: 'Arabic',
        headerImage: 'assets/images/saudi_arabia.png',
        cities: [
          CityModel(
            name: 'London',
            imageUrls: [
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
              'assets/images/uk.png',
            ],
            placeCount: 6,
            rating: 4.7,
            review: 0,
          ),
          CityModel(
            name: 'AlUla',
            imageUrls: [
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
              'assets/images/iran.png',
            ],
            placeCount: 4,
            rating: 4.6,
            review: 1,
          ),
          CityModel(
            name: 'Taif',
            imageUrls: [
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
              'assets/images/ksa.png',
            ],
            placeCount: 5,
            rating: 4.4,
            review: 3,
          ),
          CityModel(
            name: 'Jeddah',
            imageUrls: [
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
              'assets/images/ksa1.png',
            ],
            placeCount: 4,
            rating: 4.1,
            review: 2,
          ),
          CityModel(
            name: 'Medina',
            imageUrls: [
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
              'assets/images/ksa2.png',
            ],
            placeCount: 6,
            rating: 4.4,
            review: 4,
          ),
          CityModel(
            name: 'Bait Ul Mamur',
            imageUrls: [
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
              'assets/images/istanbul.png',
            ],
            placeCount: 4,
            rating: 4.2,
            review: 5,
          ),
        ],
      );
    }
  }

  Rx<CountryModel?> selectedCountry = Rx<CountryModel?>(null);
}
