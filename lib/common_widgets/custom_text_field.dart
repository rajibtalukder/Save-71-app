
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

Widget customTextField(TextEditingController controller,
    {
      bool obscureText = false,
      bool? isValid,
      bool isKeyboardPhone= false,
      IconData? icon,
      IconData? preficon,
      Color? iconColor,
      double? height,
      String? hintText,
      String? errorText,
      bool? isActive,
    }) {
  return Column(
    children: [
      Container(
        height: height?.h??46.h,
        width: double.infinity,
        decoration: BoxDecoration(

          //border: Border.all(color: borderColor,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8.r))
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          child: TextField(
            controller: controller,
            enabled: isActive??true,
            keyboardType:isKeyboardPhone?TextInputType.number: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: secondaryTextColor,fontSize: 14.sp),
              fillColor: whiteLight,
              //contentPadding: EdgeInsets.only(top: 20.h),
              suffixIcon:icon!=null? Icon(icon,color: iconColor??blackTextColor): const SizedBox(),
              prefixIcon:preficon!=null? Icon(preficon,color: iconColor??blackTextColor):null,
            ),
            obscureText: obscureText,
            style: const TextStyle(
              color: primaryTextColor,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
        ),
      ),
      if (isValid != null && !isValid)
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              errorText ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: red,
              ),
            ),
          ),
        ),
    ],
  );
}
