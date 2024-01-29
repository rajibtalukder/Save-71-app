import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:save71/common_widgets/custom_text_field.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';
import 'package:save71/constants/utils.dart';
import 'package:save71/view/shop/myshop_screen.dart';
import '../../common_widgets/custom_button.dart';
import '../../constants/font_constants.dart';
import '../../controller/authentication_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? gender;
  String? selectedValue;
  List dropdownItems = ['Shopping & Retail', 'Manufacturer & Wholesalers'];
  String? type;

  AuthenticationController authenticationController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    authenticationController.fNameCtlr.value.clear();
    authenticationController.lNameCtlr.value.clear();
    authenticationController.emailCtlr.value.clear();
    authenticationController.phoneCtlr.value =
        TextEditingController(text: '+880');
    authenticationController.passCtlr.value.clear();
    authenticationController.refCtlr.value =
        TextEditingController(text: '+880');
    authenticationController.date = 'yyyy-MM-dd';
    // setState(() {
    //   print(authenticationController.lat);
    //   print(authenticationController.lng);
    //   print('object');
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(authenticationController.lat);
    print(authenticationController.lng);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  height: 17.h,
                  width: 80.w,
                  child: Image.asset("assets/images/logo.png",
                      color: primaryColor),
                ),
                SizedBox(height: 10.h),
                subTitleText('Sign Up',
                    fontWeight: FontWeight.w700, size: 20, color: primaryColor),
                SizedBox(height: 10.h),
                subTitleText('First name',
                    fontWeight: FontWeight.w500, size: 14, color: black),
                SizedBox(height: 10.h),
                customTextField(authenticationController.fNameCtlr.value,
                    hintText: 'Name of user'),
                SizedBox(height: 10.h),
                subTitleText('Last name',
                    fontWeight: FontWeight.w500, size: 14, color: black),
                SizedBox(height: 10.h),
                customTextField(authenticationController.lNameCtlr.value,
                    hintText: 'Name of user'),
                SizedBox(height: 10.h),
                subTitleText('Email',
                    fontWeight: FontWeight.w500, size: 14, color: black),
                SizedBox(height: 10.h),
                customTextField(authenticationController.emailCtlr.value,
                    hintText: 'example57@gmail.com'),
                SizedBox(height: 10.h),
                subTitleText('Phone-number',
                    fontWeight: FontWeight.w500, size: 14, color: black),
                SizedBox(height: 10.h),
                customTextField(authenticationController.phoneCtlr.value,
                    isKeyboardPhone: true, hintText: 'eg : 01XXX-XXXXXX'),
                SizedBox(height: 10.h),
                subTitleText('Pin',
                    fontWeight: FontWeight.w500, size: 14, color: black),
                SizedBox(height: 10.h),
                customTextField(authenticationController.passCtlr.value,
                    obscureText: true, hintText: '********'),
                SizedBox(height: 10.h),
                subTitleText('Shop Type',
                    fontWeight: FontWeight.w500, size: 14, color: black),
                SizedBox(height: 10.h),
                dropDown(),
                SizedBox(height: 10.h),
                subTitleText('Gender',
                    fontWeight: FontWeight.w500, size: 14, color: black),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Radio(
                          value: "Male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                    ),
                    SizedBox(width: 10.w),
                    subTitleText('Male', size: 12, fontWeight: FontWeight.w400),
                    SizedBox(width: 20.w),
                    SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Radio(
                            value: "Female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            })),
                    SizedBox(width: 10.w),
                    subTitleText('Female',
                        size: 12, fontWeight: FontWeight.w400),
                    SizedBox(width: 20.w),
                    SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Radio(
                            value: "Others",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            })),
                    SizedBox(width: 10.w),
                    subTitleText('Others',
                        size: 12, fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        subTitleText('Refer ID',
                            size: 14, fontWeight: FontWeight.w500),
                        SizedBox(
                            height: 80.h,
                            width: 150.w,
                            child: customTextField(
                                authenticationController.refCtlr.value,
                                hintText: '************')),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        subTitleText('Date',
                            size: 14, fontWeight: FontWeight.w500),
                        GetBuilder<AuthenticationController>(
                            id: 'dateUpdate',
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  authenticationController.chooseDate();
                                },
                                child: SizedBox(
                                    height: 80.h,
                                    width: 150.w,
                                    child: customTextField(
                                        TextEditingController(),
                                        hintText: authenticationController.date,
                                        isActive: false,
                                        icon: Icons.calendar_month,
                                        iconColor: secondaryTextColor)),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                customButton('Sign Up', textSize: 14, color: primaryColor,
                    onPressed: () {
                  if (authenticationController.fNameCtlr.value.text.isNotEmpty &&
                      authenticationController
                          .lNameCtlr.value.text.isNotEmpty &&
                      authenticationController
                          .emailCtlr.value.text.isNotEmpty &&
                      authenticationController
                          .phoneCtlr.value.text.isNotEmpty &&
                      authenticationController.passCtlr.value.text.isNotEmpty &&
                      type!.isNotEmpty &&
                      gender!.isNotEmpty &&
                      authenticationController.refCtlr.value.text.isNotEmpty &&
                      authenticationController.date.isNotEmpty) {
                    authenticationController.registration(
                        gender.toString(), type);
                    // Get.to(const MyshopScreen());
                  } else {
                    Utils.showSnackBar('Input Fields are required!');
                  }
                }),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDown() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 16.0),
      child: DropdownButton<String>(
        iconEnabledColor: primaryTextColor,
        value: selectedValue,
        items: dropdownItems.map((dynamic val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(val,
                  style: TextStyle(
                      color: primaryTextColor, fontSize: fontVerySmall)),
            ),
          );
        }).toList(),
        borderRadius: BorderRadius.circular(10),
        underline: const SizedBox(),
        disabledHint: const Text('Disable'),
        isExpanded: true,
        hint: const Text('Select Shop Type'),
        dropdownColor: profileBgColor,
        style: TextStyle(color: primaryColor, fontSize: fontVerySmall),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
            if (selectedValue == dropdownItems[0]) {
              type = '1';
            } else {
              type = '2';
            }
          });
        },
      ),
    );
  }
}
