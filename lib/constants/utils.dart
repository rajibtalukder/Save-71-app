import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class Utils{

  static final apiHeader = {
    'Access-Control-Allow-Origin': '*',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': 'Bearer $token',
    'Accept': '*/*'
  };

  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  static void hidePopup() {
    Get.back();
  }


  static void showSnackBar(String message, {bool? err}) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: err == true ? red : black,
        message: message,
        //icon: const Icon(Icons.info_outline,color: white),
        isDismissible: true,
        duration: const Duration(seconds: 3),
        messageText: Text(
          message,
          style: const TextStyle(color: white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }


}