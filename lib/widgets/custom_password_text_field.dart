// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class AppTextPasswordField extends StatefulWidget {
  const AppTextPasswordField({
    Key? key,
    required TextEditingController passwordController,
    required this.hintText,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;
  final String hintText;

  @override
  _AppTextPasswordFieldState createState() => _AppTextPasswordFieldState();
}

class _AppTextPasswordFieldState extends State<AppTextPasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._passwordController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.iconColor,
          fontSize: 16.sp,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
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
        ),
      ),
      obscureText: !_isVisible,
    );
  }
}