// profile_model.dart
class ProfileModel {
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? faxNumber;
  String? email;
  String? skypeUrl;
  String? facebookUrl;
  String? twitterUrl;
  String? instagramUrl;
  String? youtubeUrl;
  String? pinterestUrl;
  String? linkedinUrl;
  String? websiteUrl;

  ProfileModel({
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.faxNumber,
    this.email,
    this.skypeUrl,
    this.facebookUrl,
    this.twitterUrl,
    this.instagramUrl,
    this.youtubeUrl,
    this.pinterestUrl,
    this.linkedinUrl,
    this.websiteUrl,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'mobileNumber': mobileNumber,
    'faxNumber': faxNumber,
    'email': email,
    'skypeUrl': skypeUrl,
    'facebookUrl': facebookUrl,
    'twitterUrl': twitterUrl,
    'instagramUrl': instagramUrl,
    'youtubeUrl': youtubeUrl,
    'pinterestUrl': pinterestUrl,
    'linkedinUrl': linkedinUrl,
    'websiteUrl': websiteUrl,
  };

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    firstName: json['firstName'],
    lastName: json['lastName'],
    mobileNumber: json['mobileNumber'],
    faxNumber: json['faxNumber'],
    email: json['email'],
    skypeUrl: json['skypeUrl'],
    facebookUrl: json['facebookUrl'],
    twitterUrl: json['twitterUrl'],
    instagramUrl: json['instagramUrl'],
    youtubeUrl: json['youtubeUrl'],
    pinterestUrl: json['pinterestUrl'],
    linkedinUrl: json['linkedinUrl'],
    websiteUrl: json['websiteUrl'],
  );
}
