import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/view/cart/cart_scren.dart';
import 'package:save71/view/dashboard/dashboard_screen.dart';
import 'package:save71/view/favourite/favourites_screen.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';
import '../../../model/product_model.dart';

Widget singleProductItem(ImageProd productModel) {
  return Container(
    width: double.infinity,
    height: 70.h,
    padding: EdgeInsets.all(10.w),
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: ShapeDecoration(
      color: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      shadows: const [
        BoxShadow(
          color: Color(0x14000000),
          blurRadius: 8,
          offset: Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    ),
    child: Row(
      children: [
        Container(
          height: 44.h,
          width: 48.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            //image: DecorationImage(image: NetworkImage(productModel.productImageUrl.toString()),fit: BoxFit.cover)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: SizedBox(),
          ),
        ),
        SizedBox(width: 15.w),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subTitleText(productModel.productName, size: 14, fontWeight: FontWeight.w500),
            subTitleText('Product Id: ${productModel.productId}', size: 12, fontWeight: FontWeight.w400),
          ],
        ),
        const Expanded(child: SizedBox()),
        Column(
          children: [
            subTitleText('${productModel.productPrice.toStringAsFixed(2)} TK', size: 14, fontWeight: FontWeight.w400),
            Container(
              width: 90,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(
                    color: secondaryTextColor.withOpacity(0.2), width: 0.38.w),
                borderRadius: BorderRadius.circular(1.53.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const DashboardScreen());
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 15,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      child: VerticalDivider(
                          width: 0.6.w,
                          color: secondaryTextColor.withOpacity(0.2))),
                  GestureDetector(
                    onTap: () {
                      Get.to(const FavouritesScreen());
                    },
                    child: const Icon(
                      Icons.delete_outline,
                      size: 15,
                      color: red,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      child: VerticalDivider(
                          width: 0.6.w,
                          color: secondaryTextColor.withOpacity(0.2))),
                  GestureDetector(
                    onTap: () {
                      Get.to(CartScreen());
                    },
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: primaryColor,
                      size: 15,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      child: VerticalDivider(
                          width: 0.6.w,
                          color: secondaryTextColor.withOpacity(0.2))),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
