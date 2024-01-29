import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/controller/home_controller.dart';
import 'package:save71/view/home/widgets/all_nearest_manufacturer.dart';
import 'package:save71/view/home/widgets/all_popular_manufacturer.dart';
import 'package:save71/view/home/widgets/home_nearest_manufacturer_item.dart';
import 'package:save71/view/home/widgets/home_popular_manufacturer_item.dart';

import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';
import 'explore_category_search.dart';

class ManufactureTab extends StatelessWidget {
  const ManufactureTab({super.key});

 static HomeController homeController = Get.put(HomeController());

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
              subTitleText('Nearest Manufacturer',
                  size: 16, fontWeight: FontWeight.w700),
              GestureDetector(
                onTap: () {
                  Get.to(const AllNearestManufacturer());
                },
                child: subTitleText('See all',
                    size: 16, fontWeight: FontWeight.w700, color: primaryColor),
              ),
            ],
          ),
        ),
        GetBuilder<HomeController>(
            id: 'nearManuUpdate',
            builder: (controller) {
              return SizedBox(
                height: 350.h,
                child: controller.nearestManufacturerModel.value.status.isNull
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                  itemCount: 16,
                  itemBuilder: (BuildContext context, int index) {
                    return homeNearestManufacturerItem(controller
                        .nearestManufacturerModel.value.products![index]);
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
              subTitleText('Popular Manufacturer',
                  size: 16, fontWeight: FontWeight.w700),
              GestureDetector(
                onTap: (){
                  Get.to(const AllPopularManufacturer());
                },
                child: subTitleText('See all',
                    size: 16, fontWeight: FontWeight.w700, color: primaryColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
        GetBuilder<HomeController>(
            id: 'popularManuUpdate',
            builder: (controller) {
              return SizedBox(
                height: 350.h,
                child: controller.popularManufacturerModel.value.status.isNull
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                  itemCount: 16,
                  itemBuilder: (BuildContext context, int index) {
                    return homePopularManufacturerItem(controller
                        .popularManufacturerModel.value.extraCat![index]);
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
      ],
    );
  }
}
