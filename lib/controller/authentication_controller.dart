import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:save71/constants/constants.dart';
import 'package:save71/controller/error_controller.dart';
import 'package:save71/model/currency_code_model.dart';
import 'package:save71/model/notification_model.dart';
import 'package:save71/model/product_details_model.dart';
import 'package:save71/view/authentication/register_email_verification_screen.dart';
import 'package:save71/view/authentication/login_screen.dart';
import 'package:save71/view/authentication/new_password_screen.dart';
import 'package:save71/view/home/main_home_screen.dart';
import '../constants/utils.dart';
import '../model/user_model.dart';
import '../service/api/api_client.dart';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController
    implements ErrorController {
  @override
  Future<void> onReady() async {
    await getCurrentLocation().then((value) {
      lat = value.latitude.toString();
      lng = value.longitude.toString();
    });
    super.onReady();
  }

  String lat = '';
  String lng = '';
  RxBool isLoading = false.obs;

  var selectedValue = DateTime.now().obs;
  DateFormat newFormat = DateFormat('yyyy-MM-dd');
  String date = '';

  //registration controllers...........
  final fNameCtlr = TextEditingController().obs;
  final lNameCtlr = TextEditingController().obs;
  final emailCtlr = TextEditingController().obs;
  final phoneCtlr = TextEditingController().obs;
  final passCtlr = TextEditingController().obs;
  final refCtlr = TextEditingController().obs;

  //login controllers..........
  final loginPhoneCntr = TextEditingController().obs;
  final loginPassCntr = TextEditingController().obs;

  //forget pass controllers.....
  final emailVerifyCntr = TextEditingController().obs;
  final otpCntr = TextEditingController().obs;
  final newPassCntr = TextEditingController().obs;
  final conNewPassCntr = TextEditingController().obs;

  ///user info-------------
  UserModel? userModel;
  Rx<CurrencyCodeModel> currencyCodeModel = CurrencyCodeModel().obs;
  Rx<ProductDetailsModel> productModel = ProductDetailsModel().obs;
  var userID;

  //personal info controllers=------------
  final proNameCntr = TextEditingController().obs;
  final proEmailCntr = TextEditingController().obs;
  final proRefCntr = TextEditingController().obs;
  final proShopNameCntr = TextEditingController().obs;
  final proShopNumCntr = TextEditingController().obs;
  final proShopLocCntr = TextEditingController().obs;

  final proOldPassCntr = TextEditingController().obs;
  final proNewPassCntr = TextEditingController().obs;
  final proConNewPassCntr = TextEditingController().obs;

  // bank info controllers------------
  final bankNameCntr = TextEditingController().obs;
  final bankAcNameCntr = TextEditingController().obs;
  final bankBranchNameCntr = TextEditingController().obs;
  final bankAcNumCntr = TextEditingController().obs;
  final bankRoutNumCntr = TextEditingController().obs;

  ///Image upload____________________
  var selectImagePath = ''.obs;

  Future<void> getProfileImage(ImageSource imgSrc) async {
    final pickedFile = await ImagePicker().getImage(source: imgSrc);
    selectImagePath.value = pickedFile!.path;
    update(['imageId']);
  }

  Future<Position> getCurrentLocation() async {
    isLoading.value = true;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      isLoading.value = false;
      //return Future.error('Location service are disabled');
      //Utils.showLoading('Location service are Denied. Please turn on your location');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isLoading.value = false;
        //return Future.error('Location service are Denied');
        //Utils.showLoading('Location service are Denied. Please turn on your location');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      isLoading.value = false;
      return Future.error('Location permission are permanently denied');
    }
    isLoading.value = false;

    return await Geolocator.getCurrentPosition();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedValue.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2028),
    );

    if (pickedDate != null && pickedDate != selectedValue.value) {
      selectedValue.value = pickedDate;
      date = newFormat.format(selectedValue.value);
      update(['dateUpdate']);
    }
  }

  @override
  void handleApiError(error) {
    // TODO: implement handleApiError
  }

  Future<void> getCurrencyCode() async {
    isLoading.value = true;
    var body = {
      'latitude': lat,
      'longitude': lng,
    };
    var response =
        await ApiClient().post('__gCC', body).catchError(handleApiError);
    currencyCodeModel.value = currencyCodeModelFromJson(response);
    isLoading.value = false;
  }

  ///Product details........
  Future<void> getProductDetails(String productId) async {
    isLoading.value = true;
    var body = {
      'productID': productId,
      'currencyCode': currencyCodeModel.value.currencyCode,
      'latitude': lat,
      'longitude': lng,
      'isLogged': true.toString(),
      'uID': userModel?.userInfo.userId.toString(),
    };
    print(body);
    print('body prindted');
    var response = await ApiClient()
        .post('product-details', body)
        .catchError(handleApiError);
    print(response);
    print('body response');
    productModel.value = productDetailsModelFromJson(response);
    isLoading.value = false;
    update(['prodDetailsUpdate']);
  }

  /// Post amount
  void registration(String gender, String? type) async {
    Utils.showLoading();
    var body = {
      "firstName": fNameCtlr.value.text,
      "lastName": lNameCtlr.value.text,
      "email": emailCtlr.value.text,
      "password": passCtlr.value.text,
      "gender": gender,
      "refIdText": refCtlr.value.text,
      "DOB": date,
      "latitude": lat,
      "longitude": lng,
      "phone": phoneCtlr.value.text,
      "shop_type": type,
    };
    var response =
        await ApiClient().post('registration', body).catchError(handleApiError);
    Utils.hidePopup();
    var parsedResponse = jsonDecode(response);
    print(response);
    Utils.showSnackBar(parsedResponse['message']);
    if (parsedResponse['status']) {
      Get.to(const RegisterEmailVerificationScreen());
      print("Registration done");
    }
  }

  void login() async {
    Utils.showLoading();
    var body = {
      "phone": loginPhoneCntr.value.text,
      "password": loginPassCntr.value.text,
    };
    var response =
        await ApiClient().post('login', body).catchError(handleApiError);
    Utils.hidePopup();
    var parsedResponse = jsonDecode(response);
    Utils.showSnackBar(parsedResponse['message']);
    userModel = UserModel.fromJson(parsedResponse);
    if (parsedResponse['status']) {
      Get.to(MainHomeScreen());
      print("Login done");
    }
  }

  // forget password email verification and reset password........

  Future<bool> emailVerify() async {
    Utils.showLoading();
    var body = {
      "email": emailVerifyCntr.value.text,
    };
    var response =
        await ApiClient().post('emailVerify', body).catchError(handleApiError);

    var data = jsonDecode(response);
    if (response != null) {
      userID = data['userID'];
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }

  void emailVerificationRequest() async {
    var body = {
      "userId": userID.toString(),
    };
    var response = await ApiClient()
        .post('emailVerificationRequestAPI', body)
        .catchError(handleApiError);
    var data = jsonDecode(response);
    var messgae = data['message'];
    if (response != null) {
      Utils.showSnackBar(messgae);
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
  }

  Future<bool> postOtp() async {
    Utils.showLoading();
    var body = {
      "otp": otpCntr.value.text,
      "userId": userID.toString(),
    };
    var response = await ApiClient()
        .post('emailVerificationPostAPI', body)
        .catchError(handleApiError);
    print(response);

    var data = jsonDecode(response);
    var messgae = data['message'];
    bool status = data['status'];
    if (response != null) {
      Utils.hidePopup();
      Utils.showSnackBar(messgae);
      if (status) {
        Get.to(const NewPasswordScreen());
      }
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }

  Future<bool> postNewPassword() async {
    Utils.showLoading();
    var body = {
      "newPassword": conNewPassCntr.value.text,
    };
    var response = await ApiClient()
        .post('passReset?email=${emailVerifyCntr.value.text}', body)
        .catchError(handleApiError);
    print(response);
    var data = jsonDecode(response);
    var messgae = data['message'];
    bool status = data['status'];
    if (response != null) {
      Utils.hidePopup();
      Utils.showSnackBar(messgae);
      if (status) {
        Get.to(const LoginScreen());
      }
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }

  Future<bool> registerPostOtp() async {
    Utils.showLoading();
    var body = {
      "otp": otpCntr.value.text,
      "userId": userID.toString(),
    };
    var response = await ApiClient()
        .post('emailVerificationPostAPI', body)
        .catchError(handleApiError);
    print(response);

    var data = jsonDecode(response);
    var messgae = data['message'];
    bool status = data['status'];
    if (response != null) {
      Utils.hidePopup();
      Utils.showSnackBar(messgae);
      if (status) {
        Get.to(const LoginScreen());
      }
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }

  ///profile section====================

  Future<bool> updatePerofilePic() async {
    Utils.showLoading();
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}editPic'));
    var imageFile = File(selectImagePath.value);
    var imageStream = http.ByteStream(imageFile.openRead());
    var imageLength = await imageFile.length();
    var multipartFile = http.MultipartFile('user_img', imageStream, imageLength,
        filename: imageFile.path.split('/').last);
    request.files.add(multipartFile);
    request.fields['userId'] = userModel!.userInfo.userId.toString();
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    var data = jsonDecode(respStr);
    var messgae = data['message'];
    if (response != null) {
      Utils.hidePopup();
      Utils.showSnackBar(messgae);
      //selectImagePath.value = "";
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }

  Future<bool> updatePersonalInfo() async {
    Utils.showLoading();
    var body = {
      "name": proNameCntr.value.text,
      "email": proEmailCntr.value.text,
      "uID": userModel?.userInfo.userId.toString(),
    };
    var response =
        await ApiClient().post('personalInfo', body).catchError(handleApiError);
    print(response);
    var data = jsonDecode(response);
    var messgae = data['message'];
    if (response != null) {
      Utils.hidePopup();
      Utils.showSnackBar(messgae);
      userModel = UserModel.fromJson(data);
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }

  Future<bool> updateShopInfo() async {
    Utils.showLoading();
    var body = {
      "shop_name": proShopNameCntr.value.text,
      "uID": userModel?.userInfo.userId.toString(),
    };
    var response = await ApiClient()
        .post('storeInfoEdit', body)
        .catchError(handleApiError);
    print(response);
    var data = jsonDecode(response);
    var messgae = data['message'];
    if (response != null) {
      Utils.hidePopup();
      Utils.showSnackBar(messgae);
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }

  Future<bool> updateBankInfo() async {
    Utils.showLoading();
    var body = {
      "bankName": bankNameCntr.value.text,
      "accountNumber": bankAcNumCntr.value.text,
      "accName": bankAcNameCntr.value.text,
      "branchName": bankBranchNameCntr.value.text,
      "routingNumber": bankRoutNumCntr.value.text,
      "userId": userModel?.userInfo.userId.toString(),
    };
    var response = await ApiClient()
        .post('updateBankInfo', body)
        .catchError(handleApiError);
    print(response);
    var data = jsonDecode(response);
    var messgae = data['message'];
    if (response != null) {
      Utils.hidePopup();
      Utils.showSnackBar(messgae);
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }

  Future<bool> changePasswordSetting() async {
    Utils.showLoading();
    var body = {
      "oldpass": proOldPassCntr.value.text,
      "newpass": proNewPassCntr.value.text,
      "reppass": proConNewPassCntr.value.text,
      "uID": userModel?.userInfo.userId.toString(),
    };
    var response =
        await ApiClient().post('changePass', body).catchError(handleApiError);
    print(response);
    var data = jsonDecode(response);
    var messgae = data['message'];
    if (response != null) {
      Utils.hidePopup();
      Utils.showSnackBar(messgae);
      return true;
    } else {
      Utils.showSnackBar('Something Went Wrong!');
    }
    Utils.hidePopup();
    return false;
  }
}
