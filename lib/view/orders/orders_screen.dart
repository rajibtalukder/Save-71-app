import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/constants/colors.dart';
import 'package:save71/view/orders/new_order_details.dart';
import 'package:save71/view/orders/widgets/order_product_item.dart';

import '../../common_widgets/custom_texts.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                        subTitleText('Orders',
                            size: 16, fontWeight: FontWeight.w700)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      subTitleText('Sort by',
                          size: 12, fontWeight: FontWeight.w400),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  subTitleText('New Orders',
                      size: 20, fontWeight: FontWeight.w700),
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 28.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: secondaryTextColor.withOpacity(0.1), width: 1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.sort, size: 16),
                        subTitleText('Sort',
                            size: 12, fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  subTitleText('2', size: 16, fontWeight: FontWeight.w700),
                ],
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                  onTap: (){
                   Get.to(const NewOrderDetails());
                  },
                  child: orderProductItem()),
              GestureDetector(
                  onTap: (){
                    Get.to(const NewOrderDetails());
                  },
                  child: orderProductItem()),
              SizedBox(height: 20.h),
              Row(
                children: [
                  subTitleText('Confirmed Orders',
                      size: 20, fontWeight: FontWeight.w700),
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 28.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: secondaryTextColor.withOpacity(0.1), width: 1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.sort, size: 16),
                        subTitleText('Sort',
                            size: 12, fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  subTitleText('6', size: 16, fontWeight: FontWeight.w700),
                ],
              ),
              SizedBox(height: 10.h),
              for (int i = 0; i < 6; i++) orderProductItem(),
              Row(
                children: [
                  subTitleText('Completed Order',size: 20,fontWeight: FontWeight.w700),
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 28.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: secondaryTextColor.withOpacity(0.1),width: 1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.sort,size: 16),
                        subTitleText('Sort',size: 12,fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  subTitleText('20',size: 16,fontWeight: FontWeight.w700),

                ],
              ),
              for (int i = 0; i < 6; i++) orderProductItem(),
              Row(
                children: [
                  subTitleText('Rejected Orders',size: 20,fontWeight: FontWeight.w700),
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 28.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: secondaryTextColor.withOpacity(0.1),width: 1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.sort,size: 16),
                        subTitleText('Sort',size: 12,fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  subTitleText('0',size: 16,fontWeight: FontWeight.w700),

                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
