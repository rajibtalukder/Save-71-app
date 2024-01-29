import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/common_widgets/custom_texts.dart';

import '../../../constants/colors.dart';

Widget categoryItem() {
  return Container(
    height: 49.h,
    margin: EdgeInsets.only(right: 10.w),
    padding: EdgeInsets.only(top: 4.h, left: 4.w, right: 16.w, bottom: 4.h),
    decoration: ShapeDecoration(
      color: whiteLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.r),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 41.w,
              height: 41.h,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://img.freepik.com/free-photo/shirt-mockup-concept"
                      "-with-plain-clothing_23-2149448748.jpg?w=360&t=st="
                      "1695269616~exp=1695270216~hmac=b78b13b12dd0735448f360"
                      "5eb9bf4d7d3cd5e0b734f68206094c0a26756dcefe"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.r),
                ),
              ),
            ),
            SizedBox(width: 6.w),
            subTitleText('Shirts', fontWeight: FontWeight.w500, size: 14),
          ],
        ),
      ],
    ),
  );
}
