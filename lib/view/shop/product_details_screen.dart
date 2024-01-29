import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/view/shop/widgets/buyer_review.dart';

import '../../constants/colors.dart';
import 'add_cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

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
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: subTitleText('Product Specification',
                      size: 20, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      textRow('Weight', '280 gm'),
                      textRow('Size', '7'),
                      textRow('Color', 'Red, White, Blue'),
                      textRow('Category', 'Shoes'),
                      textRow('Waterproof', '2Yes'),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: subTitleText('FAQ Questions',
                      size: 20, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Divider(
                      color: secondaryTextColor.withOpacity(0.5), thickness: 1),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      singleTextRow('How the Products are made?'),
                      SizedBox(height: 10.h),
                      singleTextRow('How the Products are made?'),
                      SizedBox(height: 10.h),
                      singleTextRow('How the Products are made?'),
                      SizedBox(height: 10.h),
                      singleTextRow('How the Products are made?'),
                      SizedBox(height: 10.h),
                      singleTextRow('How the Products are made?'),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                Divider(
                    color: secondaryTextColor.withOpacity(0.5), thickness: 1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText('See All 59 Answered Questions',
                          size: 16, fontWeight: FontWeight.w700),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 18,
                        color: secondaryTextColor,
                      )
                    ],
                  ),
                ),
                Divider(
                    color: secondaryTextColor.withOpacity(0.5), thickness: 1),
                SizedBox(height: 10.h),
                Align(
                    alignment: Alignment.center,
                    child: subTitleText('Customer Reviews',
                        size: 20, fontWeight: FontWeight.w700)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_rate_rounded, color: orangeLight, size: 30),
                    Icon(Icons.star_rate_rounded, color: orangeLight, size: 30),
                    Icon(Icons.star_rate_rounded, color: orangeLight, size: 30),
                    Icon(Icons.star_rate_rounded, color: orangeLight, size: 30),
                    Icon(Icons.star_rate_rounded, color: orangeLight, size: 30),
                  ],
                ),
                Align(
                    alignment: Alignment.center,
                    child: subTitleText('5 out of 5 star',
                        size: 14, fontWeight: FontWeight.w500)),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    children: [
                      Container(
                        height: 26.h,
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.only(
                            top: 4.h, left: 4.w, right: 16.w, bottom: 4.h),
                        decoration: ShapeDecoration(
                          color: whiteLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                        child: Center(
                          child: subTitleText('All',
                              size: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          starContainer('5'),
                          starContainer('4'),
                          starContainer('3'),
                          starContainer('2'),
                          starContainer('1'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: subTitleText('Top Reviews',
                      size: 14, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      buyerReview(),
                      SizedBox(height: 5.h),
                      Divider(
                          color: secondaryTextColor.withOpacity(0.5),
                          thickness: 1),
                      SizedBox(height: 5.h),
                      buyerReview(),
                      SizedBox(height: 5.h),
                      Divider(
                          color: secondaryTextColor.withOpacity(0.5),
                          thickness: 1),
                      SizedBox(height: 5.h),
                      buyerReview(),
                      SizedBox(height: 5.h),
                      Divider(
                          color: secondaryTextColor.withOpacity(0.5),
                          thickness: 1),
                      SizedBox(height: 5.h),
                      buyerReview(),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText('See All 59 Reviews',
                          size: 16, fontWeight: FontWeight.w700),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 18,
                        color: secondaryTextColor,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){
                Get.to(const AddCartScreen());
              },
              child: Container(
                width: double.infinity,
                height: 78.h,
                color: primaryColor,
                child: Center(
                    child: subTitleText('Add to cart',
                        size: 20, fontWeight: FontWeight.w700,color: white)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container starContainer(String num) {
    return Container(
      height: 26.h,
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.only(top: 4.h, left: 4.w, right: 16.w, bottom: 4.h),
      decoration: ShapeDecoration(
        color: whiteLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
      child: Center(
        child: subTitleText('$num Star', size: 12, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget singleTextRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        subTitleText(text, size: 14, fontWeight: FontWeight.w600),
        const Icon(Icons.keyboard_arrow_down)
      ],
    );
  }

  Widget textRow(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        subTitleText(text1,
            size: 14, fontWeight: FontWeight.w400, color: secondaryTextColor),
        subTitleText(text2,
            size: 14, fontWeight: FontWeight.w400, color: black),
      ],
    );
  }
}
