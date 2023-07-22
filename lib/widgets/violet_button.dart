// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/style.dart';

class VioletButton extends StatelessWidget {
  const VioletButton({
     Key? key,
    required this.title
  }): super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.buttomColor,
      ),
      child: Center(
        child: Text(
          title,
          style: buttonStyle,
        ),
      ),
    );
  }
}
