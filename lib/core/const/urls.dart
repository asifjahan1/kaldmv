class ApiUrl {
  static const String baseUrl1 ="https://ai.tamshyah.com";
  static const String baseUrl = "https://api.tamshyah.com";
  static const String generateItnerary =
      "$baseUrl1/api/v1/travel/generate-itinerary";
  static const String createUser = "$baseUrl/api/v1/users/create";
  static const String loginUser = "$baseUrl/api/v1/auth/login";
  static const String loginAdmin = "$baseUrl/api/v1/auth/login-admin";
  static const String refreshToken = "$baseUrl/api/v1/auth/refresh-token";
  static const String resetPasswordReq = "$baseUrl/api/v1/auth/reset-password-req";
  static const String resetPassword = "$baseUrl/api/v1/auth/reset-password";
  static const String changePassword = "$baseUrl/api/v1/auth/password-change";
  static const String logout = "$baseUrl/api/v1/auth/logout";
}
