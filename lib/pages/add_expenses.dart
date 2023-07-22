// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../utils/app_colors.dart';
import '../utils/app_string.dart';
import '../utils/theme.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
import 'package:get/get.dart';

import 'dashboard_navpage.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}


class _AddExpensesState extends State<AddExpenses> {
  final List<String> items = ['Home Rent1', 'Home Rent2', 'Home Rent3'];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  List<RowData> rows = []; // List to store the row data

  // Function to add a new row to the list
  void addRow() {
    setState(() {
      rows.add(RowData());
    });
  }

  bool isRowExpanded = false;

  // Function to toggle the expansion of the Row
  void toggleRowExpansion() {
    setState(() {
      isRowExpanded = !isRowExpanded;
    });
  }

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
                Center(
                  child: Image.asset(
                    "assets/images/incomes.png",
                    height: 250.h,
                  ),
                ),
                Text(
                  AppString.expenses_title,
                  style: loginStyle,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 55.h,
                      width: 150.w,
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
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            "Home Rent",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          items: items
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            height: 40.h,
                            width: 200.w,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200.h,
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            height: 40.h,
                          ),
                          dropdownSearchData: DropdownSearchData(
                            searchController: textEditingController,
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller: textEditingController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Search for an item...',
                                  hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            searchMatchFn: (item, searchValue) {
                              return item.value
                                  .toString()
                                  .contains(searchValue);
                            },
                          ),
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/iconImage/hand1.png",
                            width: 25.w,
                            height: 25.h,
                          ),
                          Expanded(
                            child: AppTextField(
                              Controller: _amountController,
                              hintText: 'Amount',
                              keyboard_type: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
                SizedBox(
                      height: 10.w,
                    ),
                // Display the list of rows using ListView.builder
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: rows.length,
                  itemBuilder: (context, index) {
                    return buildRow(index);
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    // Call the function to add a new row
                    addRow();
                  },
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.buttomColor,
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Add One more',
                        textColor: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                GestureDetector(
                  // onTap: _signUp,
                  onTap: () {
                    Get.to(() => DashboardNavPage());
                  },
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.buttomColor,
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Continue',
                        textColor: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  // onTap: _signUp,
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Skip for now',
                        textColor: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build the expanded row
  Widget buildRow(int index) {
    RowData rowData = rows[index];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: () {
          // Call the function to toggle Row expansion
          toggleRowExpansion();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: rowData.isExpanded ? 120.h : 55.h,
          child: Row(
            children: [
              Container(
                height: 55.h,
                width: 150.w,
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: rowData.selectedValue != null
                        ? Text(
                            rowData.selectedValue!,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'Home Rent',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    items: items
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    value: rowData.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        rowData.selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 40.h,
                      width: 200.w,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200.h,
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: 40.h,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/iconImage/hand1.png",
                      width: 25.w,
                      height: 25.h,
                    ),
                    Expanded(
                      child: AppTextField(
                        Controller: _amountController,
                        hintText: 'Amount',
                        keyboard_type: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 5.w,
              // ),
              IconButton(
                onPressed: () {
                  setState(() {
                    rows.removeAt(index);
                  });
                },
                icon: Image.asset("assets/iconImage/close.png",height: 22.h,width: 22.w,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Data class to represent the row
class RowData {
  String? selectedValue;
  bool isExpanded = false;
}
