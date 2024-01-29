import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';
import '../../../controller/drawer_screen_controller.dart';

Widget mainCategoryContainer() {
  return Container(
      padding: EdgeInsets.only(left: 10.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            for (int y = 0; y < 3; y++)
              GetBuilder<DrawerScreenController>(
                  id: 'mainCatUpdate',
                  builder: (controller) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.mainCatToggleVisibility(y);
                        },
                        child: Container(
                          height: 52.h,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              subTitleText('Main Categories', size: 14, color: black),
                              controller.mainCategoryVisibility[y]
                                  ? const Icon(Icons.keyboard_arrow_down,
                                  color: black)
                                  :const Icon(Icons.arrow_forward_ios, size: 16, color: black)
                            ],
                          ),
                        ),
                      ),
                      if (controller.mainCategoryVisibility[y])
                        Column(
                          children: [
                            for(int i=0;i<3;i++)
                              Container(
                                height: 52.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 40.w),
                                child: subTitleText('Demo Text', size: 14, color: black),
                              )
                          ],
                        )
                      else
                        SizedBox()
                    ],
                  );
                }
              )
          ],
        ),
      ));
}