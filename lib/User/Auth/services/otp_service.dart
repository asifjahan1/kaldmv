import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPService extends GetxService {
  Future<void> verifyOTP({
    required String email,
    required String otp,
    required bool isForSignUp,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (otp != '1234') throw Exception('Invalid OTP');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
    await prefs.setString('user_email', email);

    final userType = prefs.getString('user_type') ?? '';
    if (userType.isEmpty) {
      throw Exception('User type missing. Please register again.');
    }
  }

  Future<void> resendOTP(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    // Here you would typically hit your backend to resend OTP
  }
}
