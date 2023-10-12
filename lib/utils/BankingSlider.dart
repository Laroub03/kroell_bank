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
import 'package:kroell_bank/services/http_client_service.dart'; // Import the HttpClientService

class BankingSliderWidget extends StatefulWidget {
  static String tag = '/BankingSlider';

  const BankingSliderWidget({Key? key}) : super(key: key);

  @override
  BankingSliderWidgetState createState() => BankingSliderWidgetState();
}

class BankingSliderWidgetState extends State<BankingSliderWidget> {
  var currentIndexPage = 0;
  List<CardInfo> mList = [];
  final HttpClientService _httpClientService = HttpClientService(); // Create an instance of HttpClientService

  @override
  void initState() {
    super.initState();
    _fetchCardDetails();
    mList = mockCardData; // Use mock data
  }

    List<CardInfo> mockCardData = [
    CardInfo(
      client_Name: "Bob Swagger",
      card_Nr: "1234 5678 9012 3456",
      cvv: 123,
      expire_Date: DateTime.now().add(Duration(days: 365)),
      spending_Limit: 5000,
      balance: 1000
    )
  ];


  Future<void> _fetchCardDetails() async {
    try {
      List<CardInfo> cards = await _httpClientService.getCard(UserData().username!);
      if (cards.isNotEmpty) {
        setState(() {
          mList = cards;
        });
      }
    } catch (e) {
      print("Error fetching card details: $e");
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
                              Text(mList[index].client_Name,
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
                          35.height,
                          Text(mList[index].card_Nr,
                              style: primaryTextStyle(
                                  color: Banking_whitePureColor,
                                  size: 18,
                                  fontFamily: fontMedium)),
                          8.height,
                          Text("\$${mList[index].balance}",
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
