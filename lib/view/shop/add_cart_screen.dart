import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/view/shop/review_screen.dart';

import '../../constants/colors.dart';

class AddCartScreen extends StatelessWidget {
  const AddCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
        actions: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset('assets/images/share_icon.png'),
          ),
          SizedBox(width: 15.w),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset('assets/images/fav_icon.png'),
          ),
          SizedBox(width: 15.w),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset('assets/images/cart_icon.png'),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.centerRight, child: favListButton()),
                Stack(
                  children: [
                    SizedBox(
                      height: 305.h,
                      width: 375.w,
                      child: Image.network(
                          "https://img.freepik.com/free-photo/shirt-mockup-concept"
                          "-with-plain-clothing_23-2149448748.jpg?w=360&t=st="
                          "1695269616~exp=1695270216~hmac=b78b13b12dd0735448f360"
                          "5eb9bf4d7d3cd5e0b734f68206094c0a26756dcefe",
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            GestureDetector(
                              child: Container(
                                width: 7.w,
                                height: 7.h,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3.0,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: primaryColor),
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: subTitleText('Nike Special Edition KXY5',
                      size: 20, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: subTitleText('\$52.99',
                      size: 20, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: const Row(
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
                          color: secondaryTextColor, size: 18),
                    ],
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: subTitleText(
                        'Lorem ipsum dolor sit amet, consectetuer '
                        'adipiscing elit, sed diam nonummy nibh euismod tincidunt ut'
                        ' laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad '
                        'minim veniam, quis nostrud exerci tation ullamcorper.',
                        size: 14,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 300.h),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: double.infinity,
                height: 232.h,
                color: primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    subTitleText('Select Quantity',
                        size: 20, fontWeight: FontWeight.w700, color: white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60.h,
                          width: 67.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: const Color(0xff13517A),
                          ),
                          child: const Icon(Icons.remove,color: white),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 44.h,
                          width: 54.w,
                          decoration: BoxDecoration(
                              color: const Color(0xff13517A),
                              border: Border.all(color: white, width: 1),
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Center(
                            child: subTitleText('1',
                                size: 20,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 60.h,
                          width: 67.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: const Color(0xff13517A),
                          ),
                          child: const Icon(Icons.add,color: white),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(const ReviewScreen());
                      },
                      child: Container(
                        height: 38.h,
                        width: 144.w,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            border: Border.all(color: white, width: 1),
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Center(
                          child: subTitleText('Add To Cart',
                              size: 16,
                              fontWeight: FontWeight.w700,
                              color: white),
                        ),
                      ),
                    ),
                    const SizedBox(),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Container favListButton() {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      height: 25.h,
      width: 140.w,
      decoration: ShapeDecoration(
        color: white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: subTitleText('Added to favourite list',
            size: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
