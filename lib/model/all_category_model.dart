// To parse this JSON data, do
//
//     final allCategoryModel = allCategoryModelFromJson(jsonString);

import 'dart:convert';

AllCategoryModel allCategoryModelFromJson(String str) => AllCategoryModel.fromJson(json.decode(str));

String allCategoryModelToJson(AllCategoryModel data) => json.encode(data.toJson());

class AllCategoryModel {
  bool? status;
  List<MainCat>? mainCat;
  List<SubCat>? subCat;
  List<ExtraCat>? extraCat;
  List<AllCat>? allCat;
  List<Image>? images;
  double? currRate;
  List<dynamic>? cart;
  String? currencyCode;

  AllCategoryModel({
    this.status,
    this.mainCat,
    this.subCat,
    this.extraCat,
    this.allCat,
    this.images,
    this.currRate,
    this.cart,
    this.currencyCode,
  });

  factory AllCategoryModel.fromJson(Map<String, dynamic> json) => AllCategoryModel(
    status: json["status"],
    mainCat: List<MainCat>.from(json["mainCat"].map((x) => MainCat.fromJson(x))),
    subCat: List<SubCat>.from(json["subCat"].map((x) => SubCat.fromJson(x))),
    extraCat: List<ExtraCat>.from(json["extraCat"].map((x) => ExtraCat.fromJson(x))),
    allCat: List<AllCat>.from(json["allCat"].map((x) => AllCat.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    currRate: json["currRate"]?.toDouble(),
    cart: List<dynamic>.from(json["cart"].map((x) => x)),
    currencyCode: json["currencyCode"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mainCat": List<dynamic>.from(mainCat!.map((x) => x.toJson())),
    "subCat": List<dynamic>.from(subCat!.map((x) => x.toJson())),
    "extraCat": List<dynamic>.from(extraCat!.map((x) => x.toJson())),
    "allCat": List<dynamic>.from(allCat!.map((x) => x.toJson())),
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "currRate": currRate,
    "cart": List<dynamic>.from(cart!.map((x) => x)),
    "currencyCode": currencyCode,
  };
}

class AllCat {
  int id;
  ExtraCatRef subCatId;
  MainCatId subCatRef;
  SubCatName subCatName;
  String subCatImageUrl;
  int? popularCatValue;
  MainCatId mainCatId;
  MainCatName mainCatName;
  dynamic mainCatImageUrl;
  String extraCatId;
  ExtraCatRef extraCatRef;
  String extraCatName;
  String extraCatImageUrl;
  double extraCatDeductAmount;
  int productId;
  String productName;
  double productPrice;
  String productShortDes;
  String productDetailsDes;
  String productCatId;
  int sellerId;
  int sellCount;
  int quantity;
  int status;
  int adminPublished;
  int isBranded;

  AllCat({
    required this.id,
    required this.subCatId,
    required this.subCatRef,
    required this.subCatName,
    required this.subCatImageUrl,
    required this.popularCatValue,
    required this.mainCatId,
    required this.mainCatName,
    required this.mainCatImageUrl,
    required this.extraCatId,
    required this.extraCatRef,
    required this.extraCatName,
    required this.extraCatImageUrl,
    required this.extraCatDeductAmount,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productShortDes,
    required this.productDetailsDes,
    required this.productCatId,
    required this.sellerId,
    required this.sellCount,
    required this.quantity,
    required this.status,
    required this.adminPublished,
    required this.isBranded,
  });

  factory AllCat.fromJson(Map<String, dynamic> json) => AllCat(
    id: json["id"],
    subCatId: extraCatRefValues.map[json["sub_cat_id"]]!,
    subCatRef: mainCatIdValues.map[json["sub_cat_ref"]]!,
    subCatName: subCatNameValues.map[json["sub_cat_name"]]!,
    subCatImageUrl: json["sub_cat_image_url"],
    popularCatValue: json["popular_cat_value"],
    mainCatId: mainCatIdValues.map[json["main_cat_id"]]!,
    mainCatName: mainCatNameValues.map[json["main_cat_name"]]!,
    mainCatImageUrl: json["main_cat_image_url"],
    extraCatId: json["extra_cat_id"],
    extraCatRef: extraCatRefValues.map[json["extra_cat_ref"]]!,
    extraCatName: json["extra_cat_name"],
    extraCatImageUrl: json["extra_cat_image_url"],
    extraCatDeductAmount: json["extra_cat_deduct_amount"]?.toDouble(),
    productId: json["product_id"],
    productName: json["product_name"],
    productPrice: json["product_price"]?.toDouble(),
    productShortDes: json["product_short_des"],
    productDetailsDes: json["product_details_des"],
    productCatId: json["product_cat_id"],
    sellerId: json["seller_id"],
    sellCount: json["sell_count"],
    quantity: json["quantity"],
    status: json["status"],
    adminPublished: json["admin_published"],
    isBranded: json["is_branded"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sub_cat_id": extraCatRefValues.reverse[subCatId],
    "sub_cat_ref": mainCatIdValues.reverse[subCatRef],
    "sub_cat_name": subCatNameValues.reverse[subCatName],
    "sub_cat_image_url": subCatImageUrl,
    "popular_cat_value": popularCatValue,
    "main_cat_id": mainCatIdValues.reverse[mainCatId],
    "main_cat_name": mainCatNameValues.reverse[mainCatName],
    "main_cat_image_url": mainCatImageUrl,
    "extra_cat_id": extraCatId,
    "extra_cat_ref": extraCatRefValues.reverse[extraCatRef],
    "extra_cat_name": extraCatName,
    "extra_cat_image_url": extraCatImageUrl,
    "extra_cat_deduct_amount": extraCatDeductAmount,
    "product_id": productId,
    "product_name": productName,
    "product_price": productPrice,
    "product_short_des": productShortDes,
    "product_details_des": productDetailsDes,
    "product_cat_id": productCatId,
    "seller_id": sellerId,
    "sell_count": sellCount,
    "quantity": quantity,
    "status": status,
    "admin_published": adminPublished,
    "is_branded": isBranded,
  };
}

enum ExtraCatRef {
  SUBCAT_101,
  SUBCAT_38,
  SUBCAT_50,
  SUBCAT_55,
  SUBCAT_56,
  SUBCAT_97
}

final extraCatRefValues = EnumValues({
  "subcat-101": ExtraCatRef.SUBCAT_101,
  "subcat-38": ExtraCatRef.SUBCAT_38,
  "subcat-50": ExtraCatRef.SUBCAT_50,
  "subcat-55": ExtraCatRef.SUBCAT_55,
  "subcat-56": ExtraCatRef.SUBCAT_56,
  "subcat-97": ExtraCatRef.SUBCAT_97
});

enum MainCatId {
  MAINCAT_10,
  MAINCAT_11,
  MAINCAT_13,
  MAINCAT_69
}

final mainCatIdValues = EnumValues({
  "maincat-10": MainCatId.MAINCAT_10,
  "maincat-11": MainCatId.MAINCAT_11,
  "maincat-13": MainCatId.MAINCAT_13,
  "maincat-69": MainCatId.MAINCAT_69
});

enum MainCatName {
  AGRICULTURE_GROCERY,
  BOOKS_STATIONERY,
  CLOTHING,
  MEDICINE_SURGICAL
}

final mainCatNameValues = EnumValues({
  "Agriculture & Grocery": MainCatName.AGRICULTURE_GROCERY,
  "Books & Stationery": MainCatName.BOOKS_STATIONERY,
  "Clothing": MainCatName.CLOTHING,
  "Medicine & Surgical": MainCatName.MEDICINE_SURGICAL
});

enum SubCatName {
  AGRICULTURE,
  BEVERAGES,
  BOOKS,
  BOY_S_CLOTHING,
  SURGICAL,
  WOMEN_S_CLOTHING
}

final subCatNameValues = EnumValues({
  "Agriculture": SubCatName.AGRICULTURE,
  "Beverages": SubCatName.BEVERAGES,
  "Books": SubCatName.BOOKS,
  "Boy's Clothing": SubCatName.BOY_S_CLOTHING,
  "Surgical": SubCatName.SURGICAL,
  "Women's Clothing": SubCatName.WOMEN_S_CLOTHING
});

class ExtraCat {
  int id;
  String extraCatId;
  String extraCatRef;
  String extraCatName;
  String extraCatImageUrl;
  int? popularCatValue;
  double extraCatDeductAmount;

  ExtraCat({
    required this.id,
    required this.extraCatId,
    required this.extraCatRef,
    required this.extraCatName,
    required this.extraCatImageUrl,
    required this.popularCatValue,
    required this.extraCatDeductAmount,
  });

  factory ExtraCat.fromJson(Map<String, dynamic> json) => ExtraCat(
    id: json["id"],
    extraCatId: json["extra_cat_id"],
    extraCatRef: json["extra_cat_ref"],
    extraCatName: json["extra_cat_name"],
    extraCatImageUrl: json["extra_cat_image_url"],
    popularCatValue: json["popular_cat_value"],
    extraCatDeductAmount: json["extra_cat_deduct_amount"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "extra_cat_id": extraCatId,
    "extra_cat_ref": extraCatRef,
    "extra_cat_name": extraCatName,
    "extra_cat_image_url": extraCatImageUrl,
    "popular_cat_value": popularCatValue,
    "extra_cat_deduct_amount": extraCatDeductAmount,
  };
}

class Image {
  int productId;
  String productName;
  double productPrice;
  String productShortDes;
  String productDetailsDes;
  String productCatId;
  int sellerId;
  int sellCount;
  int quantity;
  int status;
  int adminPublished;
  int isBranded;
  int id;
  String productImageUrl;
  int featuredImage;

  Image({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productShortDes,
    required this.productDetailsDes,
    required this.productCatId,
    required this.sellerId,
    required this.sellCount,
    required this.quantity,
    required this.status,
    required this.adminPublished,
    required this.isBranded,
    required this.id,
    required this.productImageUrl,
    required this.featuredImage,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    productId: json["product_id"],
    productName: json["product_name"],
    productPrice: json["product_price"]?.toDouble(),
    productShortDes: json["product_short_des"],
    productDetailsDes: json["product_details_des"],
    productCatId: json["product_cat_id"],
    sellerId: json["seller_id"],
    sellCount: json["sell_count"],
    quantity: json["quantity"],
    status: json["status"],
    adminPublished: json["admin_published"],
    isBranded: json["is_branded"],
    id: json["id"],
    productImageUrl: json["product_image_url"],
    featuredImage: json["featured_image"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_price": productPrice,
    "product_short_des": productShortDes,
    "product_details_des": productDetailsDes,
    "product_cat_id": productCatId,
    "seller_id": sellerId,
    "sell_count": sellCount,
    "quantity": quantity,
    "status": status,
    "admin_published": adminPublished,
    "is_branded": isBranded,
    "id": id,
    "product_image_url": productImageUrl,
    "featured_image": featuredImage,
  };
}

class MainCat {
  int id;
  String mainCatId;
  String mainCatName;
  dynamic mainCatImageUrl;
  dynamic popularCatValue;

  MainCat({
    required this.id,
    required this.mainCatId,
    required this.mainCatName,
    required this.mainCatImageUrl,
    required this.popularCatValue,
  });

  factory MainCat.fromJson(Map<String, dynamic> json) => MainCat(
    id: json["id"],
    mainCatId: json["main_cat_id"],
    mainCatName: json["main_cat_name"],
    mainCatImageUrl: json["main_cat_image_url"],
    popularCatValue: json["popular_cat_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main_cat_id": mainCatId,
    "main_cat_name": mainCatName,
    "main_cat_image_url": mainCatImageUrl,
    "popular_cat_value": popularCatValue,
  };
}

class SubCat {
  int id;
  String subCatId;
  String subCatRef;
  String subCatName;
  String subCatImageUrl;
  dynamic popularCatValue;

  SubCat({
    required this.id,
    required this.subCatId,
    required this.subCatRef,
    required this.subCatName,
    required this.subCatImageUrl,
    required this.popularCatValue,
  });

  factory SubCat.fromJson(Map<String, dynamic> json) => SubCat(
    id: json["id"],
    subCatId: json["sub_cat_id"],
    subCatRef: json["sub_cat_ref"],
    subCatName: json["sub_cat_name"],
    subCatImageUrl: json["sub_cat_image_url"],
    popularCatValue: json["popular_cat_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sub_cat_id": subCatId,
    "sub_cat_ref": subCatRef,
    "sub_cat_name": subCatName,
    "sub_cat_image_url": subCatImageUrl,
    "popular_cat_value": popularCatValue,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
