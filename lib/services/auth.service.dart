import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class AuthService {
  final String loginUrl = 'https://localhost:8443/api/Auth/login';
  final String registerUrl = 'https://localhost:8443/api/Auth/register';
  final ValueNotifier<bool> _isAuthenticatedNotifier = ValueNotifier<bool>(false);

  // Getter to access the current authentication status
  bool get isAuthenticatedValue => _isAuthenticatedNotifier.value;

  AuthService() {
    _isAuthenticatedNotifier.value = false; // initial value
  }

  // Method to handle user login
  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    print('Login response: ${response.body}');
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      // Store the token in local storage and set authentication status to true
      // You would need a plugin/package like shared_preferences to store token in Flutter
      // For simplicity, this is omitted here
  _isAuthenticatedNotifier.value = true;
      return true;
    }
    return false;
  }

  // Method to handle user registration
  Future<bool> register(String username, String password) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    final responseData = jsonDecode(response.body);
    print('Register response: ${responseData}');
    if (response.statusCode == 200 && responseData['username'] != null) {
      // If a username is received, registration is successful
      return true;
    }
    return false;
  }

  void dispose() {
    _isAuthenticatedNotifier.dispose();
  }
}
