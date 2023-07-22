// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages

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

TextStyle get forgotStyle{
  return GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400)
  );
}

TextStyle get buttonStyle{
  return GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.white)
  );
}