import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/view/home/widgets/demo_product_item.dart';
import 'package:save71/view/shop/widgets/image_slider.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';
import '../../controller/all_category_controller.dart';
import '../../controller/authentication_controller.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  static AuthenticationController controller = Get.find();
  static AllCategoryController catController = Get.put(AllCategoryController());

  static TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: subTitleText('Details', size: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
        child: GetBuilder<AuthenticationController>(
            id: 'prodDetailsUpdate',
            builder: (controller) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          ImageSlider(
                            productDetails: controller.productModel.value,
                          ),
                          SizedBox(height: 10.h),
                          titleText(
                              controller.productModel.value.product?[0]
                                      .productName ??
                                  '',
                              size: 26,
                              color: primaryColor),
                          subTitleText(
                              controller.productModel.value.product?[0]
                                      .productDetailsDes ??
                                  '',
                              size: 14),
                          subTitleText(
                              controller.productModel.value.product?[0]
                                      .productPrice
                                      .toStringAsFixed(2) ??
                                  '',
                              size: 18),
                          subTitleText(
                              controller
                                      .productModel.value.product?[0].productId
                                      .toString() ??
                                  '',
                              size: 12),
                          subTitleText('Reviews', size: 12),
                          subTitleText(
                              'Category : ${controller.productModel.value.product?[0].extraCatName.toString()}',
                              size: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_pin,
                                  size: 16, color: primaryColor),
                              subTitleText('Location', size: 12),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  catController.addToCart(
                                      prodId: controller.productModel.value
                                          .product?[0].productId
                                          .toString(),
                                      sellerId: controller.productModel.value
                                          .product?[0].sellerId
                                          .toString());
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.r))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.shopping_cart,
                                          color: white, size: 16),
                                      subTitleText('Add to Cart',
                                          size: 14, color: white),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.h),
                              GestureDetector(
                                onTap: () {
                                  catController.postAddShop(
                                    prodId: controller.productModel.value
                                        .product?[0].productId
                                        .toString(),
                                    prodName: controller.productModel.value
                                        .product?[0].productName,
                                    prodPrice: controller.productModel.value
                                        .product?[0].productPrice
                                        .toString(),
                                    sellerId: controller
                                        .productModel.value.product?[0].sellerId
                                        .toString(),
                                  );
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.r))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.shopping_cart,
                                          color: white, size: 16),
                                      subTitleText('Add to Shop',
                                          size: 14, color: white),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              customButton('Description',
                                  textSize: 14,
                                  color: primaryTextColor,
                                  width: 80),
                              customButton('Reviews', onPressed: () {
                                dialogBox(context);
                              },
                                  textSize: 14,
                                  color: secondaryTextColor,
                                  width: 80),
                              customButton('FAQ',
                                  textSize: 14,
                                  color: secondaryTextColor,
                                  width: 80),
                              const SizedBox(),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            height: 100.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: secondaryTextColor),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  titleText('You might also like', size: 18)),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 400.h,
                            child: GridView.builder(
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return homeProductItem();
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                            ),
                          )
                        ],
                      ),
              );
            }),
      ),
    );
  }

  Future<dynamic> dialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              height: 300.h,
              width: 300.w,
              child: Column(
                children: [
                  titleText('Rate this product',
                      fontWeight: FontWeight.w500, size: 20),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      catController.rating.value = rating.toInt();
                    },
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 90.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      child: TextField(
                        maxLines: 4,
                        controller: reviewController,
                        enabled: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          hintText: 'Enter comment here...',
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
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 30.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: secondaryTextColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r))),
                          child: Center(
                            child:
                                subTitleText('Close', size: 14, color: white),
                          ),
                        ),
                      ),
                      SizedBox(width: 30.h),
                      GestureDetector(
                        onTap: () async {
                          await catController
                              .postItemReview(
                                  des: reviewController.text,
                                  prodID: controller
                                      .productModel.value.product?[0].productId
                                      .toString())
                              .then((value) {
                            reviewController.clear();
                            Get.back();
                          });
                        },
                        child: Container(
                          height: 30.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r))),
                          child: Center(
                            child:
                                subTitleText('Submit', size: 14, color: white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
