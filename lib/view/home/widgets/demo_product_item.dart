import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';

Widget homeProductItem({bool isPlusIcon = true}) {
  return Container(
    height: 250.h,
    width: 145.w,
    margin: EdgeInsets.only(right: 10.w),
    decoration: ShapeDecoration(
      color: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
          side: BorderSide(color: secondaryTextColor.withOpacity(0.2), width: 1)),
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-photo/shirt-mockup-concept"
                    "-with-plain-clothing_23-2149448748.jpg?w=360&t=st="
                    "1695269616~exp=1695270216~hmac=b78b13b12dd0735448f360"
                    "5eb9bf4d7d3cd5e0b734f68206094c0a26756dcefe"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          isPlusIcon
              ? Positioned(
                  top: 5.w,
                  right: 5.h,
                  child: Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(50.r)),
                    child: const Icon(Icons.remove_red_eye_outlined,
                        color: primaryColor, size: 12),
                  ),
                )
              : const SizedBox()
        ]),
        Container(
          padding: EdgeInsets.all(10.w),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              subTitleText('Air Condition 1',
                  size: 12, fontWeight: FontWeight.w500),
              subTitleText('56 BDT',
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
  );
}
