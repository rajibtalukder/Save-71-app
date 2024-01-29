import 'dart:convert';

import 'package:get/get.dart';
import 'package:save71/controller/authentication_controller.dart';
import 'package:save71/model/add_cart_model.dart';
import 'package:save71/model/all_category_model.dart';
import 'package:save71/model/rating_model.dart';

import '../constants/utils.dart';
import '../service/api/api_client.dart';

class AllCategoryController extends GetxController {
  AuthenticationController authController = Get.find();
  Rx<AllCategoryModel> allCategoryModel = AllCategoryModel().obs;
  Rx<RatingModel> ratingModel = RatingModel().obs;
  Rx<AddCartModel>? addCartModel ;
  Rx<bool> isLoading = false.obs;
  Rx<int> rating = 0.obs;
  Rx<String> orderID = ''.obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    await getAllCategory();
    super.onReady();
  }

  @override
  void handleApiError(error) {
    // TODO: implement handleApiError
  }

  Future<void> getAllCategory() async {
    isLoading.value = true;
    final body = {
      'user_id': authController.userModel?.userInfo.id.toString(),
      'currencyCode':
          authController.currencyCodeModel.value.currencyCode.toString(),
    };
    var response =
        await ApiClient().post('all-category', body).catchError(handleApiError);
    print(response);
    allCategoryModel.value = allCategoryModelFromJson(response);
    isLoading.value = false;
    update();
  }

  Future<void> postItemReview({String? des, String? prodID}) async {
    final body = {
      'rating': rating.value.toString(),
      'description': des,
      'productId': prodID.toString(),
      'uID': authController.userModel?.userInfo.id.toString(),
    };
    print(body);
    var response =
        await ApiClient().post('ratings', body).catchError(handleApiError);
    print(response);
    ratingModel.value = ratingModelFromJson(response);
    update();
  }

  Future<void> postAddShop(
      {String? prodId,
      String? prodPrice,
      String? prodName,
      String? sellerId}) async {
    final body = {
      'product_id': prodId,
      'product_price': prodPrice,
      'product_name': prodName,
      'seller_id': sellerId,
    };
    print(body);
    var response = await ApiClient()
        .post(
            'addProductFromStore?currencyCode=${authController.currencyCodeModel.value.currencyCode.toString()}',
            body)
        .catchError(handleApiError);
    print(response);
    var data = jsonDecode(response);
    var messgae = data['message'];
    if (response != null) {
      Utils.showSnackBar(messgae);
      return;
    } else {
      Utils.showSnackBar('Something went wrong!');
    }

    update();
  }

  Future<void> addToCart({String? prodId, String? sellerId}) async {
    final body1 = {
      'product_id': prodId,
      'seller_id': sellerId,
      'isLogged': true.toString(),
      'userId': authController.userModel?.userInfo.id.toString(),
    };
    final body2 = {
      'product_id': prodId,
      'seller_id': sellerId,
      'order_id': orderID.value,
      'isLogged': true.toString(),
      'userId': authController.userModel?.userInfo.id.toString(),
    };
    var response = await ApiClient()
        .post('cart', orderID.value.isEmpty ? body1 : body2)
        .catchError(handleApiError);
    print(response);
    addCartModel?.value = addCartModelFromJson(response);
    orderID.value = addCartModel?.value.order[0].orderId.toString()??'';
    print(orderID.value);
    print(addCartModel?.value.orderDetails.length);
    var data = jsonDecode(response);
    var messgae = data['message'];
    if (response != null) {
      Utils.showSnackBar(messgae);
      return;
    } else {
      Utils.showSnackBar('Something went wrong!');
    }
    update();
  }
}
