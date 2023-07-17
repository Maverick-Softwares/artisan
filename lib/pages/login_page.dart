// ignore_for_file: prefer_const_constructors, prefer_final_fields, depend_on_referenced_packages, unused_import

import 'package:artisan/pages/signup_page.dart';
import 'package:artisan/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../controllers/text_field_controller.dart';
import '../utils/app_string.dart';
import '../utils/theme.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/rich_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _controller = Get.put(TextFieldController());


  void _login() async {
    String phone = _phoneController.text;
    String password = _passwordController.text;

    if (phone.isEmpty) {
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
    } else {
      // SignInBody signInBody = SignInBody(username: email, password: password);
      // authController.login(signInBody).then((status)  async{
      //   if(status.isSuccess){
      //     await dep.init();
      //     Get.off(HomePage());
      //   }
      //   else{
      //   }
      // });

      // Get.off(HomePage());
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
                  child: Image.asset("assets/images/login.png", height: 300.h),
                ),
              ),
              Text(
                AppString.login_title,
                style: loginStyle,
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
                  Expanded(child: Obx(() {
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
                            top: 10.h), // Adjust the left padding as needed
                      ),
                      obscureText: _controller.isPasswordHiden.value,
                    );
                  })),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: AppColors.buttomColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: _login,
                child: Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.buttomColor,
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Login',
                      textColor: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Center(
                child: richText(text:"Don’t have an account?  ",subtext:"Sign Up",page:SignUpPage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}