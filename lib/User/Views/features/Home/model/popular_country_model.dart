class PopularCountryModel {
  final String id;
  final String city;
  final int count;
  final String countryThumbnail;

  PopularCountryModel({
    required this.id,
    required this.city,
    required this.count,
    required this.countryThumbnail,
  });

  factory PopularCountryModel.fromJson(Map<String, dynamic> json) {
    return PopularCountryModel(
      id: json['id'] ?? '',
      city: json['city'] ?? '',
      count: json['count'] ?? 0,
      countryThumbnail: json['countryThumbnail'] ?? '',
    );
  }
}
