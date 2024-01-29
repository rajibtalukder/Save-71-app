import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';

Widget buildBalance() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          subTitleText('Payment History', size: 14),
          Container(
            height: 24.h,
            width: 60.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                    color: secondaryTextColor.withOpacity(0.2), width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                subTitleText('All',
                    color: secondaryTextColor,
                    size: 10,
                    fontWeight: FontWeight.w400),
                const Icon(Icons.keyboard_arrow_down,
                    size: 16, color: secondaryTextColor),
              ],
            ),
          )
        ],
      ),
      for (int i = 0; i < 5; i++)
        Column(
          children: [
            Divider(
              color: secondaryTextColor.withOpacity(0.4),
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subTitleText('+2345.45 BDT',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: primaryColor),
                subTitleText('13 June 2023',
                    size: 10, fontWeight: FontWeight.w400),
              ],
            ),
          ],
        ),

      SizedBox(height: 10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          subTitleText('Transaction History', size: 14),
          Container(
            height: 24.h,
            width: 60.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                    color: secondaryTextColor.withOpacity(0.2), width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                subTitleText('All',
                    color: secondaryTextColor,
                    size: 10,
                    fontWeight: FontWeight.w400),
                const Icon(Icons.keyboard_arrow_down,
                    size: 16, color: secondaryTextColor),
              ],
            ),
          )
        ],
      ),
      for (int i = 0; i < 5; i++)
        Column(
          children: [
            Divider(
              color: secondaryTextColor.withOpacity(0.4),
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subTitleText('+2345.45 BDT',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: primaryColor),
                subTitleText('13 June 2023',
                    size: 10, fontWeight: FontWeight.w400),
              ],
            ),
          ],
        ),
      SizedBox(height: 10.h),
    ],
  );
}
