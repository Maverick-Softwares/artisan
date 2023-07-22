// ignore_for_file: prefer_const_literals_to_create_immutables, depend_on_referenced_packages, import_of_legacy_library_into_null_safe, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, avoid_print, unnecessary_null_comparison
import 'package:artisan/pages/add_income_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_string.dart';
import '../utils/theme.dart';
import '../widgets/custom_text.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:get/get.dart';

class OTPPage extends StatefulWidget {
  final String phone;

  const OTPPage({Key? key, required this.phone}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Center(
                    child: Image.asset("assets/images/Forgot_password.png",
                        height: 250.h),
                  ),
                ),
                Text(
                  AppString.otp_title,
                  style: loginStyle,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  widget.phone != null
                      ? "An 4 digit code has been sent to ${widget.phone}"
                      : "An 4 digit code has been sent.",
                  style: forgotStyle,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Container(
                    width: 200,
                    child: OTPTextField(
                        controller: otpController,
                        length: 4,
                        width: 50.w,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        // fieldWidth: 30.w,
                        fieldStyle: FieldStyle.underline,
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: Color.fromARGB(255, 193, 196, 208),
                          focusBorderColor: Color.fromARGB(255, 193, 196, 208),
                          enabledBorderColor:
                              Color.fromARGB(255, 193, 196, 208),
                        ),
                        outlineBorderRadius: 1,
                        style: TextStyle(fontSize: 17),
                        onChanged: (pin) {
                          print("Changed: " + pin);
                        },
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        }),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => AddIncomePage());
                  },
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.buttomColor,
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Verify',
                        textColor: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
