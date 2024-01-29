import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/view/upload/upload_success_screen.dart';

import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';

class UploadStoreProductScreen extends StatelessWidget {
  const UploadStoreProductScreen({super.key});

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
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      subTitleText('Upload From Store Products',
                          size: 16, fontWeight: FontWeight.w700)
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  height: 185.h,
                  width: 328.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  decoration: ShapeDecoration(
                    color: white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText('Product Category',
                          size: 14, fontWeight: FontWeight.w500),
                      SizedBox(height: 5.h),
                      customTextField(TextEditingController(),
                          hintText: 'T-shirt', icon: Icons.keyboard_arrow_down),
                      customButton('See Products',textSize: 14,onPressed: (){
                        Get.to(const UploadSuccessScreen());
                      }),
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
