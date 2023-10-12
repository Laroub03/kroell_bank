import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kroell_bank/model/BankingModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

// For fetching the profile:
// final profile = await _httpClientService.fetchProfile(UserData().clientId!, UserData().jwtToken!);

class HttpClientService {
  HttpClient? _httpClient;

  // Initialize the HTTP client with SSL certificate and private key
  Future<void> initializeHttpClient() async {
    if (_httpClient == null) {
      if (!kIsWeb) {
        // Load the Certificate Authority (CA) data from assets
        ByteData caData = await rootBundle.load('assets/rootCA.pem');
        // Load the client certificate data from assets
        ByteData certData =
            await rootBundle.load('assets/fluttertest+4-client.pem');
        // Load the private key data from assets
        ByteData keyData =
            await rootBundle.load('assets/fluttertest+4-client-key.pem');

        // Convert ByteData to Uint8List for certificate and key
        List<int> caBytes = caData.buffer.asUint8List();
        List<int> certBytes = certData.buffer.asUint8List();
        List<int> keyBytes = keyData.buffer.asUint8List();

        // Create a security context and configure it with the CA, certificate, and private key
        SecurityContext secContext = SecurityContext(withTrustedRoots: true)
          ..setTrustedCertificatesBytes(caBytes)
          ..useCertificateChainBytes(certBytes)
          ..usePrivateKeyBytes(keyBytes);

        // Initialize the HttpClient with the configured security context
        _httpClient = HttpClient(context: secContext);
      } else {
        // For web, just provide a default HttpClient without any security context
        _httpClient = HttpClient();
      }
    }
  }

  // Get the initialized HTTP client
  Future<HttpClient> getHttpClient() async {
    if (_httpClient == null) {
      // If the HTTP client is not yet initialized, call the initialization function
      await initializeHttpClient();
    }
    return _httpClient!;
  }

  Future<List<dynamic>> fetchProfile(int clientId, String token) async {
    final httpClient = await getHttpClient();
    final request = await httpClient.postUrl(
      Uri.parse('https://10.0.2.2:8443/api/BankAPI/FetchProfile'),
    );

    request.headers.set('Content-Type', 'application/json');
    request.headers.set('Authorization', 'Bearer $token');

    request.write(jsonEncode({
      'Client_Id': clientId,
    }));

    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      return jsonDecode(responseBody);
    } else {
      throw Exception('Failed to fetch profile');
    }
  }

  Future<String> makeTransfer(int senderID, String receiverCardNumber,
      double amount, String token) async {
    final httpClient = await getHttpClient();
    final request = await httpClient.postUrl(
      Uri.parse('https://10.0.2.2:8443/api/BankAPI/MakeTransfer'),
    );

    request.headers.set('Content-Type', 'application/json');
    request.headers.set('Authorization', 'Bearer $token');

    request.write(jsonEncode({
      'SenderID': senderID,
      'ReceiverCardNumber': receiverCardNumber,
      'TransferAmount': amount,
    }));

    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      return responseBody;
    } else {
      throw Exception('Failed to make transfer');
    }
  }

  Future<List<dynamic>> getTransactions(int accountId, String token) async {
    final httpClient = await getHttpClient();
    final request = await httpClient.postUrl(
      Uri.parse('https://10.0.2.2:8443/api/BankAPI/GetTransactions'),
    );

    request.headers.set('Content-Type', 'application/json');
    request.headers.set('Authorization', 'Bearer $token');

    request.write(jsonEncode({
      'AccountID': accountId,
    }));

    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      return jsonDecode(responseBody);
    } else {
      throw Exception('Failed to get transactions');
    }
  }

  Future<List<CardInfo>> getCard(String username) async {
    final httpClient = await getHttpClient();
    final request = await httpClient.postUrl(
      Uri.parse('https://10.0.2.2:8443/api/BankAPI/GetCard'),
    );

    // Set request headers for JSON data
    request.headers.set('Content-Type', 'application/json');

    final prefs = await SharedPreferences.getInstance();
    final account_Id = prefs.getInt('account_id');

    print('Fetching card data for account ID: $account_Id'); // Print the account ID for debugging

    // Data to be sent to fetch card info
    final cardData = {
      'account_Id': account_Id
    };

    request.write(jsonEncode(cardData));

    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      final List<dynamic> parsedJson = jsonDecode(responseBody);

      if (parsedJson.isEmpty) {
         print('No card data available for account ID: $account_Id');
         // Handle this case in the UI, e.g., show a message to the user
         return []; // Return an empty list
      } else {
         return parsedJson.map((json) => CardInfo.fromJson(json)).toList();
      }
    } else {
      throw Exception('Failed to fetch card info');
    }
  }
}
