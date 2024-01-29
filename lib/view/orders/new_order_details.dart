import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/common_widgets/custom_text_field.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';

class NewOrderDetails extends StatelessWidget {
  const NewOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subTitleText('New Order',
                                size: 12, fontWeight: FontWeight.w400),
                            subTitleText('Order ID : 54fgnklbv',
                                size: 16, fontWeight: FontWeight.w700),
                          ],
                        )
                      ],
                    ),
                  ),
                  subTitleText('Date : 22/11',
                      size: 12, fontWeight: FontWeight.w500),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 70.h,
                //padding: EdgeInsets.all(10.w),
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: ShapeDecoration(
                  color: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70.h,
                      width: 80.w,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        subTitleText('Item Name',
                            size: 14, fontWeight: FontWeight.w700),
                        subTitleText('Quantity : 02',
                            size: 12, fontWeight: FontWeight.w500),
                        subTitleText('5120 BDT',
                            size: 12, fontWeight: FontWeight.w500),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 20.h,
                        width: 86.w,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(10.5.r),
                        ),
                        child: Center(
                            child: subTitleText('Out Of Stock',
                                size: 10, color: white)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                height: 70.h,
                //padding: EdgeInsets.all(10.w),
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: ShapeDecoration(
                  color: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70.h,
                      width: 80.w,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        subTitleText('Item Name',
                            size: 14, fontWeight: FontWeight.w700),
                        subTitleText('Quantity : 02',
                            size: 12, fontWeight: FontWeight.w500),
                        subTitleText('5120 BDT',
                            size: 12, fontWeight: FontWeight.w500),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 20.h,
                        width: 86.w,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(10.5.r),
                        ),
                        child: Center(
                            child: subTitleText('Out Of Stock',
                                size: 10, color: white)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Image.asset('assets/images/calendar.png')),
                  SizedBox(width: 10.w),
                  subTitleText('Placed Date', size: 14),
                  const Expanded(child: SizedBox()),
                  subTitleText('02/12/22',
                      size: 12,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w500),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Image.asset('assets/images/location.png')),
                  SizedBox(width: 10.w),
                  subTitleText('Delivery Address', size: 14),
                  const Expanded(child: SizedBox()),
                ],
              ),
              SizedBox(height: 20.h),
              subTitleText('Kazla, Rajshahi',
                  size: 12,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w500),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Image.asset('assets/images/location.png')),
                  SizedBox(width: 10.w),
                  subTitleText('Customer Details', size: 14),
                  const Expanded(child: SizedBox()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: whiteLight),
                    child: Center(
                      child: subTitleText('Md.Rezoan',
                          size: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: whiteLight),
                    child: Center(
                      child: subTitleText('01799040321',
                          size: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Image.asset('assets/images/truck.png')),
                  SizedBox(width: 10.w),
                  subTitleText('Delivery Charge', size: 14),
                  const Expanded(child: SizedBox()),
                ],
              ),
              SizedBox(height: 20.h),
              customTextField(TextEditingController(),
                  hintText: 'Write Delivery Charge'),
              SizedBox(height: 20.h),
              Container(
                height: 218.h,
                width: double.infinity,
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: const [
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
                    subTitleText('Client Information', size: 14),
                    subTitleText('Phone Number',
                        size: 12, fontWeight: FontWeight.w400),
                    customTextField(TextEditingController(),
                        hintText: '01685899423'),
                    subTitleText('Name', size: 12, fontWeight: FontWeight.w400),
                    customTextField(TextEditingController(),
                        hintText: 'Md. Tuhin'),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subTitleText('Invoice', size: 14),
                  Container(
                    height: 20.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.circular(10.5.r),
                    ),
                    child: Center(
                        child: subTitleText('Unpaid', size: 10, color: white)),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      subTitleText('Shoulder Drop T-shirt',
                          size: 14, fontWeight: FontWeight.w700),
                      subTitleText('2 pcs',
                          size: 12, fontWeight: FontWeight.w400),
                    ],
                  ),
                  subTitleText('5120 BDT',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      subTitleText('Shoulder Drop T-shirt',
                          size: 14, fontWeight: FontWeight.w700),
                      subTitleText('2 pcs',
                          size: 12, fontWeight: FontWeight.w400),
                    ],
                  ),
                  subTitleText('5120 BDT',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ],
              ),
              const Divider(
                height: 1,
                color: black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subTitleText('Total', size: 14, fontWeight: FontWeight.w700),
                  subTitleText('13587 BDT',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ],
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton('Cancle Order',
                      width: 160.w, color: red, textSize: 14),
                  customButton('Request Review',
                      width: 160.w,
                      color: secondaryTextColor.withOpacity(0.6),
                      textSize: 14),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
