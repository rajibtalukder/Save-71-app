import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';
import 'package:save71/view/dashboard/balance_screen.dart';
import 'package:save71/view/dashboard/widgets/dashboard_product_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                    SizedBox(
                      height: 15.h,
                      width: 68.w,
                      child: Image.asset('assets/images/logo.png',
                          color: primaryColor),
                    ),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Image.asset('assets/images/profilepic.png'),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(const BalanceScreen());
                      },
                      child: buildOrderItem(
                          'Total Order', '4367', 'assets/images/clip_right.png'),
                    ),
                    buildOrderItem(
                        'Order Rejected', '56', 'assets/images/clip_close.png'),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildOrderItem(
                        'Total Order', '4367', 'assets/images/clip_right.png'),
                    buildOrderItem(
                        'Order Rejected', '56', 'assets/images/clip_close.png'),
                  ],
                ),
                SizedBox(height: 10.h),
                subTitleText('Popular Products',size: 20),
                SizedBox(height: 10.h),
                dashboardProductItem(),
                dashboardProductItem(),
                dashboardProductItem(),
                dashboardProductItem(),
                dashboardProductItem(),
                dashboardProductItem(),
                SizedBox(height: 10.h),
                subTitleText('Recent Products',size: 20),
                SizedBox(height: 10.h),
                dashboardProductItem(),
                dashboardProductItem(),
                dashboardProductItem(),
                dashboardProductItem(),
                dashboardProductItem(),
                dashboardProductItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOrderItem(String text, String orderCount, String imageUrl) {
    return Container(
      width: 157.w,
      height: 90.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset(imageUrl),
          ),
          subTitleText(text, size: 10),
          subTitleText(orderCount, size: 14, color: primaryColor),
        ],
      ),
    );
  }
}
