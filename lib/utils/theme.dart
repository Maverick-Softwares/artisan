// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


TextStyle get loginStyle{
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black
      )
  );
}