// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, depend_on_referenced_packages, non_constant_identifier_names

import 'package:artisan/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.Controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController Controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: Controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.iconColor,
            fontSize: 16.sp,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.iconColor,
              width: 2,
            ),
          ),
          focusedBorder:UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.iconColor,
              width: 2,
            ),
          ),

          contentPadding: EdgeInsets.only(
              left: 10.w,bottom: 5.h), // Adjust the left padding as needed
        ),
      ),
    );
  }
}
