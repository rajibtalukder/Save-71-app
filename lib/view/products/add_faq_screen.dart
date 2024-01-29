import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/common_widgets/custom_text_field.dart';
import 'package:save71/constants/colors.dart';

import '../../common_widgets/custom_texts.dart';
import 'edit_products_screen.dart';

class AddFaqScreen extends StatelessWidget {
  const AddFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
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
                  subTitleText('Add FAQ', size: 16, fontWeight: FontWeight.w700)
                ],
              ),
            ),
            SizedBox(height: 20.h),
            subTitleText('FAQ Question', size: 14, fontWeight: FontWeight.w500),
            SizedBox(height: 10.h),
            customTextField(TextEditingController()),
            SizedBox(height: 20.h),
            subTitleText('FAQ Question', size: 14, fontWeight: FontWeight.w500),
            SizedBox(height: 10.h),
            customTextField(TextEditingController()),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 40.h,
                    width: 157.w,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.done,
                      color: white,
                    ))),
                Container(
                    height: 40.h,
                    width: 157.w,
                    decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.close,
                      color: white,
                    ))),
              ],
            ),
            const Expanded(child: SizedBox()),
            customButton('ADD Another', textSize: 14),
            SizedBox(height: 20.h),
            customButton('Product Preview', textSize: 14, onPressed: () {
              Get.to(const EditProductScreen());
            }),
            SizedBox(height: 20.h),
            customButton('Finish', textSize: 14),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    ));
  }
}
