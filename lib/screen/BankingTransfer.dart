// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'BankingTransferSuccessful.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingSlider.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';

// Create a stateful widget for the banking transfer screen
class BankingTransfer extends StatefulWidget {
  static var tag = "/BankingTransfer";

  @override
  _BankingTransferState createState() => _BankingTransferState();
}

class _BankingTransferState extends State<BankingTransfer> {
  // Define state variables
  bool isSwitch = false; // Indicates whether the "Save this Beneficiary" switch is on
  var tapCount = 0; // Keeps track of how many times the Confirm button is tapped

  // Function to handle the Confirm button tap
  void tappedConfirm() {
    if (tapCount != 1) {
      // Launch the BankingTransferSuccessful screen if the button is tapped for the first time
      BankingTransferSuccessful().launch(context);
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
                      hintText: "Account Number",
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
                      Text("\$", style: primaryTextStyle(
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

// Custom dialog widget
class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

// Function to create the content for the custom dialog
dialogContent(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
    decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(10),
        backgroundColor: Banking_whitePureColor),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        8.height,
        Text(Banking_lbl_Same_Bank,
                style: primaryTextStyle(
                    color: Banking_TextColorSecondary,
                    size: 16,
                    fontFamily: fontRegular))
            .onTap(() {
          finish(context);
        }),
        8.height,
        Divider(thickness: 1.0, color: Banking_greyColor.withOpacity(0.5)),
        8.height,
        Text(Banking_lbl_Other_Bank,
                style: primaryTextStyle(
                    color: Banking_TextColorSecondary,
                    size: 16,
                    fontFamily: fontRegular))
            .onTap(() {
          finish(context);
        }),
        8.height,
        Divider(thickness: 1.0, color: Banking_greyColor.withOpacity(0.5)),
        8.height,
        Text(Banking_lbl_Credit_Card,
                style: primaryTextStyle(
                    color: Banking_TextColorSecondary,
                    size: 16,
                    fontFamily: fontRegular))
            .onTap(() {
          finish(context);
        }),
        8.height,
      ],
    ),
  );
}
