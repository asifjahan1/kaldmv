class TSFSItem {
  final String title;
  final String subTitle;
  final String location;
  final String imagePath;
  final double rating;
  final bool isClosed;
  final String provider;
  bool isBookmarked;

  TSFSItem({
    required this.title,
    required this.subTitle,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.isClosed,
    required this.provider,
    this.isBookmarked = false,
  });

  factory TSFSItem.fromJson(Map<String, dynamic> json) {
    return TSFSItem(
      title: json['title'] ?? '',
      subTitle: json['subTitle'] ?? '',
      location: json['location'] ?? '',
      imagePath: json['imagePath'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      isClosed: json['isClosed'] ?? false,
      isBookmarked: json['isBookmarked'] ?? false,
      provider: json['provider'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subTitle': subTitle,
      'location': location,
      'imagePath': imagePath,
      'rating': rating,
      'isClosed': isClosed,
      'isBookmarked': isBookmarked,
      'provider': provider,
    };
  }

  TSFSItem copyWith({
    String? title,
    String? subTitle,
    String? location,
    String? imagePath,
    double? rating,
    bool? isClosed,
    bool? isBookmarked,
    String? provider,

  }) {
    return TSFSItem(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      location: location ?? this.location,
      imagePath: imagePath ?? this.imagePath,
      rating: rating ?? this.rating,
      isClosed: isClosed ?? this.isClosed,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      provider: provider ?? this.provider,
    );
  }
}
