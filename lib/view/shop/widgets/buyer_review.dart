import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';

Widget buyerReview() {
  return Column(
    children: [
      Row(
        children: [
          Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r)),
            child: Image.asset('assets/images/profilepic.png'),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subTitleText('Buyer',
                  size: 14, fontWeight: FontWeight.w500),
              subTitleText('8 day ago.',
                  size: 12,
                  fontWeight: FontWeight.w400,
                  color: secondaryTextColor),
            ],
          ),
          const Expanded(child: SizedBox()),
          const Row(
            children: [
              Icon(Icons.star_rate_rounded,
                  color: orangeLight, size: 18),
              Icon(Icons.star_rate_rounded,
                  color: orangeLight, size: 18),
              Icon(Icons.star_rate_rounded,
                  color: orangeLight, size: 18),
              Icon(Icons.star_rate_rounded,
                  color: orangeLight, size: 18),
              Icon(Icons.star_rate_rounded,
                  color: orangeLight, size: 18),
            ],
          ),
        ],
      ),
      subTitleText(
          'Lorem ipsum dolor sit amet, consectetuer '
              'adipiscing elit, sed diam nonummy nibh euismod '
              'tincidunt ut laoreet dolore.',
          size: 14,
          fontWeight: FontWeight.w400)
    ],
  );
}