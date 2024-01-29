import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/utils.dart';
import 'package:save71/controller/authentication_controller.dart';
import 'package:save71/view/authentication/login_screen.dart';
import 'package:save71/view/authentication/signup_screen.dart';
import 'package:save71/view/home/main_home_screen.dart';
import 'constants/colors.dart';

class Save71Screen extends StatelessWidget {
  Save71Screen({super.key});

  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    authenticationController.getCurrentLocation();

    return Scaffold(
        body: Obx(
      () => authenticationController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/earth.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 36.0.h,
                    width: 170.0.w,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  SizedBox(height: 20.h),
                  subTitleText(
                      'Save71 helps you connect and business with\nthe people in your life',
                      size: 14,
                      color: white,
                      textCenter: true),
                  SizedBox(height: 20.h),
                  customButton('Log in',
                      textSize: 14,
                      width: 270.w,
                      color: const Color(0xff107956), onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LoginScreen()));

                    authenticationController.getCurrencyCode();
                        //MaterialPageRoute(builder: (_) => MainHomeScreen()));
                  }),
                  SizedBox(height: 15.h),
                  customButton('Sign Up',
                      textSize: 14,
                      width: 270.w,
                      color: const Color(0xff107956), onPressed: () {
                    authenticationController.getCurrentLocation();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const SignupScreen()));
                  }),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
    ));
  }
}
