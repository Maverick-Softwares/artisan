// ignore_for_file: prefer_const_constructors, prefer_final_fields, depend_on_referenced_packages, unused_import, unused_field

import 'package:artisan/pages/signup_page.dart';
import 'package:artisan/utils/app_colors.dart';
import 'package:artisan/pages/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../controllers/text_field_controller.dart';
import '../utils/app_string.dart';
import '../utils/theme.dart';
import '../widgets/custom_password_text_field.dart';
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
                    child: Image.asset("assets/images/login.png",height: 250.h,),
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
                      width: 10.w,
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
                  height: 15.h,
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Get.to(()=>ForgotPassword());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.buttomColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: _login,
                  child: Container(
                    height: 50.h,
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
                  child: RichTextWidget(
                    text: "Don’t have an account?  ",
                    subtext: "Sign Up",
                    page: SignUpPage(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
