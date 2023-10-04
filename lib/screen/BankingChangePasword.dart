import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';

class BankingChangePassword extends StatefulWidget {
  static var tag = "/BankingChangePassword";

  @override
  _BankingChangePasswordState createState() => _BankingChangePasswordState();
}

class _BankingChangePasswordState extends State<BankingChangePassword> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void changePassword() async {
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;

    // Validate if the fields are not empty
    if (oldPassword.isEmpty || newPassword.isEmpty) {
        toasty(context, 'Please fill in all fields');
        return;
    }

    // Here, you'd typically make an API call to validate the old password 
    // and then change to the new password. For this example, I'll use a 
    // dummy logic.

    if (oldPassword == "currentPasswordFromServer") { // Replace with actual validation
        // Update the password on the server with newPassword
        // ...

        toasty(context, 'Password Successfully Changed');
        finish(context);
    } else {
        toasty(context, 'Old password is incorrect');
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
                      const Icon(Icons.chevron_left,
                              size: 25, color: Banking_blackColor)
                          .onTap(
                        () {
                          finish(context);
                        },
                      ),
                      20.height,
                      Text("Change\nPassword",
                          style: boldTextStyle(
                              size: 30, color: Banking_TextColorPrimary)),
                    ],
                  ),
                  20.height,
                  EditText(
                      controller: _oldPasswordController,
                      text: "Old Password", 
                      isPassword: true, 
                      isSecure: true
                  ),
                  16.height,
                  EditText(
                      controller: _newPasswordController,
                      text: "New Password", 
                      isPassword: true, 
                      isSecure: true
                  ),
                  16.height,
                  40.height,
                  BankingButton(
                      textContent: Banking_lbl_Confirm,
                      onPressed: changePassword,
                  ),
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
