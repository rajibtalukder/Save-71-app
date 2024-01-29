import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/model/all_category_model.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';

Widget subCatItem(SubCat subCat){
  return Container(
    height: 190.h,
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10.h),
        Stack(children: [
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(subCat.subCatImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.w),
          width: double.infinity,
          child: subTitleText(subCat.subCatName,
              size: 16, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}