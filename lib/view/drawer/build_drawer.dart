import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';
import 'package:save71/controller/drawer_screen_controller.dart';
import 'package:save71/controller/home_controller.dart';
import 'package:save71/view/dashboard/dashboard_screen.dart';
import 'package:save71/view/drawer/widgets/subCategoryContailer.dart';
import 'package:save71/view/orders/orders_screen.dart';
import 'package:save71/view/products/products_screen.dart';
import 'package:save71/view/setting/profile_setting_screen.dart';
import 'package:save71/view/upload/upload_products_screen.dart';

import '../favourite/favourites_screen.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer(BuildContext context, {super.key});

 static DrawerScreenController drawerController = Get.put(DrawerScreenController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 60.h, bottom: 60.h),
            child: SizedBox(
              height: 15.h,
              width: 68.w,
              child: Image.asset("assets/images/logo.png", color: primaryColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              drawerController.categoryBoxOpen.value =
                  !drawerController.categoryBoxOpen.value;
            },
            child: Container(
              height: 52.h,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: const BoxDecoration(color: primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subTitleText('All Categories', size: 14, color: white),
                  Obx(() => drawerController.categoryBoxOpen.value
                      ? const Icon(Icons.keyboard_arrow_down, color: white)
                      : const Icon(Icons.arrow_forward_ios,
                          size: 16, color: white))
                ],
              ),
            ),
          ),
          Obx(
            () => Expanded(
                child: drawerController.categoryBoxOpen.value
                    ? subCategoryContainer()
                    : const SizedBox()),
          ),
          // buildDrawerItem('Home', isSelected: true, onPress: () {
          //   Get.to(const HomeScreen());
          // }),
          buildDrawerItem('Dashboard', onPress: () {
            Get.to(const DashboardScreen());
          }),
          buildDrawerItem('Products', onPress: () {
            Get.to( ProductScreen());
          }),
          buildDrawerItem('Orders', onPress: () {
            Get.to(const OrdersScreen());
          }),
          // buildDrawerItem('Settings', onPress: () {
          //   Get.to(const ProfileSettingScreen());
          // }),
          buildDrawerItem('Favourites', onPress: () {
            Get.to(const FavouritesScreen());
          }),
          // buildDrawerItem('My Customers'),
          // buildDrawerItem('Upload Product', onPress: () {
          //   Get.to(const UploadProductsScreen());
          // }),
          // buildDrawerItem('Game'),
        ],
      ),
    );
  }

  Widget buildDrawerItem(String text,
      {bool isSelected = false, Function()? onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 52.h,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20.w),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
            color: primaryColor,
            // borderRadius: BorderRadius.only(
            //     topRight: Radius.circular(8.r),
            //     bottomRight: Radius.circular(8.r)),
        ),
        child: subTitleText(text, size: 14, color: white),
      ),
    );
  }
}
