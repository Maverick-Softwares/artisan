// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_final_fields, must_be_immutable, unused_import, depend_on_referenced_packages, unused_element, prefer_const_constructors

import 'package:artisan/pages/set_password.dart';
import 'package:artisan/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
import '../utils/app_colors.dart';
import '../utils/app_string.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _phoneController = TextEditingController();

  void _forGot() async {
    String phone = _phoneController.text;
    Get.to(() => SetPassword());

    if (phone.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Phone Number field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else {
      Get.to(() => SetPassword());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Center(
                  child: Image.asset("assets/images/Forgot_password.png",
                      height: 300.h),
                ),
              ),
              Text(
                AppString.forgot_password_title,
                style: loginStyle,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                AppString.forgot_password_subtitle,
                style: forgotStyle,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.phone,
                    size: 25.sp,
                    color: AppColors.iconColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: AppTextField(
                      Controller: _phoneController,
                      hintText: 'Phone Number',
                      keyboard_type: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                onTap: _forGot,
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.buttomColor,
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Submit',
                      textColor: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}