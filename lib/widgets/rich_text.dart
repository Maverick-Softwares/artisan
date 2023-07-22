// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../pages/signup_page.dart';
import '../pages/login_page.dart';

class RichTextWidget extends StatelessWidget {
  final String text;
  final String subtext;
  final Widget page;

  const RichTextWidget({
    Key? key,
    required this.text,
    required this.subtext,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.5),
        ),
        children: [
          TextSpan(
            text: subtext,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle sign up navigation
                if (page is LoginPage) {
                  Get.to(() => LoginPage());
                } else if (page is SignUpPage) {
                  Get.to(() => SignUpPage());
                }
              },
          ),
        ],
      ),
    );
  }
}
