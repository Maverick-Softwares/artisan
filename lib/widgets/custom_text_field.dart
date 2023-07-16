// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      required this.emailController,
      required this.hintText,
      this.icon})
      : super(key: key);

  final TextEditingController emailController;
  final String hintText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 10,
      //     right: 10
      // ),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 193, 196, 208), fontSize: 16.sp),
          suffixIcon: Icon(
            icon,
            size: 25.w,
            color: Color.fromARGB(255, 193, 196, 208),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 193, 196, 208), width: 2),
          ),
        ),
      ),
    );
  }
}
