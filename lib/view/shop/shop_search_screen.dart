import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/common_widgets/custom_texts.dart';

import '../../common_widgets/custom_text_field.dart';
import '../../constants/colors.dart';

class ShopSearchScreen extends StatelessWidget {
  const ShopSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: customTextField(TextEditingController(),
                  preficon: Icons.search, iconColor: secondaryDarkTextColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  subTitleText('Recent Searches', size: 12),
                  const Expanded(child: SizedBox()),
                  const Icon(Icons.cleaning_services, size: 12),
                  SizedBox(width: 5.w),
                  subTitleText('Clear History',
                      size: 12, fontWeight: FontWeight.w400),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildResentSearchsItem('T-shirt'),
                      buildResentSearchsItem('Underware'),
                      buildResentSearchsItem('Mouse'),
                      buildResentSearchsItem('Keyboard'),
                      buildResentSearchsItem('Computer'),
                    ],
                  ),
                )),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subTitleText('Last searched', size: 12),
                  SizedBox(height: 10.h),
                  buildLastSearch('Modern clothes'),
                  buildLastSearch('Denim pants size XL'),
                  buildLastSearch('Cool hat'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subTitleText('Popular search', size: 12),
                  SizedBox(height: 10.h),
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: ShapeDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/girl.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              subTitleText('Bondera T-shirt',
                                  fontWeight: FontWeight.w500, size: 14),
                              subTitleText('90K Searches',
                                  fontWeight: FontWeight.w300, size: 10),
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLastSearch(String text) {
    return Row(
      children: [
        const Icon(Icons.access_time, size: 16, color: secondaryTextColor),
        SizedBox(width: 10.w),
        subTitleText(text, size: 12, fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget buildResentSearchsItem(String text) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1, color: secondaryTextColor),
      ),
      child: subTitleText(text, size: 14, fontWeight: FontWeight.w400),
    );
  }
}
