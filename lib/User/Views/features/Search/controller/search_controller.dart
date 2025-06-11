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
            imageUrl: 'assets/images/uk.png',
            placeCount: 6,
          ),
          CityModel(
            name: 'AlUla',
            imageUrl: 'assets/images/iran.png',
            placeCount: 4,
          ),
          CityModel(
            name: 'Taif',
            imageUrl: 'assets/images/ksa.png',
            placeCount: 5,
          ),
          CityModel(
            name: 'Jeddah',
            imageUrl: 'assets/images/ksa1.png',
            placeCount: 4,
          ),
          CityModel(
            name: 'Medina',
            imageUrl: 'assets/images/ksa2.png',
            placeCount: 6,
          ),
          CityModel(
            name: 'Bait Ul Mamur',
            imageUrl: 'assets/images/istanbul.png',
            placeCount: 4,
          ),
        ],
      );
    }
  }

  Rx<CountryModel?> selectedCountry = Rx<CountryModel?>(null);
}
