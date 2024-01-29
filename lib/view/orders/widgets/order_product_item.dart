import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';

Widget orderProductItem() {
  return Container(
    width: double.infinity,
    height: 84.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            subTitleText('Shoulder Drop T-shirt', size: 14, fontWeight: FontWeight.w700),
            subTitleText('5120 BDT', size: 12, fontWeight: FontWeight.w400),
            subTitleText('Order ID: G678XVC78', size: 12, fontWeight: FontWeight.w400),
          ],
        ),
        const Expanded(child: SizedBox()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            subTitleText('X 02', size: 12, fontWeight: FontWeight.w400),
            Container(
              height: 33.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.network(
                    "https://img.freepik.com/free-photo/shirt-mockup-concept"
                        "-with-plain-clothing_23-2149448748.jpg?w=360&t=st="
                        "1695269616~exp=1695270216~hmac=b78b13b12dd0735448f360"
                        "5eb9bf4d7d3cd5e0b734f68206094c0a26756dcefe",
                    fit: BoxFit.fill),
              ),
            ),
          ],
        ),


      ],
    ),
  );
}
