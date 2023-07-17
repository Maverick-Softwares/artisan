// ignore_for_file: unused_field, depend_on_referenced_packages, prefer_final_fields, prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:artisan/pages/login_page.dart';
import 'package:artisan/utils/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/text_field_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/theme.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/rich_text.dart';

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

  final _controller = Get.put(TextFieldController());

  void _signUp() async {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

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
        'Email field cannot be empty!',
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Center(
                  child: Image.asset("assets/images/signup.png", height: 300.h),
                ),
              ),
              Text(
                AppString.sign_up_title,
                style: loginStyle,
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.person,
                    size: 25.sp,
                    color: AppColors.iconColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: AppTextField(
                      Controller: _nameController,
                      hintText: 'Full Name',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
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
                    child: Obx(
                      () {
                        return TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: AppColors.iconColor,
                              fontSize: 16.sp,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _controller.isPasswordHiden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                _controller.isPasswordHiden.value =
                                    !_controller.isPasswordHiden.value;
                              },
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.iconColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.iconColor,
                                width: 2,
                              ),
                            ),
                            suffixIconColor: AppColors.iconColor,
                            contentPadding: EdgeInsets.only(
                              left: 10.w,
                              top: 10.h,
                            ), // Adjust the left padding as needed
                          ),
                          obscureText: _controller.isPasswordHiden.value,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
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
                    child: Obx(
                      () {
                        return TextField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                              color: AppColors.iconColor,
                              fontSize: 16.sp,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _controller.isConfirmPasswordHiden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                _controller.isConfirmPasswordHiden.value =
                                    !_controller.isConfirmPasswordHiden.value;
                              },
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.iconColor,
                                width: 2,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.iconColor,
                                width: 2,
                              ),
                            ),
                            suffixIconColor: AppColors.iconColor,
                            contentPadding: EdgeInsets.only(
                              left: 10.w,
                              top: 10.h,
                            ), // Adjust the left padding as needed
                          ),
                          obscureText: _controller.isConfirmPasswordHiden.value,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: _signUp,
                child: Container(
                  height: 55.h,
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
              SizedBox(height: 30.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account?  ",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Log In",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(LoginPage());
                          },
                      ),
                    ],
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
