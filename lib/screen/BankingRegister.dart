// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';
import 'package:kroell_bank/services/http_client_service.dart';
import 'dart:convert';
import '../utils/BankingContants.dart';

class BankingRegister extends StatefulWidget {
  static var tag = "/BankingRegister";

  @override
  _BankingRegisterState createState() => _BankingRegisterState();
}

class _BankingRegisterState extends State<BankingRegister> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final HttpClientService _httpClientService = HttpClientService();
  String message = '';

Future<void> register() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
    setState(() {
      message = "Username or password cannot be blank. Please try again!";
    });
    return;
  }

  try {
    final httpClient = await _httpClientService.getHttpClient();
    final request = await httpClient.postUrl(
      Uri.parse('https://10.0.2.2:8443/api/Auth/register'),
    );

    // Set request headers for JSON data
    request.headers.set('Content-Type', 'application/json');

    // Data to be sent for registration
    final registrationData = {
      'username': _usernameController.text,
      'password': _passwordController.text,
    };

    // Encode registration data as JSON and write it to the request
    request.write(jsonEncode(registrationData));

    // Send the request and receive the response
    final response = await request.close();

    if (response.statusCode == 200) {
      // Registration successful
      final responseBody = await response.transform(utf8.decoder).join();

      setState(() {
        message = 'Registration successful';
      });
    } else {
      // Registration failed
      final responseBody = await response.transform(utf8.decoder).join();
      print(
          'Registration Failed - Response Status Code: ${response.statusCode}');
      print('Registration Failed - Response Body: $responseBody');
      setState(() {
        message = 'Registration failed';
      });
    }
  } catch (error) {
    // Handle any errors that occur during registration
    print('Registration Error: $error');
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
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.chevron_left,
                              size: 25, color: Banking_blackColor)
                          .onTap(
                        () {
                          finish(context);
                        },
                      ),
                      160.height,
                      Text("Register",
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
                      textContent: Banking_lbl_Register,
                      onPressed: register),
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