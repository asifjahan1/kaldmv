class TSFSItem {
  final String place;
  final String title;
  final String subTitle;
  final String location;
  final String imagePath;
  final double rating;
  final bool isClosed;
  final String provider;
  bool isBookmarked;
  final String category;

  TSFSItem({
    required this.place,
    required this.title,
    required this.subTitle,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.isClosed,
    required this.provider,
    this.isBookmarked = false,
    required this.category,
  });

  factory TSFSItem.fromJson(Map<String, dynamic> json) {
    return TSFSItem(
      place: json['place'] ?? '',
      title: json['title'] ?? '',
      subTitle: json['subTitle'] ?? '',
      location: json['location'] ?? '',
      imagePath: json['imagePath'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      isClosed: json['isClosed'] ?? false,
      isBookmarked: json['isBookmarked'] ?? false,
      provider: json['provider'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place': place,
      'title': title,
      'subTitle': subTitle,
      'location': location,
      'imagePath': imagePath,
      'rating': rating,
      'isClosed': isClosed,
      'isBookmarked': isBookmarked,
      'provider': provider,
      'category': category,
    };
  }

  TSFSItem copyWith({
    String? place,
    String? title,
    String? subTitle,
    String? location,
    String? imagePath,
    double? rating,
    bool? isClosed,
    bool? isBookmarked,
    String? provider,
    String? category,

  }) {
    return TSFSItem(
      place: place ?? this.place,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      location: location ?? this.location,
      imagePath: imagePath ?? this.imagePath,
      rating: rating ?? this.rating,
      isClosed: isClosed ?? this.isClosed,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      provider: provider ?? this.provider,
      category: category ?? this.category,
    );
  }
}
