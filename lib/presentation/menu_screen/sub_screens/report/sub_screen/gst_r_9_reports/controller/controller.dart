import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class GstR9ReportController extends GetxController{

   RxString pdfPath ="".obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadPDF();
  }


    Future<void> loadPDF() async {
    final file = await _getFileFromAssets('assets/pdfs/pdf_sample.pdf');
         printInfo(info: "file.path===${file.path}");
      pdfPath.value = file.path;
   
  }

  Future<File> _getFileFromAssets(String asset) async {
    final byteData = await rootBundle.load(asset);
    final file = File('${(await getTemporaryDirectory()).path}/pdf_sample.pdf');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    return file;
  }
}