import 'dart:convert';

import 'package:get/get.dart';
import 'package:save71/controller/authentication_controller.dart';
import 'package:save71/model/notification_model.dart';

import '../constants/utils.dart';
import '../service/api/api_client.dart';

class NotificationController extends GetxController {
  AuthenticationController authController = Get.find();
  Rx<NotificationModel> notificationModel = NotificationModel().obs;
  Rx<bool> isLoading = false.obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    await getNotification();
    super.onReady();
  }

  @override
  void handleApiError(error) {
    // TODO: implement handleApiError
  }

  Future<void> getNotification() async {
    isLoading.value = true;
    var body = {
      "userId": authController.userModel?.userInfo.id.toString(),
    };
    print(body);
    var response =
        await ApiClient().post('__gNot', body).catchError(handleApiError);
    notificationModel.value = notificationModelFromJson(response);
    isLoading.value = false;
    // var data = jsonDecode(response);
    // var messgae = data['message'];
    // if (response == null) {
    //   Utils.showSnackBar(messgae);
    // } else {
    //   Utils.showSnackBar('Something Went Wrong!');
    // }
  }
}
