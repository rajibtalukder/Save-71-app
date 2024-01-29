// To parse this JSON data, do
//
//     final currencyCodeModel = currencyCodeModelFromJson(jsonString);

import 'dart:convert';

CurrencyCodeModel currencyCodeModelFromJson(String str) => CurrencyCodeModel.fromJson(json.decode(str));

String currencyCodeModelToJson(CurrencyCodeModel data) => json.encode(data.toJson());

class CurrencyCodeModel {
  bool? status;
  String? countryName;
  String? currencyCode;
  String? countryCode;

  CurrencyCodeModel({
     this.status,
     this.countryName,
     this.currencyCode,
     this.countryCode,
  });

  factory CurrencyCodeModel.fromJson(Map<String, dynamic> json) => CurrencyCodeModel(
    status: json["status"],
    countryName: json["countryName"],
    currencyCode: json["currencyCode"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "countryName": countryName,
    "currencyCode": currencyCode,
    "countryCode": countryCode,
  };
}
