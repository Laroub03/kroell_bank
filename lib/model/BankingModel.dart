import 'package:flutter/cupertino.dart';

class BankingShareInfoModel {
  String icon = "";

  BankingShareInfoModel(this.icon);
}

class BankingQuesAnsModel {
  String ques = "";

  BankingQuesAnsModel(this.ques);
}

class BankingSavingModel {
  String? title = "";
  String? date = "";
  String? rs = "";
  String? interest = "";

  BankingSavingModel({this.title, this.date, this.rs, this.interest});
}


class BankingPaymentModel {
  String? title = "";
  String? img = "";
  Color? color;

  BankingPaymentModel({this.title, this.img, this.color});
}

class BankingCardModel {
  String? name = "";
  String? bank = "";
  String? rs = "";
  String? cardNr;

  BankingCardModel({this.name, this.bank, this.rs, this.cardNr});
}

class CardInfo {
  final String client_Name;
  final String card_Nr;
  final int cvv;
  final DateTime expire_Date;
  final double spending_Limit;
  final double balance;

  CardInfo({
    required this.client_Name,
    required this.card_Nr,
    required this.cvv,
    required this.expire_Date,
    required this.spending_Limit,
    required this.balance,
  });

  // Factory constructor to create an instance of CardInfo from a map
  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
      client_Name: json['client_Name'],
      card_Nr: json['card_Nr'],
      cvv: json['cvv'],
      expire_Date: DateTime.parse(json['expire_Date']),
      spending_Limit: json['spending_Limit'].toDouble(),
      balance: json['balance'].toDouble(),
    );
  }
}

class Login {
   final String jwtToken;
   final int account_Id;
   final int client_Id;

   Login({
    required this.jwtToken,
    required this.account_Id,
    required this.client_Id,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      jwtToken: json['jwtToken'],
      account_Id: json['account_Id'],
      client_Id: json['client_Id'],
    );
  }
}


class BankingPaymentHistoryModel {
  String? title = "";
  String? rs = "";

  BankingPaymentHistoryModel({this.title, this.rs});
}

class BankingRateInfoModel {
  String? currency = "";
  String? flag = "";
  String? buy = "";
  String? sell = "";

  BankingRateInfoModel({this.currency, this.flag, this.buy, this.sell});
}

class BankingHomeModel {
  String? title = "";
  Color? color;
  String? bal = "";

  BankingHomeModel({this.title, this.color, this.bal});
}

class BankingLocationModel {
  String? location = "";
  String? m = "";

  BankingLocationModel({this.location, this.m});
}

class BankingHomeModel2 {
  String? title = "";
  String? icon = "";
  Color? color;
  String? charge = "";

  BankingHomeModel2({this.title, this.icon, this.color, this.charge});
}


