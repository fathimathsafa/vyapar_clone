import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constatnts/colors.dart';

class ContextProvider {
  Future<String?> _chooseDate(context) async {
    DateTime? selectedDate;
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      printInfo(info: "selected data==${pickedDate.toLocal()}");
      selectedDate = pickedDate;
      // return "${pickedDate.toLocal()}".split(' ')[0];
      final DateFormat formatter = DateFormat('MM/dd/yyyy');
      return formatter.format(selectedDate);
    } else {
      return null;
    }
  }

  Future<String?> selectDate(context) async {
    String? date = await _chooseDate(context);
    printInfo(info: "Date ==${date}");
    return date;
  }

  String _dateTimeNow() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(now);
  }

  String getCurrentDate() {
    return _dateTimeNow();
  }

  Future<FileDetails?> _selectFile(allowedExtensions) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: allowedExtensions ?? ['pdf'],
      );
      if (result != null) {
        const int tenMB = 10 * 1024 * 1024;

        if (result.files[0].size <= tenMB) {
          printInfo(info: result.paths.toString());
          printInfo(info: result.files[0].xFile.name.toString());
          printInfo(info: result.files[0].size.toString());

          FileDetails _fileDetails = FileDetails(
              fileName: result.files[0].xFile.name.toString(),
              filePath: result.files.single.path.toString(),
              fileSize: result.files[0].size.toString());

          return _fileDetails;
        } else {
          Get.snackbar("File size is too large.", "Max file size is 10 mb",
              backgroundColor: Colors.amber);
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar(e.toString(), "", backgroundColor: Colors.red);
      printInfo(info: "Error====$e");
      return null;
    }
  }

  Future<FileDetails?> selectFile({List<String>? allowedExtensions}) async {
    return await _selectFile(allowedExtensions);
  }
}

showDialogGlobal(
    {List<String>? itemList, required Function(String) onSelectItem}) {
  List<String> tempItem = [
    "10120",
    "10121",
    "10122",
    "10123",
  ];
  Get.dialog(Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: List.generate(
                      itemList == null
                          ? tempItem.length
                          : itemList.length.toInt(), (index) {
                   
                    return InkWell(
                      onTap: () {
                        if (itemList == null) {
                          onSelectItem(tempItem[index]);
                        } else {
                          onSelectItem(itemList[index]);
                        }
                        Get.back();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  itemList == null ? tempItem[index] : itemList[index],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.sp),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
showPaymentTypeBottom(
    {Function()?onClickCash,Function()?onClickCheque,Function()?onClickAddBank,Function()?onClickClose}) {
  
  Get.bottomSheet(SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13.r),
                            topRight: Radius.circular(13.r))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 12.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment Type",
                                style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                onTap: onClickClose,
                                child: Icon(
                                  Icons.close_outlined,
                                  size: 23.sp,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Divider(
                            color: Colorconst.cSecondaryGrey,
                            height: 1.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: onClickCash,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.money_outlined,
                                        size: 23.sp,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        "Cash",
                                        style: GoogleFonts.inter(
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Divider(
                            color: Colorconst.cSecondaryGrey,
                            height: 1.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: onClickCheque,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.edit_document,
                                        size: 23.sp,
                                        color: Colors.amberAccent,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        "Cheque",
                                        style: GoogleFonts.inter(
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Divider(
                            color: Colorconst.cSecondaryGrey,
                            height: 1.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: onClickAddBank,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 23.sp,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        "Add Bank A/c",
                                        style: GoogleFonts.inter(
                                            fontSize: 14.sp,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
}




class FileDetails {
  String? fileName;
  String? filePath;
  String? fileSize;
  FileDetails({this.fileName, this.filePath, this.fileSize});
}
