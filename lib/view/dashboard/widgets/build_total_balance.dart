import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/common_widgets/custom_text_field.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';

Widget buildTotalBalance() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      subTitleText('Orders',
          color: primaryColor, size: 14, fontWeight: FontWeight.w500),
      Divider(
        color: secondaryTextColor.withOpacity(0.4),
        thickness: 1,
      ),
      subTitleText('Orders ID', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),
      subTitleText('Delivery Date', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),
      subTitleText('Amount', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),

      SizedBox(height: 20.h),
      subTitleText('Reference',
          color: primaryColor, size: 14, fontWeight: FontWeight.w500),
      Divider(
        color: secondaryTextColor.withOpacity(0.4),
        thickness: 1,
      ),
      subTitleText('Set Phone Number', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),
      subTitleText('Ref Date', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),
      subTitleText('Ref Amount', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),

      SizedBox(height: 20.h),
      subTitleText('Sent Money',
          color: primaryColor, size: 14, fontWeight: FontWeight.w500),
      Divider(
        color: secondaryTextColor.withOpacity(0.4),
        thickness: 1,
      ),
      subTitleText('Phone Number', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),
      subTitleText('Sent Date', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),
      subTitleText('Sent Amount', size: 12, fontWeight: FontWeight.w500),
      customTextField(TextEditingController(),hintText: 'XXXXXXXXXXXXX'),

      SizedBox(height: 20.h),
    ],
  );
}
