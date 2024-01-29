import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';
import 'custom_texts.dart';

Widget customButton(
  String text, {
  Function()? onPressed,
  double? width,
      double? textSize,
  color = primaryColor,
      textColor=white,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
        height: 56.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: subTitleText(text, size:textSize?? 20, color: textColor),
        )),
  );
}
