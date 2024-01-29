import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/controller/all_category_controller.dart';
import 'package:save71/view/allcategory/sub_category_screen.dart';
import 'package:save71/view/allcategory/widgets/sub_cat_item.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  static AllCategoryController catController = Get.put(AllCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: subTitleText('All Category', size: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10.h),
          child: Obx(
            () => SingleChildScrollView(
              child: catController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int j = 0;
                            j <
                                (catController.allCategoryModel.value.mainCat
                                        ?.length ??
                                    0);
                            j++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              subTitleText(
                                  catController.allCategoryModel.value
                                      .mainCat![j].mainCatName,
                                  size: 16,
                                  fontWeight: FontWeight.w700),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    for (int i = 0;
                                        i <
                                            (catController.allCategoryModel
                                                    .value.subCat?.length ??
                                                0);
                                        i++)
                                      if (catController.allCategoryModel.value
                                              .mainCat![j].mainCatId ==
                                          catController.allCategoryModel.value
                                              .subCat![i].subCatRef)
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              SubCategoryScreen(
                                                  catController.allCategoryModel
                                                      .value.subCat![i],
                                                  catController),
                                            );
                                          },
                                          child: subCatItem(catController
                                              .allCategoryModel
                                              .value
                                              .subCat![i]),
                                        )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              const Divider(
                                  color: secondaryTextColor, thickness: 1),
                            ],
                          )
                      ],
                    ),
            ),
          )),
    );
  }
}
