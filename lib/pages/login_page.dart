// ignore_for_file: depend_on_referenced_packages, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/app_string.dart';
import '../utils/theme.dart';
import '../widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
            AppTextField(
              emailController: _phoneController,
              hintText: 'Phone Number',
            ),
            SizedBox(
              height: 10.h,
            ),
            AppTextField(
              emailController: _passwordController,
              hintText: 'Password',
              icon: Icons.visibility_off_outlined,
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 101, 255),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}