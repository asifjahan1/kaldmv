class CityModel {
  final String place;
  final String name;
  final List<String> imageUrls;
  final int placeCount;
  final double? rating;
  final int? review;
  final Map<String, double>? categoryRatings;

  CityModel({
    required this.place,
    required this.name,
    required this.imageUrls,
    required this.placeCount,
    this.rating,
    this.review,
    this.categoryRatings,
  });
}
