// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  bool? status;
  String? message;
  List<SortedShop>? sortedShops;
  double? currRate;
  String? currencyCode;
  List<Product>? product;
  List<ProductImage>? productImage;
  List<dynamic>? video;
  List<AllProduct>? images;
  List<dynamic>? faq;
  List<dynamic>? ratings;
  List<AllProduct>? allProducts;
  List<ExtraCat>? extraCat;
  List<SubCat>? subCat;
  List<MainCat>? mainCat;
  List<AllCat>? allCat;
  List<User>? user;

  ProductDetailsModel({
    this.status,
    this.message,
    this.sortedShops,
    this.currRate,
    this.currencyCode,
    this.product,
    this.productImage,
    this.video,
    this.images,
    this.faq,
    this.ratings,
    this.allProducts,
    this.extraCat,
    this.subCat,
    this.mainCat,
    this.allCat,
    this.user,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    status: json["status"],
    message: json["message"],
    sortedShops: List<SortedShop>.from(json["sortedShops"].map((x) => SortedShop.fromJson(x))),
    currRate: json["currRate"]?.toDouble(),
    currencyCode: json["currencyCode"],
    product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    productImage: List<ProductImage>.from(json["productImage"].map((x) => ProductImage.fromJson(x))),
    video: List<dynamic>.from(json["video"].map((x) => x)),
    images: List<AllProduct>.from(json["images"].map((x) => AllProduct.fromJson(x))),
    faq: List<dynamic>.from(json["faq"].map((x) => x)),
    ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
    allProducts: List<AllProduct>.from(json["allProducts"].map((x) => AllProduct.fromJson(x))),
    extraCat: List<ExtraCat>.from(json["extraCat"].map((x) => ExtraCat.fromJson(x))),
    subCat: List<SubCat>.from(json["subCat"].map((x) => SubCat.fromJson(x))),
    mainCat: List<MainCat>.from(json["mainCat"].map((x) => MainCat.fromJson(x))),
    allCat: List<AllCat>.from(json["allCat"].map((x) => AllCat.fromJson(x))),
    user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "sortedShops": List<dynamic>.from(sortedShops!.map((x) => x.toJson())),
    "currRate": currRate,
    "currencyCode": currencyCode,
    "product": List<dynamic>.from(product!.map((x) => x.toJson())),
    "productImage": List<dynamic>.from(productImage!.map((x) => x.toJson())),
    "video": List<dynamic>.from(video!.map((x) => x)),
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "faq": List<dynamic>.from(faq!.map((x) => x)),
    "ratings": List<dynamic>.from(ratings!.map((x) => x)),
    "allProducts": List<dynamic>.from(allProducts!.map((x) => x.toJson())),
    "extraCat": List<dynamic>.from(extraCat!.map((x) => x.toJson())),
    "subCat": List<dynamic>.from(subCat!.map((x) => x.toJson())),
    "mainCat": List<dynamic>.from(mainCat!.map((x) => x.toJson())),
    "allCat": List<dynamic>.from(allCat!.map((x) => x.toJson())),
    "user": List<dynamic>.from(user!.map((x) => x.toJson())),
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
  CatId extraCatId;
  ExtraCatRef extraCatRef;
  String extraCatName;
  String extraCatImageUrl;
  double extraCatDeductAmount;
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
    extraCatId: catIdValues.map[json["extra_cat_id"]]!,
    extraCatRef: extraCatRefValues.map[json["extra_cat_ref"]]!,
    extraCatName: json["extra_cat_name"],
    extraCatImageUrl: json["extra_cat_image_url"],
    extraCatDeductAmount: json["extra_cat_deduct_amount"]?.toDouble(),
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
    "extra_cat_id": catIdValues.reverse[extraCatId],
    "extra_cat_ref": extraCatRefValues.reverse[extraCatRef],
    "extra_cat_name": extraCatName,
    "extra_cat_image_url": extraCatImageUrl,
    "extra_cat_deduct_amount": extraCatDeductAmount,
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
  };
}

enum CatId {
  EXTRACAT_245,
  EXTRACAT_280,
  EXTRACAT_329,
  EXTRACAT_338,
  EXTRACAT_377,
  EXTRACAT_461,
  EXTRACAT_462,
  EXTRACAT_509,
  EXTRACAT_521,
  EXTRACAT_522,
  EXTRACAT_527,
  EXTRACAT_529
}

final catIdValues = EnumValues({
  "extracat-245": CatId.EXTRACAT_245,
  "extracat-280": CatId.EXTRACAT_280,
  "extracat-329": CatId.EXTRACAT_329,
  "extracat-338": CatId.EXTRACAT_338,
  "extracat-377": CatId.EXTRACAT_377,
  "extracat-461": CatId.EXTRACAT_461,
  "extracat-462": CatId.EXTRACAT_462,
  "extracat-509": CatId.EXTRACAT_509,
  "extracat-521": CatId.EXTRACAT_521,
  "extracat-522": CatId.EXTRACAT_522,
  "extracat-527": CatId.EXTRACAT_527,
  "extracat-529": CatId.EXTRACAT_529
});

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

class AllProduct {
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
  int? id;
  String? productImageUrl;
  int? featuredImage;

  AllProduct({
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
    this.id,
    this.productImageUrl,
    this.featuredImage,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
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
    productImageUrl: json["product_image_url"],
    featuredImage: json["featured_image"],
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
    "product_image_url": productImageUrl,
    "featured_image": featuredImage,
  };
}

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
  String extraCatName;
  String extraCatImageUrl;
  int popularCatValue;
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
    extraCatName: json["extra_cat_name"],
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
    "extra_cat_name": extraCatName,
    "extra_cat_image_url": extraCatImageUrl,
    "popular_cat_value": popularCatValue,
    "extra_cat_deduct_amount": extraCatDeductAmount,
  };
}

class ProductImage {
  int id;
  int productId;
  String productImageUrl;
  int featuredImage;

  ProductImage({
    required this.id,
    required this.productId,
    required this.productImageUrl,
    required this.featuredImage,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    productId: json["product_id"],
    productImageUrl: json["product_image_url"],
    featuredImage: json["featured_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_image_url": productImageUrl,
    "featured_image": featuredImage,
  };
}

class SortedShop {
  int id;
  int sellerUserId;
  String shopName;
  String shopLocationLt;
  String shopLocationLong;
  String shopNumber;
  int shopType;
  double distanceMeters;
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
    distanceMeters: json["distanceMeters"]?.toDouble(),
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

class User {
  int userId;
  String userName;
  String userEmail;
  String userPassword;
  DateTime dateOfBirth;
  String gender;
  String referenceId;
  String ownRefId;
  String picUrl;
  String phone;
  int regCompleted;
  int id;
  int sellerUserId;
  String shopName;
  String shopLocationLt;
  String shopLocationLong;
  String shopNumber;
  int shopType;

  User({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.dateOfBirth,
    required this.gender,
    required this.referenceId,
    required this.ownRefId,
    required this.picUrl,
    required this.phone,
    required this.regCompleted,
    required this.id,
    required this.sellerUserId,
    required this.shopName,
    required this.shopLocationLt,
    required this.shopLocationLong,
    required this.shopNumber,
    required this.shopType,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    userPassword: json["user_password"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    gender: json["gender"],
    referenceId: json["reference_id"],
    ownRefId: json["own_ref_id"],
    picUrl: json["pic_url"],
    phone: json["phone"],
    regCompleted: json["reg_completed"],
    id: json["id"],
    sellerUserId: json["seller_user_id"],
    shopName: json["shop_name"],
    shopLocationLt: json["shop_location_lt"],
    shopLocationLong: json["shop_location_long"],
    shopNumber: json["shop_number"],
    shopType: json["shop_type"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "user_email": userEmail,
    "user_password": userPassword,
    "date_of_birth": dateOfBirth.toIso8601String(),
    "gender": gender,
    "reference_id": referenceId,
    "own_ref_id": ownRefId,
    "pic_url": picUrl,
    "phone": phone,
    "reg_completed": regCompleted,
    "id": id,
    "seller_user_id": sellerUserId,
    "shop_name": shopName,
    "shop_location_lt": shopLocationLt,
    "shop_location_long": shopLocationLong,
    "shop_number": shopNumber,
    "shop_type": shopType,
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
