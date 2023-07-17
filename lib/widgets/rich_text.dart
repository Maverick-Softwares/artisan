// ignore_for_file: depend_on_referenced_packages, camel_case_types, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../pages/signup_page.dart';

class richText extends StatelessWidget {
  final String text;
  final String subtext;
  final Widget page;

  const richText({
    super.key,
    required this.text,
    required this.subtext,
    required this.page
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle sign up navigation
                Get.to(() => page);
              },
          ),
        ],
      ),
    );
  }
}