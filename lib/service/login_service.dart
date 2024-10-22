import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/model/login_model.dart';

import '../presentation/splash_screen/view/onboarding_screen.dart';


class AuthService {
  final Dio _dio = Dio();

  Future<LoginResponse> login(String phoneNo) async {
    try {
      log('Initiating login for phone number: $phoneNo');

      // Send login request to the server
      final response = await _dio.post(
        'https://vyapar-ot57.onrender.com/api/auth/login',
        data: {'phoneNo': phoneNo},
      );

      log('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        log('Login successful, saving phone number...');

        // Save the phone number in shared preferences after successful login
        await _savePhoneNumber(phoneNo);
        return LoginResponse.fromJson(response.data);
      } else {
        log('Login failed with status code: ${response.statusCode}');
        throw Exception('Failed to log in: ${response.statusCode}');
      }
    } catch (e) {
      log('Error during login: $e');
      throw Exception('Failed to log in: $e');
    }
  }

  // Method to save phone number in SharedPreferences
  Future<void> _savePhoneNumber(String phoneNo) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('phoneNo', phoneNo);
      log('Phone number saved successfully: $phoneNo');
    } catch (e) {
      log('Error saving phone number: $e');
    }
  }

  // Method to retrieve the stored phone number from SharedPreferences
  Future<String?> getPhoneNumber() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? phoneNo = prefs.getString('phoneNo');
      log('Retrieved phone number from storage: $phoneNo');
      return phoneNo;
    } catch (e) {
      log('Error retrieving phone number: $e');
      return null;
    }
  }

  // Method to logout and clear stored phone number from SharedPreferences
  Future<void> logout() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('phoneNo');
      log('Phone number removed from storage');

      // Navigate to SplashScreen after logout
      Get.offAll(() => OnboardingScreen());
    } catch (e) {
      log('Error during logout: $e');
    }
  }
}
