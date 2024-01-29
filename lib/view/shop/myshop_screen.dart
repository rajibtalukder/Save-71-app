import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_text_field.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/view/shop/product_details_screen.dart';
import 'package:save71/view/shop/shop_search_screen.dart';
import 'package:save71/view/drawer/build_drawer.dart';
import 'package:save71/view/shop/widgets/category_item.dart';
import 'package:save71/view/shop/widgets/image_slider.dart';
import 'package:save71/view/shop/widgets/product_item.dart';

import '../../constants/colors.dart';

class MyshopScreen extends StatelessWidget {
  const MyshopScreen({super.key});

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
          const Icon(Icons.notifications_none, color: black),
          SizedBox(width: 15.w),
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: Image.asset('assets/images/profilepic.png'),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.to(ShopSearchScreen());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: customTextField(TextEditingController(),
                      preficon: Icons.search,
                      isActive: false,
                      iconColor: secondaryDarkTextColor,
                      hintText: 'Search products...'),
                ),
              ),
              SizedBox(height: 20.h),
              //ImageSlider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('All Categories',
                        size: 16, fontWeight: FontWeight.w700),
                    subTitleText('See All Categories',
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: primaryColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++) categoryItem(),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++) categoryItem(),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++) categoryItem(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Featured Products',
                        size: 16, fontWeight: FontWeight.w700),
                    subTitleText('See All',
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: primaryColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: 187.h,
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        GestureDetector(
                          onTap: () {
                            Get.to(const ProductDetailsScreen());
                          },
                          child: productItem(),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: subTitleText('More Products',
                      size: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 20.w),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      height: 187.h,
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            GestureDetector(
                              onTap: () {
                                Get.to(const ProductDetailsScreen());
                              },
                              child: productItem(isPlusIcon: false),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 20.w),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      height: 187.h,
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            GestureDetector(
                              onTap: () {
                                Get.to(const ProductDetailsScreen());
                              },
                              child: productItem(isPlusIcon: false),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
