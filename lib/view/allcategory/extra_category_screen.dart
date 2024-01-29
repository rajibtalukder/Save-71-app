import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/model/all_category_model.dart';
import 'package:save71/view/allcategory/widgets/cat_item.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';
import '../../controller/all_category_controller.dart';
import '../../controller/authentication_controller.dart';
import '../home/widgets/demo_product_item.dart';
import 'item_details_screen.dart';

class ExtraCategoryScreen extends StatelessWidget {
  final ExtraCat extraCat;
  final AllCategoryController allCategoryController;

  const ExtraCategoryScreen(this.extraCat, this.allCategoryController,
      {super.key});
  static AuthenticationController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Widget> gridItems = [];

    for (int i = 0;
    i <
        (allCategoryController.allCategoryModel.value.allCat?.length ??
            0);
    i++) {
      if (extraCat.extraCatId ==
          allCategoryController
              .allCategoryModel.value.allCat?[i].extraCatId) {
        gridItems.add(
          SizedBox(
              height: 80.h,
              child: catItem(allCategoryController.allCategoryModel.value.allCat![i])),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: subTitleText(extraCat.extraCatName, size: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10.h),
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
            ],
          )),
    );
  }
}
