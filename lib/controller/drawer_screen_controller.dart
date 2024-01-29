import 'package:get/get.dart';
import 'package:save71/controller/authentication_controller.dart';

class DrawerScreenController extends GetxController{

  AuthenticationController authController = Get.find();

  RxBool categoryBoxOpen = false.obs;
  RxBool subCategoryBoxOpen = false.obs;
  final List<bool> subCategoryVisibility = List.generate(15, (index) => false).obs;
  final List<bool> mainCategoryVisibility = List.generate(15, (index) => false).obs;

  void subCatToggleVisibility(int index) {
    subCategoryVisibility[index] = !subCategoryVisibility[index];
    update(['subCatUpdate']); // Call update to notify listeners about the change
  }
  void mainCatToggleVisibility(int index) {
    mainCategoryVisibility[index] = !mainCategoryVisibility[index];
    update(['mainCatUpdate']); // Call update to notify listeners about the change
  }
}