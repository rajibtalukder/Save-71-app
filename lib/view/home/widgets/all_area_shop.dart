import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';
import '../../../controller/home_controller.dart';
import 'home_nearest_manufacturer_item.dart';

class AllAreaShop extends StatelessWidget {
  const AllAreaShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: subTitleText('All Area Shop', size: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Text('test'),
        /*GetBuilder<HomeController>(
            id: 'nearManuUpdate',
            builder: (controller) {
              return controller.nearestManufacturerModel.value.status.isNull
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      itemCount: controller
                          .nearestManufacturerModel.value.products?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return homeNearestManufacturerItem(controller
                            .nearestManufacturerModel.value.products![index]);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                    );
            }),*/
      ),
    );
  }
}
