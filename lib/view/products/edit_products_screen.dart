import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/common_widgets/custom_text_field.dart';
import 'package:save71/constants/colors.dart';

import '../../common_widgets/custom_texts.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      subTitleText('Edit Products',
                          size: 16, fontWeight: FontWeight.w700)
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                subTitleText('Upload Photos',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      height: 116.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/uploadImg.png"),
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      height: 58.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: const Icon(Icons.add, color: white),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                subTitleText('Product Name',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 5.h),
                customTextField(TextEditingController()),
                SizedBox(height: 20.h),
                subTitleText('Product Price (BDT)',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 5.h),
                customTextField(TextEditingController()),
                SizedBox(height: 20.h),
                subTitleText('Product Category',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 5.h),
                customTextField(TextEditingController()),
                SizedBox(height: 20.h),
                subTitleText('Product Short Description',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 5.h),
                Container(
                  height: 140.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //border: Border.all(color: borderColor,width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    child: TextField(
                      controller: TextEditingController(),
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: '',
                        hintStyle: TextStyle(
                            color: secondaryTextColor, fontSize: 14.sp),
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
                subTitleText('Product Long Description',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 5.h),
                Container(
                  height: 140.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //border: Border.all(color: borderColor,width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    child: TextField(
                      controller: TextEditingController(),
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: '',
                        hintStyle: TextStyle(
                            color: secondaryTextColor, fontSize: 14.sp),
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
                customButton('UpDate Product',textSize: 14),
                SizedBox(height: 20.h),
                customButton('Delet Product',textSize: 14,color: red),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
