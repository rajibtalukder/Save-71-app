// To parse this JSON data, do
//
//     final searchResultModel = searchResultModelFromJson(jsonString);

import 'dart:convert';

SearchResultModel searchResultModelFromJson(String str) => SearchResultModel.fromJson(json.decode(str));

String searchResultModelToJson(SearchResultModel data) => json.encode(data.toJson());

class SearchResultModel {
  bool? status;
  String? message;
  List<SearchSuggestion>? searchSuggestions;

  SearchResultModel({
    this.status,
    this.message,
    this.searchSuggestions,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => SearchResultModel(
    status: json["status"],
    message: json["message"],
    searchSuggestions: List<SearchSuggestion>.from(json["search_suggestions"].map((x) => SearchSuggestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "search_suggestions": List<dynamic>.from(searchSuggestions!.map((x) => x.toJson())),
  };
}

class SearchSuggestion {
  String name;
  Type type;
  int id;
  double? price;
  double currRate;
  CurrencyCode currencyCode;
  String? productImageUrl;

  SearchSuggestion({
    required this.name,
    required this.type,
    required this.id,
    required this.price,
    required this.currRate,
    required this.currencyCode,
    this.productImageUrl,
  });

  factory SearchSuggestion.fromJson(Map<String, dynamic> json) => SearchSuggestion(
    name: json["name"],
    type: typeValues.map[json["type"]]!,
    id: json["id"],
    price: json["price"]?.toDouble(),
    currRate: json["currRate"]?.toDouble(),
    currencyCode: currencyCodeValues.map[json["currencyCode"]]!,
    productImageUrl: json["product_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": typeValues.reverse[type],
    "id": id,
    "price": price,
    "currRate": currRate,
    "currencyCode": currencyCodeValues.reverse[currencyCode],
    "product_image_url": productImageUrl,
  };
}

enum CurrencyCode {
  BDT
}

final currencyCodeValues = EnumValues({
  "BDT": CurrencyCode.BDT
});

enum Type {
  PRODUCT,
  SHOP
}

final typeValues = EnumValues({
  "product": Type.PRODUCT,
  "shop": Type.SHOP
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
