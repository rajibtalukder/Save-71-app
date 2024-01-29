import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_text_field.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';
import 'package:save71/view/authentication/forget_password_screen.dart';
import 'package:save71/view/authentication/signup_screen.dart';

import '../../common_widgets/custom_button.dart';
import '../../constants/utils.dart';
import '../../controller/authentication_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    authenticationController.loginPhoneCntr.value =
        TextEditingController(text: '+880');
    authenticationController.loginPassCntr.value.clear();
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
              SizedBox(height: 10.h),
              subTitleText('Log in',
                  fontWeight: FontWeight.w700, size: 20, color: primaryColor),
              SizedBox(height: 10.h),
              subTitleText('Phone-number',
                  fontWeight: FontWeight.w500, size: 14, color: black),
              SizedBox(height: 10.h),
              customTextField(authenticationController.loginPhoneCntr.value,
                  isKeyboardPhone: true, hintText: 'eg : 01XXX-XXXXXX'),
              SizedBox(height: 10.h),
              subTitleText('Pin',
                  fontWeight: FontWeight.w500, size: 14, color: black),
              SizedBox(height: 10.h),
              customTextField(authenticationController.loginPassCntr.value,
                  obscureText: true, hintText: '**********'),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ForgetPasswordScreen()));
                },
                child: subTitleText('Forgot Password?',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffF55B5B)),
              ),
              SizedBox(height: 10.h),
              customButton('Log in', textSize: 14, color: primaryColor,
                  onPressed: () {
                if (authenticationController
                        .loginPhoneCntr.value.text.isNotEmpty &&
                    authenticationController
                        .loginPassCntr.value.text.isNotEmpty) {
                  authenticationController.emailVerify();
                  authenticationController.login();
                }else{
                  Utils.showSnackBar('Input Fields are required!');
                }
              }),
              SizedBox(height: 10.h),
              Row(
                children: [
                  subTitleText('New User? ',
                      color: secondaryTextColor, size: 12),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const SignupScreen()));
                      },
                      child: subTitleText('SignUp',
                          color: primaryColor, size: 12)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
