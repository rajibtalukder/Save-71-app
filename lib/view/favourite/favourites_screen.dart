import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back_ios),
                          subTitleText('Favorite\'s',
                              size: 16, fontWeight: FontWeight.w700)
                        ],
                      ),
                    ),
                    subTitleText('4', fontWeight: FontWeight.w700, size: 16),
                  ],
                ),
                SizedBox(height: 20.h),
                for(int i=0; i<4;i++)
                  Container(
                  width: double.infinity,
                  height: 70.h,
                  padding: EdgeInsets.all(10.w),
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: ShapeDecoration(
                    color: white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r)),
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
                      Container(
                        height: 44.h,
                        width: 48.w,
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
                      SizedBox(width: 15.w),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subTitleText('Name',
                              size: 14, fontWeight: FontWeight.w500),
                          subTitleText('shirts',
                              size: 12, fontWeight: FontWeight.w400),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        children: [
                          subTitleText('2500 TK',
                              size: 14, fontWeight: FontWeight.w400),
                          subTitleText('Remove',
                              size: 12,
                              color: extraColor,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
