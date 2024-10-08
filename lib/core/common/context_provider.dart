import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

 class ContextProvider  {
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

  Future <String?> selectDate(context)async {
    String? date= await _chooseDate(context);
    printInfo(info: "Date ==${date}");
    return date;
  }

  String _dateTimeNow(){
        
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(now); 


  }

  String getCurrentDate(){

    return _dateTimeNow();
  }

  Future<FileDetails?> _selectFile({List<String>? allowedExtensions}) async {
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

  Future<FileDetails?> selectFile() async {
    return await _selectFile();
  }
}

class FileDetails {
  String? fileName;
  String? filePath;
  String? fileSize;
  FileDetails({this.fileName, this.filePath, this.fileSize});
}
