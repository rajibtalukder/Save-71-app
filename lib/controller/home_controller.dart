import 'package:get/get.dart';
import 'package:save71/controller/authentication_controller.dart';
import 'package:save71/model/area_shop_model.dart';
import 'package:save71/model/nearest_products_model.dart';
import 'package:save71/model/popular_manufacturer_model.dart';
import 'package:save71/model/popular_products_model.dart';
import 'package:save71/model/search_result_model.dart';

import '../model/nearest_manufacturer_model.dart';
import '../service/api/api_client.dart';

class HomeController extends GetxController {
  RxInt currentPage = 0.obs;
  RxInt categorySelect = 0.obs;
  RxBool expandedContainer = true.obs;
  RxBool isLoading = false.obs;

  AuthenticationController authController = Get.find();

  Rx<NearestProductsModel> nearestProductsModel = NearestProductsModel().obs;
  Rx<PopularProductsModel> popularProductsModel = PopularProductsModel().obs;
  Rx<NearestManufacturerModel> nearestManufacturerModel =
      NearestManufacturerModel().obs;
  Rx<PopularManufacturerModel> popularManufacturerModel =
      PopularManufacturerModel().obs;
  Rx<AreaShopModel> areaShopModel = AreaShopModel().obs;
  Rx<SearchResultModel> searchResultModel = SearchResultModel().obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    await getNearestProducts();
    await getPopularProducts();
    await getNearestManufacturer();
    await getPopularManufacturer();
    await getAreaShop();
    super.onReady();
  }

  @override
  void handleApiError(error) {
    // TODO: implement handleApiError
  }

  ///Home Tab methods.............

  Future<void> getNearestProducts() async {
    isLoading.value = true;
    final body = {
      'currencyCode': '${authController.currencyCodeModel.value.currencyCode}',
      'latitude': authController.lat,
      'longitude': authController.lng,
    };
    print(body);
    print('body-----');
    var response = await ApiClient()
        .post('nearest-products', body)
        .catchError(handleApiError);
    nearestProductsModel.value = nearestProductsModelFromJson(response);
    isLoading.value = false;
    update(['nearProUpdate']);
  }

  Future<void> getPopularProducts() async {
    isLoading.value = true;
    final body = {
      'currencyCode':'${authController.currencyCodeModel.value.currencyCode}',
      'latitude': authController.lat,
      'longitude': authController.lng,
    };
    var response = await ApiClient()
        .post('popular-products', body)
        .catchError(handleApiError);
    popularProductsModel.value = popularProductsModelFromJson(response);
    isLoading.value = false;
    update(['popularProUpdate']);
  }

  ///Area Shop Tab methods...........

  Future<void> getAreaShop() async {
    isLoading.value = true;
    final body = {
      'userLat': authController.lat,
      'userLng': authController.lng,
      'currencyCode': '${authController.currencyCodeModel.value.currencyCode}',
    };
    var response =
        await ApiClient().post('area-shop', body).catchError(handleApiError);
    areaShopModel.value = areaShopModelFromJson(response);
    isLoading.value = false;
    update(['areaShopUpdate']);
  }

  ///Manufacture Tab methods.............

  Future<void> getNearestManufacturer() async {
    isLoading.value = true;
    final body = {
      'currencyCode': '${authController.currencyCodeModel.value.currencyCode}',
      'latitude': authController.lat,
      'longitude': authController.lng,
    };
    var response = await ApiClient()
        .post('nearest-manufacturer', body)
        .catchError(handleApiError);
    nearestManufacturerModel.value = nearestManufacturerModelFromJson(response);
    isLoading.value = false;
    update(['nearManuUpdate']);
  }

  Future<void> getPopularManufacturer() async {
    isLoading.value = true;
    final body = {
      'currencyCode': '${authController.currencyCodeModel.value.currencyCode}',
      'latitude': authController.lat,
      'longitude': authController.lng,
    };
    var response = await ApiClient()
        .post('popular-manufacturer', body)
        .catchError(handleApiError);
    popularManufacturerModel.value = popularManufacturerModelFromJson(response);
    isLoading.value = false;
    update(['popularManuUpdate']);
  }


  ///Search Product..........
  Future<void> getSearchResult(String text) async {
    isLoading.value = true;
    final body = {
      'currencyCode': '${authController.currencyCodeModel.value.currencyCode}',
      'query': text,
    };
    var response = await ApiClient()
        .post('search/suggestions',body)
        .catchError(handleApiError);
    print(response);

    searchResultModel.value = searchResultModelFromJson(response);
    print(searchResultModel.value.searchSuggestions?.length);
    print('Test');
    isLoading.value = false;
    update(['searchResUpdate']);
  }


}
