// To parse this JSON data, do
//
//     final addCartModel = addCartModelFromJson(jsonString);

import 'dart:convert';

AddCartModel addCartModelFromJson(String str) => AddCartModel.fromJson(json.decode(str));

String addCartModelToJson(AddCartModel data) => json.encode(data.toJson());

class AddCartModel {
  bool status;
  String message;
  List<Order> order;
  List<OrderDetail> orderDetails;

  AddCartModel({
    required this.status,
    required this.message,
    required this.order,
    required this.orderDetails,
  });

  factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
    status: json["status"],
    message: json["message"],
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
    orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
  };
}

class Order {
  int orderId;
  int userId;
  int orderStatus;
  int sellerId;
  DateTime placedDate;
  DateTime deliveryDate;
  int requestReview;
  int inCart;
  int sellerConfirm;
  int isPaid;
  int isAreaShop;
  int deliveryCharge;
  dynamic address;
  String returnReason;

  Order({
    required this.orderId,
    required this.userId,
    required this.orderStatus,
    required this.sellerId,
    required this.placedDate,
    required this.deliveryDate,
    required this.requestReview,
    required this.inCart,
    required this.sellerConfirm,
    required this.isPaid,
    required this.isAreaShop,
    required this.deliveryCharge,
    required this.address,
    required this.returnReason,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    userId: json["user_id"],
    orderStatus: json["order_status"],
    sellerId: json["seller_id"],
    placedDate: DateTime.parse(json["placed_date"]),
    deliveryDate: DateTime.parse(json["delivery_date"]),
    requestReview: json["request_review"],
    inCart: json["in_cart"],
    sellerConfirm: json["seller_confirm"],
    isPaid: json["is_paid"],
    isAreaShop: json["is_areaShop"],
    deliveryCharge: json["deliveryCharge"],
    address: json["address"],
    returnReason: json["return_reason"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "user_id": userId,
    "order_status": orderStatus,
    "seller_id": sellerId,
    "placed_date": placedDate.toIso8601String(),
    "delivery_date": deliveryDate.toIso8601String(),
    "request_review": requestReview,
    "in_cart": inCart,
    "seller_confirm": sellerConfirm,
    "is_paid": isPaid,
    "is_areaShop": isAreaShop,
    "deliveryCharge": deliveryCharge,
    "address": address,
    "return_reason": returnReason,
  };
}

class OrderDetail {
  int orderDetailsId;
  int orderId;
  int productId;
  int productQuantity;
  double productTotalPrice;
  dynamic noteToUser;
  int stockOut;
  double deductPrice;

  OrderDetail({
    required this.orderDetailsId,
    required this.orderId,
    required this.productId,
    required this.productQuantity,
    required this.productTotalPrice,
    required this.noteToUser,
    required this.stockOut,
    required this.deductPrice,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    orderDetailsId: json["order_details_id"],
    orderId: json["order_id"],
    productId: json["product_id"],
    productQuantity: json["product_quantity"],
    productTotalPrice: json["product_total_price"]?.toDouble(),
    noteToUser: json["note_to_user"],
    stockOut: json["stock_out"],
    deductPrice: json["deduct_price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "order_details_id": orderDetailsId,
    "order_id": orderId,
    "product_id": productId,
    "product_quantity": productQuantity,
    "product_total_price": productTotalPrice,
    "note_to_user": noteToUser,
    "stock_out": stockOut,
    "deduct_price": deductPrice,
  };
}
