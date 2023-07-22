// ignore_for_file: unused_field, depend_on_referenced_packages, prefer_final_fields, prefer_const_constructors, unused_import, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:artisan/pages/login_page.dart';
import 'package:artisan/pages/otp_page.dart';
import 'package:artisan/utils/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/text_field_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/style.dart';
import '../widgets/custom_password_text_field.dart';
import '../widgets/custom_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/rich_text.dart';
import '../widgets/violet_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _signUp() async {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // !pls delate -------------
    Get.to(()=>OTPPage(phone:phone));

    if (name.isEmpty) {
      
      Get.snackbar(
        'Oops!',
        'Name field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else if (phone.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Phone Number field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else if (password.isEmpty) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Center(
                    child: Image.asset("assets/images/signup.png", height: 200.h),
                  ),
                ),
                Text(
                  AppString.sign_up_title,
                  style: loginStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                     Image.asset("assets/iconImage/user1.png",width: 25.w,height: 25.h,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: AppTextField(
                        Controller: _nameController,
                        hintText: 'Full Name',
                        keyboard_type:TextInputType.text
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.phone,
                      size: 25.sp,
                      color: AppColors.iconColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: AppTextField(
                        Controller: _phoneController,
                        hintText: 'Phone Number',
                        keyboard_type:TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                   Image.asset("assets/iconImage/unlock1.png",width: 25.w,height: 25.h,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: AppTextPasswordField(
                        passwordController: _passwordController,
                        hintText: "Password",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Image.asset("assets/iconImage/unlock1.png",width: 25.w,height: 25.h,),
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
                  onTap: _signUp,
                  child: VioletButton(title: "Continue")
                ),
                SizedBox(height: 30.h),
                Center(
                  child: RichTextWidget(text:"Already have an account?  ",subtext:"Log In",page:LoginPage()),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}