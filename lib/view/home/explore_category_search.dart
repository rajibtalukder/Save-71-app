import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/constants/colors.dart';
import 'package:save71/controller/home_controller.dart';
import 'package:save71/model/search_result_model.dart';

import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/custom_texts.dart';

class ExploreCategorySearch extends StatefulWidget {
  const ExploreCategorySearch({super.key});

  @override
  State<ExploreCategorySearch> createState() => _ExploreCategorySearchState();
}

class _ExploreCategorySearchState extends State<ExploreCategorySearch> {
  HomeController homeController = Get.put(HomeController());
  TextEditingController textController = TextEditingController();

  bool isExp = false;

  @override
  Widget build(BuildContext context) {
    homeController.searchResultModel.value = SearchResultModel();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GetBuilder<HomeController>(
                id: 'searchResUpdate',
                builder: (context) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios),
                            subTitleText('Explore Categories',
                                size: 16, fontWeight: FontWeight.w700)
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 46.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          child: TextField(
                            controller: textController,
                            onChanged: (val) {
                              setState(() {
                                homeController.getSearchResult(val);
                                val = textController.text;
                              });
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              hintText: 'Search Product',
                              hintStyle: TextStyle(
                                  color: secondaryTextColor, fontSize: 14.sp),
                              fillColor: whiteLight,
                              //contentPadding: EdgeInsets.only(top: 20.h),
                              //suffixIcon:icon!=null? Icon(icon,color: iconColor??blackTextColor): const SizedBox(),
                            ),
                            style: const TextStyle(
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          subTitleText('Rugs',
                              size: 14, fontWeight: FontWeight.w500),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          )
                        ],
                      ),
                      homeController.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                Divider(
                                    color: secondaryTextColor.withOpacity(0.3),
                                    thickness: 1),
                                for (int i = 0;
                                    i <
                                        (homeController.searchResultModel.value
                                                .searchSuggestions?.length ??
                                            0);
                                    i++)
                                  Column(
                                    children: [
                                      categoryItemRow(
                                          homeController.searchResultModel.value
                                              .searchSuggestions![i],
                                          //isExpanded: isExp,
                                          onPress: () {
                                        // setState(() {
                                        //   isExp = !isExp;
                                        // });
                                      }),
                                      Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1),
                                    ],
                                  ),
                              ],
                            ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Widget categoryItemRow(SearchSuggestion searchSuggestion,
      {bool isExpanded = false, Function()? onPress}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              /*Container(
                width: 24.w,
                height: 24.h,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-photo/shirt-mockup-concept"
                        "-with-plain-clothing_23-2149448748.jpg?w=360&t=st="
                        "1695269616~exp=1695270216~hmac=b78b13b12dd0735448f360"
                        "5eb9bf4d7d3cd5e0b734f68206094c0a26756dcefe"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
              ),*/
              SizedBox(width: 10.w),
              subTitleText(searchSuggestion.name,
                  size: 14, fontWeight: FontWeight.w500),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: onPress,
                child: isExpanded
                    ? const Icon(
                        Icons.keyboard_arrow_down,
                        size: 24,
                      )
                    : const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
              )
            ],
          ),
          isExpanded
              ? Container(
                  height: 100.h,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
