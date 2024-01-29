import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save71/common_widgets/custom_button.dart';
import 'package:save71/common_widgets/custom_text_field.dart';
import 'package:save71/controller/authentication_controller.dart';
import 'package:save71/view/authentication/login_screen.dart';

import '../../common_widgets/custom_texts.dart';
import '../../constants/colors.dart';
import '../../constants/utils.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  AuthenticationController authController = Get.put(AuthenticationController());

  @override
  void initState() {
    // TODO: implement initState
    authController.proNameCntr.value.text = authController.userModel!.userInfo.userName;
    authController.proEmailCntr.value.text = authController.userModel!.userInfo.userEmail;
    authController.proRefCntr.value.text = authController.userModel!.userInfo.referenceId;
    authController.proShopNameCntr.value.text = authController.userModel!.userInfo.shopName;
    authController.proShopNumCntr.value.text = authController.userModel!.userInfo.shopNumber;
    authController.proShopLocCntr.value.text = authController.userModel!.userInfo.shopLocationLt;
    authController.proOldPassCntr.value.clear();
    authController.proNewPassCntr.value.clear();
    authController.proConNewPassCntr.value.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      subTitleText('Settings',
                          size: 16, fontWeight: FontWeight.w700)
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Obx(()=> Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          // Container(
                          //   height: 60.h,
                          //   width: 60.w,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(50.r)),
                          //   child: Image.asset('assets/images/profilepic.png'),
                          // ),
                          Container(
                            padding: EdgeInsets.all(5.w),
                            height: 70.h,
                            width: 70.h,
                            decoration:
                            const BoxDecoration(shape: BoxShape.circle),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: authController.selectImagePath.value.isEmpty
                                    ?
                                Image.network(authController.userModel!.userInfo.picUrl,
                                    fit: BoxFit.cover)
                                    : Image.file(
                                    File(authController.selectImagePath.value),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            bottom: 5.h,
                            right: 5.h,
                            child: GestureDetector(
                              onTap: (){
                                  authController.getProfileImage(ImageSource.gallery);
                              },
                              child: Container(
                                height: 20.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(50.r)),
                                child: const Icon(Icons.edit, size: 10, color: white),
                              ),
                            ),
                          )
                        ],
                      ),
                      //SizedBox(width: 10.w),
                      //subTitleText('Jobbar Ali', size: 20),
                      GestureDetector(
                        onTap: () async {
                          if(authController.selectImagePath.value.isNotEmpty){
                            await authController.updatePerofilePic();
                          }else{
                            Utils.showSnackBar('Please select an Image');
                          }

                        },
                        child: Container(
                            height: 26.h,
                            width: 76.w,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(13.r),
                            ),
                            child: Center(
                              child: subTitleText('Save', size: 12, color: white),
                            )),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Personal Information', size: 16),
                    GestureDetector(
                      onTap: () async {
                        await authController.updatePersonalInfo();
                      },
                      child: Container(
                          height: 26.h,
                          width: 76.w,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Center(
                            child: subTitleText('Update', size: 12, color: white),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                subTitleText('Name', size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.proNameCntr.value,
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 10.h),
                subTitleText('Email address',
                    size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.proEmailCntr.value,
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 10.h),
                subTitleText('Reference ID *',
                    size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.proRefCntr.value,
                    isActive: false,
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Shop Information', size: 16),
                    GestureDetector(
                      onTap: () async {
                        await authController.updateShopInfo();
                      },
                      child: Container(
                          height: 26.h,
                          width: 76.w,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Center(
                            child: subTitleText('Update', size: 12, color: white),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                subTitleText('Shop type',
                    size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(TextEditingController(),
                    hintText: 'Area Shop *',
                    isActive: false,
                    icon: Icons.keyboard_arrow_down,
                    iconColor: primaryColor),
                SizedBox(height: 10.h),
                subTitleText('Shop name',
                    size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.proShopNameCntr.value,
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Location', size: 16),
                    Container(
                        height: 26.h,
                        width: 76.w,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: Center(
                          child: subTitleText('Update', size: 12, color: white),
                        )),
                  ],
                ),
                SizedBox(height: 20.h),
                subTitleText('Shop phone number',
                    size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.proShopNumCntr.value,
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 10.h),
                subTitleText('Shop Location',
                    size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(TextEditingController(),
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('PIN Change', size: 16),
                    GestureDetector(
                      onTap: () async {
                       await authController.changePasswordSetting();
                      },
                      child: Container(
                          height: 26.h,
                          width: 76.w,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Center(
                            child: subTitleText('Update', size: 12, color: white),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                subTitleText('Old PIN', size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.proOldPassCntr.value,
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 10.h),
                subTitleText('New PIN', size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.proNewPassCntr.value,
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 10.h),
                subTitleText('Register new PIN',
                    size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.proConNewPassCntr.value,
                    hintText: 'XXXXXXXXXXXXX'),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Bank Info', size: 16),
                    GestureDetector(
                      onTap: () async {
                        authController.updateBankInfo();
                      },
                      child: Container(
                          height: 26.h,
                          width: 76.w,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Center(
                            child: subTitleText('Update', size: 12, color: white),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                subTitleText('Bank Name', size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.bankNameCntr.value,
                    hintText: 'Sonali Bank'),
                SizedBox(height: 10.h),
                subTitleText('Account Name', size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.bankAcNameCntr.value,
                    hintText: 'Enter Account Name'),
                SizedBox(height: 10.h),
                subTitleText('Branch Name', size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.bankBranchNameCntr.value,
                    hintText: 'Enter Bank Branch Name'),
                SizedBox(height: 10.h),
                subTitleText('Account Number', size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.bankAcNumCntr.value,
                    hintText: '27XXXXXXXXXXX'),
                SizedBox(height: 10.h),
                subTitleText('Routing Number', size: 12, fontWeight: FontWeight.w500),
                SizedBox(height: 10.h),
                customTextField(authController.bankRoutNumCntr.value,
                    hintText: '12XXXXXXXXXXX'),
                SizedBox(height: 20.h),
                GestureDetector(
                    onTap: (){
                      Get.offAll(LoginScreen());
                    },
                    child: customButton('Log Out', textSize: 14, color: extraColor))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
