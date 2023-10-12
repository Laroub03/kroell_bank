import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kroell_bank/screen/BankingLogin.dart';
import 'package:nb_utils/nb_utils.dart';
import '../model/BankingModel.dart';

import 'BankingColors.dart';
import 'BankingContants.dart';
import 'BankingDataGenerator.dart';
import 'BankingImages.dart';
import 'BankingStrings.dart';

class BankingSliderWidget extends StatefulWidget {
  static String tag = '/BankingSlider';

  const BankingSliderWidget({Key? key}) : super(key: key);

  @override
  BankingSliderWidgetState createState() => BankingSliderWidgetState();
}

class BankingSliderWidgetState extends State<BankingSliderWidget> {
  var currentIndexPage = 0;
  late List<BankingCardModel> mList;

  @override
  void initState() {
    super.initState();
    if (UserData().userCard != null) {
        mList = [UserData().userCard!];
    } else {
        mList = []; // Or provide a default value or handle this case appropriately
    }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 8, right: 16),
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 320,
                child: Stack(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 320,
                        child: Image.asset(Banking_ic_CardImage,
                            fit: BoxFit.fill)),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.height,
                          Row(
                            children: [
                              Text(mList[currentIndexPage].name.validate(),
                                      style: primaryTextStyle(
                                          color: Banking_whitePureColor,
                                          size: 18,
                                          fontFamily: fontMedium))
                                  .expand(),
                              Text(Banking_lbl_app_Name,
                                  style: primaryTextStyle(
                                      color: Banking_whitePureColor,
                                      size: 16,
                                      fontFamily: fontMedium))
                            ],
                          ),
                          24.height,
                          Text(mList[currentIndexPage].bank.validate(),
                              style: primaryTextStyle(
                                  color: Banking_whitePureColor,
                                  size: 18,
                                  fontFamily: fontMedium)),
                          4.height,
                          Text(UserData().userCard!.cardNr!,
                              style: primaryTextStyle(
                                  color: Banking_whitePureColor,
                                  size: 18,
                                  fontFamily: fontMedium)),
                          8.height,
                          Text("\$${mList[currentIndexPage].rs.validate()}",
                              style: primaryTextStyle(
                                  color: Banking_whitePureColor,
                                  size: 18,
                                  fontFamily: fontMedium)),
                        ],
                      ),
                    ),
                    10.height,
                  ],
                ).paddingRight(16),
              );
            },
          ),
        ),
      ],
    );
  }
}
