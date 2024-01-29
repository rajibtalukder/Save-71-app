import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/controller/notification_controller.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    notificationController.getNotification();
    return Scaffold(
      appBar: AppBar(
        title: subTitleText('Notification', size: 20),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: black, //change your color here
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
        child: Obx(
          () => notificationController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0;
                          i <
                              notificationController.notificationModel.value
                                  .notifications!.length;
                          i++)
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.w, horizontal: 10.h),
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: borderColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.notifications,
                                  color: notificationController
                                              .notificationModel
                                              .value
                                              .notifications![i]
                                              .isRead ==
                                          1
                                      ? green
                                      : secondaryTextColor),
                              SizedBox(width: 10.w),
                              SizedBox(
                                width: 260.w,
                                child: subTitleText(
                                    notificationController.notificationModel
                                        .value.notifications![i].notification,
                                    color: black,
                                    size: 16),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
