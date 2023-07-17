// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, unused_import, unused_field, prefer_final_fields, depend_on_referenced_packages, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_colors.dart';
import '../utils/app_string.dart';
import '../utils/theme.dart';
import '../widgets/custom_password_text_field.dart';
import '../widgets/custom_text.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  TextEditingController _newpasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _setPass() async{
    String password = _newpasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Password field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else if (password.length <= 6) {
      Get.snackbar(
        'Oops!',
        'Password length should be at least 6 characters!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else if (confirmPassword.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Confirm Password field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else if (password != confirmPassword) {
      Get.snackbar(
        'Oops!',
        'Password and Confirm Password do not match!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else {
      // Sign up logic
      // Redirect to the next page or perform necessary actions
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
                AppString.set_password_title,
                style: loginStyle,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                AppString.set_password_subtitle,
                style: forgotStyle,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.unlockKeyhole,
                    size: 25.sp,
                    color: AppColors.iconColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: AppTextPasswordField(
                      passwordController: _confirmPasswordController,
                      hintText: "New Password",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.unlockKeyhole,
                    size: 25.sp,
                    color: AppColors.iconColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: AppTextPasswordField(
                      passwordController: _confirmPasswordController,
                      hintText: "Confirm Password",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: _setPass,
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.buttomColor,
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Continue',
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
