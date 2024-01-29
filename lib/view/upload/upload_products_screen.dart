import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/constants/colors.dart';
import 'package:save71/view/upload/upload_store_product_screen.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/custom_texts.dart';

class UploadProductsScreen extends StatelessWidget {
  const UploadProductsScreen({super.key});

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
                          subTitleText('Upload Products',
                              size: 16, fontWeight: FontWeight.w700)
                        ],
                      ),
                    ),
                    Container(
                      height: 30.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: primaryColor),
                      child: Center(
                        child: subTitleText('Upload Store Product',
                            size: 10,
                            fontWeight: FontWeight.w500,
                            color: white),
                      ),
                    )
                  ],
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
                        border: Border.all(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Center(
                          child: SizedBox(
                              height: 45.h,
                              width: 45.w,
                              child: Image.asset("assets/images/gallery.png"))),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () {
                        buildShowDialog(context);
                      },
                      child: Container(
                        height: 58.h,
                        width: 36.w,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: const Icon(Icons.add, color: white),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                subTitleText('Product Name',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 5.h),
                customTextField(TextEditingController(),
                    hintText: 'eg : Monitor'),
                SizedBox(height: 20.h),
                subTitleText('Product Price (BDT)',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 5.h),
                customTextField(TextEditingController(), hintText: '500 BDT'),
                SizedBox(height: 20.h),
                subTitleText('Product Category',
                    size: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 5.h),
                customTextField(TextEditingController(),
                    hintText: 'Computer', icon: Icons.keyboard_arrow_down),
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
                        hintText: 'Type Description',
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
                        hintText: 'Type Description',
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
                customButton('UpDate Product', textSize: 14,onPressed: (){
                  Get.to(const UploadStoreProductScreen());
                }),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                content: Container(
                                  height: 100.h,
                                  width: 328.w,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius:
                                          BorderRadius.circular(8.r)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Row(
                                        children: [
                                          Container(
                                            height: 28.h,
                                            width: 28.w,
                                            decoration: BoxDecoration(
                                                color: primaryColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.r)),
                                            child: Center(
                                              child: SizedBox(
                                                height: 20.h,
                                                width: 20.w,
                                                child: Image.asset(
                                                    'assets/images/video.png'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          subTitleText('Upload Video',
                                              size: 14,
                                              fontWeight: FontWeight.w500)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 28.h,
                                            width: 28.w,
                                            decoration: BoxDecoration(
                                                color: yellow.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.r)),
                                            child: Center(
                                              child: SizedBox(
                                                height: 20.h,
                                                width: 20.w,
                                                child: Image.asset(
                                                    'assets/images/photos.png'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          subTitleText('Upload Photo',
                                              size: 14,
                                              fontWeight: FontWeight.w500)
                                        ],
                                      ),
                                      const SizedBox()
                                    ],
                                  ),
                                ),
                              ));
  }
}
