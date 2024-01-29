import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save71/common_widgets/custom_texts.dart';
import 'package:save71/constants/colors.dart';

class UploadSuccessScreen extends StatelessWidget {
  const UploadSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 240.h,
            width: 284.w,
            child: Image.asset('assets/images/upload_success.png'),
          ),
          subTitleText('Product upload successfull',size: 20,fontWeight: FontWeight.w700),
          Align(
            alignment: Alignment.center,
            child: Container(
                height: 48.h,
                width: 133.w,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: subTitleText('See uploads', size:14, color: white),
                )),
          ),
        ],
      ),
    );
  }
}
