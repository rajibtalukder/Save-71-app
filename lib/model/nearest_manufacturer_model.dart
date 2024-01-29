// To parse this JSON data, do
//
//     final nearestManufacturerModel = nearestManufacturerModelFromJson(jsonString);

import 'dart:convert';

NearestManufacturerModel nearestManufacturerModelFromJson(String str) => NearestManufacturerModel.fromJson(json.decode(str));

String nearestManufacturerModelToJson(NearestManufacturerModel data) => json.encode(data.toJson());

class NearestManufacturerModel {
  bool? status;
  String? message;
  String? currencyCode;
  double? currRate;
  List<Product>? products;
  List<Image>? images;
  List<SubCat>? subCat;
  List<MainCat>? mainCat;
  List<ExtraCat>? extraCat;
  List<ExtraCat>? allExtraCat;
  List<AllCat>? allCat;
  List<SortedShop>? sortedShops;
  int? shopType;

  NearestManufacturerModel({
     this.status,
     this.message,
     this.currencyCode,
     this.currRate,
     this.products,
     this.images,
     this.subCat,
     this.mainCat,
     this.extraCat,
     this.allExtraCat,
     this.allCat,
     this.sortedShops,
     this.shopType,
  });

  factory NearestManufacturerModel.fromJson(Map<String, dynamic> json) => NearestManufacturerModel(
    status: json["status"],
    message: json["message"],
    currencyCode: json["currencyCode"],
    currRate: json["currRate"]?.toDouble(),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    subCat: List<SubCat>.from(json["subCat"].map((x) => SubCat.fromJson(x))),
    mainCat: List<MainCat>.from(json["mainCat"].map((x) => MainCat.fromJson(x))),
    extraCat: List<ExtraCat>.from(json["extraCat"].map((x) => ExtraCat.fromJson(x))),
    allExtraCat: List<ExtraCat>.from(json["allExtraCat"].map((x) => ExtraCat.fromJson(x))),
    allCat: List<AllCat>.from(json["allCat"].map((x) => AllCat.fromJson(x))),
    sortedShops: List<SortedShop>.from(json["sortedShops"].map((x) => SortedShop.fromJson(x))),
    shopType: json["shopType"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "currencyCode": currencyCode,
    "currRate": currRate,
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "subCat": List<dynamic>.from(subCat!.map((x) => x.toJson())),
    "mainCat": List<dynamic>.from(mainCat!.map((x) => x.toJson())),
    "extraCat": List<dynamic>.from(extraCat!.map((x) => x.toJson())),
    "allExtraCat": List<dynamic>.from(allExtraCat!.map((x) => x.toJson())),
    "allCat": List<dynamic>.from(allCat!.map((x) => x.toJson())),
    "sortedShops": List<dynamic>.from(sortedShops!.map((x) => x.toJson())),
    "shopType": shopType,
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

class Product {
  int productId;
  String productName;
  double productPrice;
  String productShortDes;
  String productDetailsDes;
  CatId productCatId;
  int sellerId;
  int sellCount;
  int quantity;
  int status;
  int adminPublished;
  int isBranded;
  int id;
  CatId extraCatId;
  ExtraCatRef extraCatRef;
  ExtraCatName extraCatName;
  String extraCatImageUrl;
  int? popularCatValue;
  double extraCatDeductAmount;

  Product({
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
    required this.extraCatId,
    required this.extraCatRef,
    required this.extraCatName,
    required this.extraCatImageUrl,
    required this.popularCatValue,
    required this.extraCatDeductAmount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    productName: json["product_name"],
    productPrice: json["product_price"]?.toDouble(),
    productShortDes: json["product_short_des"],
    productDetailsDes: json["product_details_des"],
    productCatId: catIdValues.map[json["product_cat_id"]]!,
    sellerId: json["seller_id"],
    sellCount: json["sell_count"],
    quantity: json["quantity"],
    status: json["status"],
    adminPublished: json["admin_published"],
    isBranded: json["is_branded"],
    id: json["id"],
    extraCatId: catIdValues.map[json["extra_cat_id"]]!,
    extraCatRef: extraCatRefValues.map[json["extra_cat_ref"]]!,
    extraCatName: extraCatNameValues.map[json["extra_cat_name"]]!,
    extraCatImageUrl: json["extra_cat_image_url"],
    popularCatValue: json["popular_cat_value"],
    extraCatDeductAmount: json["extra_cat_deduct_amount"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_price": productPrice,
    "product_short_des": productShortDes,
    "product_details_des": productDetailsDes,
    "product_cat_id": catIdValues.reverse[productCatId],
    "seller_id": sellerId,
    "sell_count": sellCount,
    "quantity": quantity,
    "status": status,
    "admin_published": adminPublished,
    "is_branded": isBranded,
    "id": id,
    "extra_cat_id": catIdValues.reverse[extraCatId],
    "extra_cat_ref": extraCatRefValues.reverse[extraCatRef],
    "extra_cat_name": extraCatNameValues.reverse[extraCatName],
    "extra_cat_image_url": extraCatImageUrl,
    "popular_cat_value": popularCatValue,
    "extra_cat_deduct_amount": extraCatDeductAmount,
  };
}

enum CatId {
  EXTRACAT_461,
  EXTRACAT_462,
  EXTRACAT_509,
  EXTRACAT_521,
  EXTRACAT_522,
  EXTRACAT_529
}

final catIdValues = EnumValues({
  "extracat-461": CatId.EXTRACAT_461,
  "extracat-462": CatId.EXTRACAT_462,
  "extracat-509": CatId.EXTRACAT_509,
  "extracat-521": CatId.EXTRACAT_521,
  "extracat-522": CatId.EXTRACAT_522,
  "extracat-529": CatId.EXTRACAT_529
});

enum ExtraCatName {
  AGRICULTURE_EQUIPMENT,
  AGRICULTURE_LAND,
  DRY_FRUITS_NUTS,
  FRUITS,
  SPORTS_BOOKS,
  VEGETABLES
}

final extraCatNameValues = EnumValues({
  "Agriculture Equipment": ExtraCatName.AGRICULTURE_EQUIPMENT,
  "Agriculture Land": ExtraCatName.AGRICULTURE_LAND,
  "Dry Fruits & Nuts": ExtraCatName.DRY_FRUITS_NUTS,
  "Fruits": ExtraCatName.FRUITS,
  "Sports Books": ExtraCatName.SPORTS_BOOKS,
  "Vegetables": ExtraCatName.VEGETABLES
});

class SortedShop {
  int id;
  int sellerUserId;
  String shopName;
  String shopLocationLt;
  String shopLocationLong;
  String shopNumber;
  int shopType;
  String distanceMeters;
  String distanceKm;

  SortedShop({
    required this.id,
    required this.sellerUserId,
    required this.shopName,
    required this.shopLocationLt,
    required this.shopLocationLong,
    required this.shopNumber,
    required this.shopType,
    required this.distanceMeters,
    required this.distanceKm,
  });

  factory SortedShop.fromJson(Map<String, dynamic> json) => SortedShop(
    id: json["id"],
    sellerUserId: json["seller_user_id"],
    shopName: json["shop_name"],
    shopLocationLt: json["shop_location_lt"],
    shopLocationLong: json["shop_location_long"],
    shopNumber: json["shop_number"],
    shopType: json["shop_type"],
    distanceMeters: json["distanceMeters"],
    distanceKm: json["distanceKm"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_user_id": sellerUserId,
    "shop_name": shopName,
    "shop_location_lt": shopLocationLt,
    "shop_location_long": shopLocationLong,
    "shop_number": shopNumber,
    "shop_type": shopType,
    "distanceMeters": distanceMeters,
    "distanceKm": distanceKm,
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
