import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/view/home/widgets/all_area_shop.dart';

import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';
import '../../controller/home_controller.dart';
import '../../model/area_shop_model.dart';
import 'explore_category_search.dart';

class AreaShopTab extends StatelessWidget {
  const AreaShopTab({super.key});

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
        GetBuilder<HomeController>(
            id: 'areaShopUpdate',
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: controller.areaShopModel.value.status.isNull
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0;
                              i <
                                  controller
                                      .areaShopModel.value.extraCat!.length;
                              i++)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    subTitleText(
                                        controller.areaShopModel.value
                                            .extraCat![i].extraCatName,
                                        size: 16,
                                        fontWeight: FontWeight.w700),
                                    GestureDetector(
                                      onTap:(){
                                        Get.to(const AllAreaShop());
                                      },
                                      child: subTitleText('See all',
                                          size: 16,
                                          fontWeight: FontWeight.w700,
                                          color: primaryColor),
                                    ),
                                  ],
                                ),
                                areaSubCat(controller
                                    .areaShopModel.value.extraCat![i]),
                              ],
                            ),
                        ],
                      ),
              );
            })
      ],
    );
  }

  Widget areaSubCat(ExtraCat subAreItem) {
    return Container(
      height: 280.h,
      width: 145.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: ShapeDecoration(
        color: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
            side: BorderSide(
                color: secondaryTextColor.withOpacity(0.2), width: 1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(subAreItem.extraCatImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.w),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_pin,
                        size: 14, color: primaryTextColor),
                    subTitleText('130.55 KM',
                        size: 12,
                        fontWeight: FontWeight.w700,
                        color: orangeLight),
                  ],
                )
              ],
            ),
          ),
          subTitleText(subAreItem.extraCatName,
              size: 16, fontWeight: FontWeight.w700),
          subTitleText(
              '${subAreItem.extraCatDeductAmount.toStringAsFixed(2)} BDT',
              size: 14,
              fontWeight: FontWeight.w700),
          subTitleText('Distance: 194.80 KM',
              size: 14, fontWeight: FontWeight.w700),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(6.r),
                bottomLeft: Radius.circular(6.r)),
            child: Container(
                color: primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    subTitleText('Add to Cart',
                        size: 12, fontWeight: FontWeight.w700, color: white),
                    SizedBox(width: 10.w),
                    const Icon(Icons.shopping_cart, size: 14, color: white),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
