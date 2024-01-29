import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/controller/dashboard_controller.dart';
import 'package:save71/view/dashboard/widgets/build_balance.dart';
import 'package:save71/view/dashboard/widgets/build_due_balance.dart';
import 'package:save71/view/dashboard/widgets/build_total_balance.dart';

import '../../constants/colors.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 15.h,
                      width: 68.w,
                      child: Image.asset('assets/images/logo.png',
                          color: primaryColor),
                    ),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Image.asset('assets/images/profilepic.png'),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                allBalance(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildBalanceCategory(
                          'Withdraw',
                          'assets/images/withdraw.png',
                          orangeLight.withOpacity(0.1)),
                      buildBalanceCategory(
                          'Add Money',
                          'assets/images/add_money.png',
                          green.withOpacity(0.1)),
                      buildBalanceCategory(
                          'Custom Filter',
                          'assets/images/filter.png',
                          primaryColor.withOpacity(0.1)),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('My Balance', size: 14),
                    GestureDetector(
                        onTap: () {
                          dashboardController.isBalanceExp.value =
                              !dashboardController.isBalanceExp.value;
                          dashboardController.update(['updateBalance']);
                        },
                        child: GetBuilder<DashboardController>(
                            id: 'updateBalance',
                            builder: (context) {
                              return dashboardController.isBalanceExp.value
                                  ? const Icon(
                                      Icons.keyboard_arrow_up,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                    );
                            }))
                  ],
                ),
                SizedBox(height: 10.h),
                GetBuilder<DashboardController>(
                    id: 'updateBalance',
                    builder: (context) {
                      return dashboardController.isBalanceExp.value
                          ? buildBalance()
                          : const SizedBox();
                    }),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Total Balance', size: 14),
                    GestureDetector(
                      onTap: () {
                        dashboardController.isTotalBalanceExp.value =
                            !dashboardController.isTotalBalanceExp.value;
                        dashboardController.update(['updateTotalBalance']);
                      },
                      child: GetBuilder<DashboardController>(
                          id: 'updateTotalBalance',
                          builder: (context) {
                            return dashboardController.isTotalBalanceExp.value
                                ? const Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                  );
                          }),
                    )
                  ],
                ),SizedBox(height: 10.h),
                GetBuilder<DashboardController>(
                    id: 'updateTotalBalance',
                    builder: (context) {
                      return dashboardController.isTotalBalanceExp.value
                          ? buildTotalBalance()
                          : const SizedBox();
                    }),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Due Balance', size: 14),
                    GestureDetector(
                      onTap: () {
                        dashboardController.isDueBalanceExp.value =
                        !dashboardController.isDueBalanceExp.value;
                        dashboardController.update(['updateDueBalance']);
                      },
                      child: GetBuilder<DashboardController>(
                        id: 'updateDueBalance',
                        builder: (context) {
                          return dashboardController.isDueBalanceExp.value? const Icon(
                            Icons.keyboard_arrow_up,
                            size: 20,
                          ):  const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                          );
                        }
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                GetBuilder<DashboardController>(
                    id: 'updateDueBalance',
                    builder: (context) {
                      return dashboardController.isDueBalanceExp.value
                          ? buildDueBalance()
                          : const SizedBox();
                    }),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Withdraw', size: 14),
                    GestureDetector(
                      onTap: () {
                        dashboardController.isWithdrawExp.value =
                        !dashboardController.isWithdrawExp.value;
                        dashboardController.update(['updateWithdraw']);
                      },
                      child: GetBuilder<DashboardController>(
                        id: 'updateWithdraw',
                        builder: (context) {
                          return dashboardController.isWithdrawExp.value? const Icon(
                            Icons.keyboard_arrow_up,
                            size: 20,
                          ): const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                          );
                        }
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                GetBuilder<DashboardController>(
                    id: 'updateWithdraw',
                    builder: (context) {
                      return dashboardController.isWithdrawExp.value
                          ? const SizedBox()
                          : const SizedBox();
                    }),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildBalanceCategory(String text, String imgUrl, Color color) {
    return SizedBox(
      height: 84.h,
      width: 62.w,
      child: Column(
        children: [
          Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                  child: SizedBox(
                height: 24.h,
                width: 24.w,
                child: Image.asset(imgUrl, fit: BoxFit.contain),
              ))),
          SizedBox(height: 5.h),
          subTitleText(text, size: 10, fontWeight: FontWeight.w500)
        ],
      ),
    );
  }

  Widget allBalance() {
    return Container(
      height: 98.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r), color: primaryColor),
      child: SizedBox(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subTitleText('Total Balance',
                    size: 12, fontWeight: FontWeight.w500, color: white),
                subTitleText('83468.56 BDT',
                    size: 14, fontWeight: FontWeight.w700, color: white),
              ],
            ),
            const VerticalDivider(color: white, thickness: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subTitleText('Due Balance',
                    size: 12, fontWeight: FontWeight.w500, color: white),
                subTitleText('135.45 BDT',
                    size: 14, fontWeight: FontWeight.w700, color: white),
              ],
            ),
            const VerticalDivider(color: white, thickness: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subTitleText('Withdraw',
                    size: 12, fontWeight: FontWeight.w500, color: white),
                subTitleText('35.45 BDT',
                    size: 14, fontWeight: FontWeight.w700, color: white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
