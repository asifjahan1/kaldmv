import 'city_model.dart';

class CountryModel {
  final String name;
  final String region;
  final String weather;
  final String currency;
  final String language;
  final String bestTimeToVisit;
  final String headerImage;
  final List<CityModel> cities;

  CountryModel({
    required this.name,
    required this.region,
    required this.weather,
    required this.currency,
    required this.language,
    required this.bestTimeToVisit,
    required this.headerImage,
    required this.cities,
  });
}
