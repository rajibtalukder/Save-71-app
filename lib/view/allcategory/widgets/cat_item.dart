import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/model/all_category_model.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';
import '../../../controller/authentication_controller.dart';
import '../item_details_screen.dart';
AuthenticationController authController = Get.find();

Widget catItem(AllCat allCat) {

  return GestureDetector(
    onTap: () async {
      print(allCat.productId);
      //Get.to(const ItemDetailsScreen());
      await authController.getProductDetails(allCat.productId.toString());
    },
    child: Container(
      height: 250.h,
      width: 145.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: ShapeDecoration(
        color: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
            side:
                BorderSide(color: secondaryTextColor.withOpacity(0.2), width: 1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          Stack(children: [
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(allCat.extraCatImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
          Container(
            padding: EdgeInsets.all(10.w),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                subTitleText(allCat.productName,
                    size: 12, fontWeight: FontWeight.w500),
                subTitleText('${allCat.productPrice.toStringAsFixed(2)} BDT',
                    size: 12, fontWeight: FontWeight.w700, color: orangeLight),
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
    ),
  );
}
