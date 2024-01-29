import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/common_widgets/custom_text_field.dart';
import 'package:save71/controller/product_controller.dart';
import 'package:save71/view/products/add_faq_screen.dart';
import 'package:save71/view/products/widgets/single_product_item.dart';

import '../../common_widgets/custom_texts.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({super.key});

   ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    productController.productsGet();
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
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back_ios),
                          subTitleText('Products',
                              size: 16, fontWeight: FontWeight.w700)
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.filter_alt_outlined,
                      size: 22,
                    ),
                    subTitleText('Filter',
                        size: 12, fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(height: 20.h),
                customTextField(TextEditingController(),
                    hintText: 'Search Product'),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    customButton('Upload Product', width: 120.w, textSize: 14),
                    customButton('Add Product', width: 120.w, textSize: 14),
                    const SizedBox(),
                  ],
                ),
                SizedBox(height: 20.h),
                subTitleText('Published Products',
                    size: 16, fontWeight: FontWeight.w700),
                SizedBox(height: 20.h),
                GetBuilder<ProductController>(
                    id: 'prodUpdate',
                    builder: (context) {
                      return context.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                for (int i = 0; i < context.publishedProduct.length; i++)
                                  GestureDetector(
                                      onTap: () {
                                        //Get.to(const AddFaqScreen());
                                      },
                                      child: singleProductItem(context.publishedProduct[i])),
                              ],
                            );
                    }),
                SizedBox(height: 20.h),
                subTitleText('Unpublished Products',
                    size: 16, fontWeight: FontWeight.w700),
                SizedBox(height: 20.h),
                GetBuilder<ProductController>(
                    id: 'prodUpdate',
                    builder: (context) {
                      return context.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                        children: [
                          for (int i = 0; i < context.unPublishedProduct.length; i++)
                            GestureDetector(
                                onTap: () {
                                  //Get.to(const AddFaqScreen());
                                },
                                child: singleProductItem(context.unPublishedProduct[i])),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
