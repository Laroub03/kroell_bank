// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'BankingTransferSuccessful.dart';
import 'package:kroell_bank/services/http_client_service.dart';
import 'BankingLogin.dart';
import 'package:kroell_bank/model/BankingModel.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingSlider.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';

// Create a stateful widget for the banking transfer screen
class BankingTransfer extends StatefulWidget {
  @override
  _BankingTransferState createState() => _BankingTransferState();
}

class _BankingTransferState extends State<BankingTransfer> {
  bool isSwitch = false;
  bool isGetOtp = false;
  var tapCount = 0;
  final HttpClientService _httpClientService = HttpClientService();
  CardInfo? _cardInfo;

  void tappedConfirm() {
    if (tapCount != 1) {
      BankingTransferSuccessful().launch(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCardInfo();
  }

  Future<void> _fetchCardInfo() async {
    try {
      if (UserData().username != null) {
        List<CardInfo> cards =
            await _httpClientService.getCard(UserData().username!);

        print(cards);

        if (cards.isNotEmpty) {
          setState(() {
            _cardInfo = cards.first;
          });
        }
      } else {
        print("Username is null");
      }
    } catch (e) {
      print("Error fetching card details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              Text(
                Banking_lbl_Transfer,
                style: primaryTextStyle(
                    color: Banking_TextColorPrimary,
                    size: 26,
                    fontFamily: fontBold),
              ),
              10.height,
              Text("Choose Account to Transfer",
                  style: primaryTextStyle(
                      color: Banking_TextColorSecondary,
                      size: 14,
                      fontFamily: fontBold)),
              16.height,
              BankingSliderWidget(), // Custom widget for a slider
              16.height,
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Card Number",
                      border: InputBorder.none,
                    ),
                    style: primaryTextStyle(
                        color: Banking_TextColorPrimary,
                        size: 16,
                        fontFamily: fontRegular),
                  ),
                  Divider(height: 24),
                  Row(
                    children: [
                      Text("\$",
                          style: primaryTextStyle(
                              color: Banking_TextColorPrimary,
                              size: 16,
                              fontFamily: fontRegular)),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Amount",
                            border: InputBorder.none,
                          ),
                          style: primaryTextStyle(
                              color: Banking_TextColorPrimary,
                              size: 16,
                              fontFamily: fontRegular),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Save this Beneficiary",
                          style: primaryTextStyle(
                              color: Banking_TextColorSecondary,
                              size: 16,
                              fontFamily: fontRegular)),
                      Switch(
                        value: isSwitch,
                        onChanged: (value) {
                          setState(() {
                            isSwitch = value;
                            print(isSwitch);
                          });
                        },
                        activeTrackColor: Banking_Primary.withOpacity(0.5),
                        activeColor: Banking_Primary,
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  16.height,
                  BankingButton(
                      textContent: Banking_lbl_Confirm,
                      onPressed: () {
                        setState(
                          () {
                            tapCount = tapCount + 1;
                            tappedConfirm();
                          },
                        );
                      }).visible(isSwitch == true),
                  24.height,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
