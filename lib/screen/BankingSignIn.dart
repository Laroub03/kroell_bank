import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'BankingDashboard.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';
import 'package:kroell_bank/services/http_client_service.dart';
import 'dart:convert';
import 'BankingRegister.dart';
import 'BankingLogin.dart';

class BankingSignIn extends StatelessWidget {
  const BankingSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BankingRegister()),
                );
              },
              child: const Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BankingLogin()),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

