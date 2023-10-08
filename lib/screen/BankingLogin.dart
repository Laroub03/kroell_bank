// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kroell_bank/model/BankingModel.dart';
import 'package:nb_utils/nb_utils.dart';
import 'BankingDashboard.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';
import 'package:kroell_bank/services/http_client_service.dart';
import 'dart:convert';

class BankingLogin extends StatefulWidget {
  @override
  _BankingLoginState createState() => _BankingLoginState();
}

class UserData {
  static final UserData _singleton = UserData._internal();

  factory UserData() {
    return _singleton;
  }

  UserData._internal();

  String? username;
  BankingCardModel? userCard;
}


class _BankingLoginState extends State<BankingLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final HttpClientService _httpClientService = HttpClientService();
  String message = '';

  // Function to perform user login
  Future<void> login() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
    setState(() {
      message = "Username or password cannot be blank. Please try again!";
    });
    return;
  }

    try {
      final httpClient = await _httpClientService.getHttpClient();
      final request = await httpClient.postUrl(
        Uri.parse('https://10.0.2.2:8443/api/Auth/login'),
      );

      // Set request headers for JSON data
      request.headers.set('Content-Type', 'application/json');

      // Data to be sent for login
      final loginData = {
        'username': _usernameController.text,
        'password': _passwordController.text,
      };

      request.write(jsonEncode(loginData));

      final response = await request.close();

      if (response.statusCode == 200) {
        // Login successful
        final responseBody = await response.transform(utf8.decoder).join();

        setState(() {
          message = 'Login successful';
        });

        UserData().username = _usernameController.text;

          // Mock user card data
          UserData().userCard = BankingCardModel(
            name: _usernameController.text,
            rs: "12,500",
            accountNumber: "1121 *** ** *** 1555",
          );

        // Navigate to the BankingDashboard screen upon successful login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BankingDashboard()),
        );
      } else {
        // Login failed
        final responseBody = await response.transform(utf8.decoder).join();
        print('Login Failed - Response Status Code: ${response.statusCode}');
        print('Login Failed - Response Body: $responseBody');
        setState(() {
          message = 'Login failed';
        });
      }
    } catch (error) {
      // Handle any errors that occur during login
      print('Login Error: $error');
      setState(() {
        message = 'Error: $error';
      });
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(Icons.chevron_left,
                              size: 25, color: Banking_blackColor)
                          .onTap(
                        () {
                          finish(context);
                        },
                      ),
                      160.height,
                      Text("Login",
                          style: boldTextStyle(
                              size: 30, color: Banking_TextColorPrimary)),
                    ],
                  ),
                  20.height,
                  EditText(
                    text: "Username", 
                    isPassword: false,
                    mController: _usernameController
                    ),
                  16.height,
                  EditText(
                    text: "Password", 
                    isPassword: true, 
                    isSecure: true,
                    mController: _passwordController
                    ),
                  20.height,
                  BankingButton(
                      textContent: Banking_lbl_Login,
                      onPressed: login),
                  Text(message),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              Banking_lbl_app_Name.toUpperCase(),
              style: primaryTextStyle(
                  color: Banking_TextColorSecondary,
                  size: 18,
                  fontFamily: fontRegular),
            ),
          ).paddingBottom(16),
        ],
      ),
    );
  }
}