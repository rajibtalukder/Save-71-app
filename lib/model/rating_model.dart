// To parse this JSON data, do
//
//     final ratingModel = ratingModelFromJson(jsonString);

import 'dart:convert';

RatingModel ratingModelFromJson(String str) => RatingModel.fromJson(json.decode(str));

String ratingModelToJson(RatingModel data) => json.encode(data.toJson());

class RatingModel {
  bool? status;
  String? message;
  Rating? rating;

  RatingModel({
     this.status,
     this.message,
     this.rating,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
    status: json["status"],
    message: json["message"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "rating": rating?.toJson(),
  };
}

class Rating {
  int id;
  int productId;
  int userId;
  int reviewStar;
  String reviewDes;

  Rating({
    required this.id,
    required this.productId,
    required this.userId,
    required this.reviewStar,
    required this.reviewDes,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    id: json["id"],
    productId: json["product_id"],
    userId: json["user_id"],
    reviewStar: json["review_star"],
    reviewDes: json["review_des"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "user_id": userId,
    "review_star": reviewStar,
    "review_des": reviewDes,
  };
}
