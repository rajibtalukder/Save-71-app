import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';
import '../../../controller/home_controller.dart';
import 'home_popular_product_item.dart';

class AllPopularProducts extends StatelessWidget {
  const AllPopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: subTitleText('All Popular Products', size: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: GetBuilder<HomeController>(
            id: 'popularProUpdate',
            builder: (controller) {
              return controller.popularProductsModel.value.status.isNull
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller
                          .popularProductsModel.value.products?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return homePopularProductItem(controller
                            .popularProductsModel.value.extraCat![index]);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                    );
            }),
      ),
    );
  }
}
