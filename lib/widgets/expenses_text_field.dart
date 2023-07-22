// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ExpensesTextFeild extends StatelessWidget {
  ExpensesTextFeild(
      {Key? key,
      required this.Controller,
      required this.hintText,
      required this.image})
      : super(key: key);

  final TextEditingController Controller;
  final String hintText;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(
              0,
              3,
            ), // Offset for the shadow (horizontal, vertical)
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 18.sp,
            ),
            controller: Controller,
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                image,
                height: 30.h,
                width: 30.w,
              ),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Color(0xFFACB1C1),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 1.0, color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 1.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
