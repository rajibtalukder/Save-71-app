import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/common_widgets/custom_texts.dart';

import '../../constants/colors.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    subTitleText('Submit Review',
                        size: 16, fontWeight: FontWeight.w700)
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              subTitleText('How good was the product?',
                  size: 14, fontWeight: FontWeight.w500),
              SizedBox(height: 20.h),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.star, color: Colors.grey, size: 60),
                Icon(Icons.star, color: Colors.grey, size: 60),
                Icon(Icons.star, color: Colors.grey, size: 60),
                Icon(Icons.star, color: Colors.grey, size: 60),
                Icon(Icons.star, color: Colors.grey, size: 60),
              ]),
              SizedBox(height: 20.h),
              subTitleText('Write your review',
                  size: 14, fontWeight: FontWeight.w500),
              SizedBox(height: 10.h),
              Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    //border: Border.all(color: borderColor,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.text,
                    maxLines: 8,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      hintText: 'Type Description',
                      hintStyle:
                          TextStyle(color: secondaryTextColor, fontSize: 14.sp),
                      fillColor: whiteLight,
                    ),
                    style: const TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 300.h),
              customButton('Submit Review',
                  color: secondaryTextColor,
                  textSize: 14)
            ],
          ),
        ),
      ),
    );
  }
}
