// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? status;
  String? message;
  double? currRate;
  String? currencyCode;
  List<ImageProd>? products;
  List<ImageProd>? images;

  ProductModel({
    this.status,
    this.message,
    this.currRate,
    this.currencyCode,
    this.products,
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    status: json["status"],
    message: json["message"],
    currRate: json["currRate"]?.toDouble(),
    currencyCode: json["currencyCode"],
    products: List<ImageProd>.from(json["products"].map((x) => ImageProd.fromJson(x))),
    images: List<ImageProd>.from(json["images"].map((x) => ImageProd.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "currRate": currRate,
    "currencyCode": currencyCode,
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class ImageProd {
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
  int sellerUserId;
  String shopName;
  String shopLocationLt;
  String shopLocationLong;
  String shopNumber;
  int shopType;
  String? productImageUrl;
  int? featuredImage;

  ImageProd({
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
    required this.sellerUserId,
    required this.shopName,
    required this.shopLocationLt,
    required this.shopLocationLong,
    required this.shopNumber,
    required this.shopType,
    this.productImageUrl,
    this.featuredImage,
  });

  factory ImageProd.fromJson(Map<String, dynamic> json) => ImageProd(
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
    sellerUserId: json["seller_user_id"],
    shopName: json["shop_name"],
    shopLocationLt: json["shop_location_lt"],
    shopLocationLong: json["shop_location_long"],
    shopNumber: json["shop_number"],
    shopType: json["shop_type"],
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
    "seller_user_id": sellerUserId,
    "shop_name": shopName,
    "shop_location_lt": shopLocationLt,
    "shop_location_long": shopLocationLong,
    "shop_number": shopNumber,
    "shop_type": shopType,
    "product_image_url": productImageUrl,
    "featured_image": featuredImage,
  };
}
