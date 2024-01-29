import 'dart:convert';

class UserModel {
  bool status;
  String message;
  UserInfo userInfo;

  UserModel({
    required this.status,
    required this.message,
    required this.userInfo,
  });

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    userInfo: UserInfo.fromJson(json["userInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "userInfo": userInfo.toJson(),
  };
}

class UserInfo {
  int id;
  int sellerUserId;
  String shopName;
  String shopLocationLt;
  String shopLocationLong;
  String shopNumber;
  int shopType;
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

  UserInfo({
    required this.id,
    required this.sellerUserId,
    required this.shopName,
    required this.shopLocationLt,
    required this.shopLocationLong,
    required this.shopNumber,
    required this.shopType,
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
  });

  factory UserInfo.fromRawJson(String str) => UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    sellerUserId: json["seller_user_id"],
    shopName: json["shop_name"],
    shopLocationLt: json["shop_location_lt"],
    shopLocationLong: json["shop_location_long"],
    shopNumber: json["shop_number"],
    shopType: json["shop_type"],
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
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_user_id": sellerUserId,
    "shop_name": shopName,
    "shop_location_lt": shopLocationLt,
    "shop_location_long": shopLocationLong,
    "shop_number": shopNumber,
    "shop_type": shopType,
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
  };
}
