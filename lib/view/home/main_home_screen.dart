import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';
import 'package:save71/controller/home_controller.dart';
import 'package:save71/view/allcategory/all_category_screen.dart';
import 'package:save71/view/cart/cart_scren.dart';
import 'package:save71/view/home/area_shop_tab.dart';
import 'package:save71/view/home/home_tab.dart';
import 'package:save71/view/home/manufacture_tab.dart';
import 'package:save71/view/notification/notification_screen.dart';
import '../setting/profile_setting_screen.dart';
import '../drawer/build_drawer.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({super.key});

  List shopItems = ['Home', 'Area Shop', 'Manufacturer'];
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: BuildDrawer(context),
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: black, //change your color here
          ),
          actions: [
            const Icon(Icons.favorite_outline_outlined, color: black),
            SizedBox(width: 15.w),
            GestureDetector(
                onTap: () {
                  Get.to( CartScreen());
                },
                child: const Icon(Icons.shopping_cart_outlined, color: black)),
            SizedBox(width: 15.w),
            GestureDetector(
                onTap: () {
                  Get.to(const NotificationScreen());
                },
                child: const Icon(Icons.notifications_none, color: black)),
            SizedBox(width: 15.w),
            GestureDetector(
              onTap: () {
                Get.to(const ProfileSettingScreen());
              },
              child: SizedBox(
                height: 20.h,
                width: 20.w,
                child: Image.asset('assets/images/profilepic.png'),
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 10.w, top: 20.h),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(
                      height: 55.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: shopItems.length,
                          itemBuilder: (context, child) => GestureDetector(
                              onTap: () {
                                homeController.categorySelect.value = child;
                              },
                              child: Container(
                                height: 43.h,
                                margin: EdgeInsets.only(right: 10.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 10.h),
                                decoration: ShapeDecoration(
                                  color: homeController.categorySelect.value ==
                                          child
                                      ? primaryColor
                                      : whiteLight,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: Center(
                                  child: subTitleText(shopItems[child],
                                      size: 14,
                                      color:
                                          homeController.categorySelect.value ==
                                                  child
                                              ? white
                                              : black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ))),
                    ),
                    homeController.categorySelect.value == 0
                        ? const HomeTab()
                        : homeController.categorySelect.value == 1
                            ? const AreaShopTab()
                            : const ManufactureTab(),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: customButton('All Category', onPressed: () {
                        Get.to(const AllCategoryScreen());
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
