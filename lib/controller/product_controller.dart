import 'package:get/get.dart';
import 'package:save71/model/product_model.dart';

import '../service/api/api_client.dart';
import 'authentication_controller.dart';

class ProductController extends GetxController{

  Rx<ProductModel> productModel = ProductModel().obs;
  List<ImageProd> publishedProduct = [];
  List<ImageProd> unPublishedProduct = [];
  Rx<bool> isLoading = false.obs;
  AuthenticationController authCon = Get.find();

  // @override
  // Future<void> onInit() async {
  //   // TODO: implement onReady
  //   await productsGet();
  //   super.onInit();
  // }

  Future<void> productsGet() async {
    publishedProduct=[];
    unPublishedProduct=[];
    isLoading.value= true;
    final body = {
      'uID': authCon.userModel?.userInfo.id.toString(),
      'isLogged': true.toString(),
      'currencyCode': authCon.currencyCodeModel.value.currencyCode.toString(),
    };
    var response =
    await ApiClient().post('products', body);
    productModel.value = productModelFromJson(response);
    for(int i =0; i<(productModel.value.images?.length??0);i++){
      if(productModel.value.images?[i].adminPublished==1){
        publishedProduct.add(productModel.value.products![i]);
      }else{
        unPublishedProduct.add(productModel.value.products![i]);

      }
    }
    isLoading.value= false;
    update(['prodUpdate']);
  }

}