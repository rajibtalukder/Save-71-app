import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/model/all_category_model.dart';
import 'package:save71/view/allcategory/extra_category_screen.dart';
import 'package:save71/view/allcategory/widgets/extra_cat_item.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';
import '../../controller/all_category_controller.dart';

class SubCategoryScreen extends StatelessWidget {
  final SubCat subCat;
  final AllCategoryController allCategoryController;

  const SubCategoryScreen(this.subCat, this.allCategoryController, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> gridItems = [];

    for (int i = 0;
        i <
            (allCategoryController.allCategoryModel.value.extraCat?.length ??
                0);
        i++) {
      if (subCat.subCatId ==
          allCategoryController
              .allCategoryModel.value.extraCat?[i].extraCatRef) {
        gridItems.add(
          GestureDetector(
            onTap: () {
              Get.to(ExtraCategoryScreen(
                  allCategoryController.allCategoryModel.value.extraCat![i],
                  allCategoryController));
            },
            child: SizedBox(
                height: 80.h,
                child: extraCatItem(
                    allCategoryController.allCategoryModel.value.extraCat![i])),
          ),
        );
      }
    }

    //var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: subTitleText(subCat.subCatName, size: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 660.h,
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    // Set the number of columns as per your requirement
                    childAspectRatio: 1.4 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: gridItems,
                  ),
                ),

                /*for (int i = 0;
                    i <
                        (allCategoryController
                                .allCategoryModel.value.extraCat?.length ??
                            0);
                    i++)
                  if (subCat.subCatId ==
                      allCategoryController
                          .allCategoryModel.value.extraCat?[i].extraCatRef)
                    Text('data'),*/
              ],
            ),
          )),
    );
  }
}
