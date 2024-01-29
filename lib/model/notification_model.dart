// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  bool? status;
  String? message;
  List<Notification>? notifications;

  NotificationModel({
     this.status,
     this.message,
     this.notifications,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"],
    message: json["message"],
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "notifications": List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class Notification {
  int notificationId;
  int userId;
  String notification;
  String url;
  int isRead;

  Notification({
    required this.notificationId,
    required this.userId,
    required this.notification,
    required this.url,
    required this.isRead,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    notificationId: json["notification_id"],
    userId: json["user_id"],
    notification: json["notification"],
    url: json["url"],
    isRead: json["is_read"],
  );

  Map<String, dynamic> toJson() => {
    "notification_id": notificationId,
    "user_id": userId,
    "notification": notification,
    "url": url,
    "is_read": isRead,
  };
}
