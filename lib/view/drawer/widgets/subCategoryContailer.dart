import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_texts.dart';
import '../../../constants/colors.dart';
import '../../../controller/drawer_screen_controller.dart';
import 'mainCategoryContainer.dart';

Widget subCategoryContainer() {
  return Container(
    padding: EdgeInsets.only(left: 10.w),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          for (int x = 0; x < 15; x++)
            GetBuilder<DrawerScreenController>(
                id: 'subCatUpdate',
                builder: (con) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          con.subCatToggleVisibility(x);
                        },
                        child: Container(
                          height: 52.h,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              subTitleText('Sub Categories',
                                  size: 14, color: black),
                              con.subCategoryVisibility[x]
                                  ? const Icon(Icons.keyboard_arrow_down,
                                      color: black)
                                  : const Icon(Icons.arrow_forward_ios,
                                      size: 16, color: black)
                            ],
                          ),
                        ),
                      ),
                      if (con.subCategoryVisibility[x])
                        mainCategoryContainer()
                      else
                        SizedBox()
                    ],
                  );
                }),
        ],
      ),
    ),
  );
}


