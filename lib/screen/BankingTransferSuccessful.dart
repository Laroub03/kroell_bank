import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';
import 'package:kroell_bank/services/notification_service.dart';

class BankingTransferSuccessful extends StatefulWidget {
  static var tag = "/BankingTransferSuccessful";

  @override
  _BankingTransferSuccessfulState createState() =>
      _BankingTransferSuccessfulState();
}

class _BankingTransferSuccessfulState extends State<BankingTransferSuccessful> {

  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _showTransferSuccessNotification();
  }

  _showTransferSuccessNotification() {
    // Create a RemoteMessage for the local notification
    RemoteMessage message = const RemoteMessage(
      notification: RemoteNotification(
        title: "Transfer Successful",
        body: "Your bank transfer was successful!",
        android: AndroidNotification(
          channelId: "transfer_success_channel", // You can define a new channel ID for this
        ),
      ),
    );

    _notificationService.showTransferSuccessNotification(message);
  }

 
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Banking_whitePureColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            8.height,
            headerView(Banking_lbl_Transfer_Successful, width * 0.4, context),
            24.height,
            Image.asset(Banking_ic_walk2,
                height: width * 0.6, width: width, fit: BoxFit.cover),
            24.height,
            Text(Banking_lbl_Info_Transfer_Successful,
                    style: secondaryTextStyle(
                        color: Banking_TextColorSecondary, size: 18),
                    textAlign: TextAlign.center)
                .center(),
            8.height,
            BankingButton(
                    textContent: Banking_lbl_Transaction_History,
                    onPressed: () {})
                .paddingOnly(
                    top: spacing_standard_new,
                    left: spacing_standard_new,
                    right: spacing_standard_new,
                    bottom: spacing_standard),
          ],
        ),
      ),
    );
  }
}
