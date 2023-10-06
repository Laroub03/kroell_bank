import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';



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
}
