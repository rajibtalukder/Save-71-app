import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/controller/all_category_controller.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  AllCategoryController categoryController =Get.put(AllCategoryController());

  @override
  Widget build(BuildContext context) {
    print(categoryController.addCartModel?.value.message );
    return Scaffold(
      appBar: AppBar(
        title: subTitleText('Cart', size: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
        child: Column(
          children: [
            SizedBox(
              height: 570.h,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    for (int i = 0;
                        i <
                            (categoryController
                                    .addCartModel?.value.orderDetails.length ??
                                0);
                        i++)
                      cartItem(),
                  ],
                ),
              ),
            ),
            customButton('Place Order', textSize: 18),
            SizedBox(height: 10.h),
            customButton('Cancel Order', textSize: 18),
          ],
        ),
      ),
    );
  }

  Widget cartItem() {
    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/profilepic.png'),
                titleText('Coconut \n1 pieces',
                    size: 16, fontWeight: FontWeight.w500),
                const SizedBox(),
                titleText('120.00 \nBDT',
                    size: 16,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w500),
                const Icon(Icons.cancel_outlined)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: secondaryTextColor)),
                child: const Icon(Icons.add),
              ),
              Container(
                height: 30.h,
                width: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: secondaryTextColor)),
                child: Center(
                    child:
                        titleText('2', fontWeight: FontWeight.w400, size: 22)),
              ),
              Container(
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: secondaryTextColor)),
                child: const Icon(Icons.remove),
              )
            ],
          ),
          Divider(
            color: secondaryTextColor.withOpacity(0.4),
            thickness: 1,
          )
        ],
      ),
    );
  }
}
