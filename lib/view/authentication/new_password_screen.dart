import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';
import '../../constants/utils.dart';
import '../../controller/authentication_controller.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  static AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    authenticationController.otpCntr.value.clear();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              SizedBox(
                height: 17.h,
                width: 80.w,
                child:
                    Image.asset("assets/images/logo.png", color: primaryColor),
              ),
              SizedBox(height: 50.h),
              subTitleText('Forgot Password',
                  fontWeight: FontWeight.w700, size: 20, color: primaryColor),
              SizedBox(height: 10.h),
              subTitleText('New Password',
                  fontWeight: FontWeight.w500, size: 14, color: black),
              SizedBox(height: 10.h),
              customTextField(authenticationController.newPassCntr.value,
                  hintText: 'Enter your password'),
              SizedBox(height: 10.h),
              subTitleText('Confirm Password',
                  fontWeight: FontWeight.w500, size: 14, color: black),
              SizedBox(height: 10.h),
              customTextField(authenticationController.conNewPassCntr.value,
                  hintText: 'Enter your password'),
              SizedBox(height: 30.h),
              customButton('Submit', textSize: 14, color: primaryColor,
                  onPressed: () {
                if (authenticationController.newPassCntr.value.text ==
                    authenticationController.conNewPassCntr.value.text) {
                  authenticationController.postNewPassword();
                }else{
                  Utils.showSnackBar("Password doesn't match");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
