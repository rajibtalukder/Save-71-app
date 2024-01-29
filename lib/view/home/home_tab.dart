import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/controller/home_controller.dart';
import 'package:save71/view/home/widgets/all_popular_products.dart';
import 'package:save71/view/home/widgets/home_popular_product_item.dart';

import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';
import 'explore_category_search.dart';
import 'widgets/all_nearest_products.dart';
import 'widgets/home_nearest_product_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  static HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {
            Get.to(const ExploreCategorySearch());
          },
          child: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: customTextField(TextEditingController(),
                isActive: false, hintText: 'Search Product'),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subTitleText('Nearest Products',
                  size: 16, fontWeight: FontWeight.w700),
              GestureDetector(
                onTap: () {
                  Get.to(const AllNearestProducts());
                },
                child: subTitleText('See all',
                    size: 16, fontWeight: FontWeight.w700, color: primaryColor),
              ),
            ],
          ),
        ),
        GetBuilder<HomeController>(
            id: 'nearProUpdate',
            builder: (controller) {
              return SizedBox(
                height: 350.h,
                child: controller.nearestProductsModel.value.status.isNull
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        itemCount: 16,
                        itemBuilder: (BuildContext context, int index) {
                          return homeNearestProductItem(controller
                              .nearestProductsModel.value.products![index]);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.4 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                      ),
              );
            }),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subTitleText('Popular Products',
                  size: 16, fontWeight: FontWeight.w700),
              GestureDetector(
                onTap: () {
                  Get.to(const AllPopularProducts());
                },
                child: subTitleText('See all',
                    size: 16, fontWeight: FontWeight.w700, color: primaryColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
        GetBuilder<HomeController>(
            id: 'popularProUpdate',
            builder: (controller) {
              return SizedBox(
                height: 350.h,
                child: controller.popularProductsModel.value.status.isNull
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        itemCount: 16,
                        itemBuilder: (BuildContext context, int index) {
                          return homePopularProductItem(controller
                              .popularProductsModel.value.extraCat![index]);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.4 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                      ),
              );
            }),
        /*SizedBox(
          height: 500.h,
          child: GridView.builder(
            itemCount: 16,
            itemBuilder: (BuildContext context, int index) {
              return Text('data');
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
          ),
        ),*/
      ],
    );
  }
}
