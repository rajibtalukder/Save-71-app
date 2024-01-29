import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';

Widget productItem({bool isPlusIcon = true}) {
  return Container(
    height: 170.h,
    width: 134.w,
    margin: EdgeInsets.only(right: 10.w),
    padding: EdgeInsets.all(5.w),
    decoration: ShapeDecoration(
      color: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      shadows: const [
        BoxShadow(
          color: Color(0x14000000),
          blurRadius: 8,
          offset: Offset(0, 2),
          spreadRadius: 0,
        )
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(children: [
          Container(
            width: 124.w,
            height: 111.h,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-photo/shirt-mockup-concept"
                    "-with-plain-clothing_23-2149448748.jpg?w=360&t=st="
                    "1695269616~exp=1695270216~hmac=b78b13b12dd0735448f360"
                    "5eb9bf4d7d3cd5e0b734f68206094c0a26756dcefe"),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.r),
                  topRight: Radius.circular(6.r),
                ),
              ),
            ),
          ),
          isPlusIcon? Positioned(
            right: 5.w,
            bottom: 5.h,
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(50.r)),
              child: const Icon(Icons.add,color: primaryColor),
            ),
          ):const SizedBox()
        ]),
        SizedBox(height: 8.h),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 104.w,
                  height: 17.h,
                  child: subTitleText('Nike Shoes limited edition',
                      size: 12, fontWeight: FontWeight.w500)),
              subTitleText('\$56',
                  size: 12, fontWeight: FontWeight.w700, color: orangeLight)
            ],
          ),
        ),
      ],
    ),
  );
}
