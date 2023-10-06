import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screen/BankingSignin.dart';
import 'services/notification_service.dart';



Future<void> main() async {
  if(!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    NotificationService notificationService = NotificationService();
    if (kDebugMode) {
      print("token: ${await notificationService.getDeviceToken()}");
    }

  }
  
  runApp(const MyApp());
}


@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  debugPrint("Handling in Background: ${message.messageId}");
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking UI Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BankingSignIn(),
    );
  }
}
