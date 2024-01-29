import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';
import '../../constants/font_constants.dart';

Widget titleText(String text,
    {double size = 28,
      Color color = primaryTextColor,
      FontWeight fontWeight = FontWeight.w700,
      bool seconStyle = false
    }) {
  return Text(
    text,
    style: seconStyle == true ? secondaryTextStyle(size.sp,
      color,
      fontWeight,) : primaryTextStyle(
      size.sp,
      color,
      fontWeight,
    ),
  );
}

Widget subTitleText(String text,
    {double size = 18,
      Color color = primaryTextColor,
      FontWeight fontWeight = FontWeight.w600,
      bool seconStyle = false,
      bool textCenter =false,
    }) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    textAlign: textCenter?TextAlign.center: TextAlign.start,
    style:  seconStyle == true ? secondaryTextStyle(size.sp,
      color,
      fontWeight,) : primaryTextStyle(
      size.sp,
      color,
      fontWeight,
    ),
  );
}
