import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/model/reciept_no_model.dart';


import '../../../../../../../../core/common/context_provider.dart';
import '../../../../../../../../core/common/loading_var.dart';
import '../../../../../../../../core/isResponseOk.dart';
import '../../../../../../../../core/models/credential_model.dart';
import '../../../../../../../../core/snackbar/my_snackbar.dart';
import '../../../../../../../../model/payment_out_model.dart';
import '../../../../../../../../repository/api/api_services/api_services.dart';
import '../../../../../../../../repository/api/end_urls/end_url.dart';
import '../../../../../../../../repository/app_data/user_data/shared_preferences.dart';


class AddPaymentController extends GetxController {

  final ContextProvider _contextProvider = ContextProvider();
  final ApiServices _apiServices = ApiServices();
  RxString selectedDate = "9/20/2024".obs;
  RxString recieptNo = "10121".obs;
  RxString selectedPaymentType = "Cash".obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchAllPaymentOout();
    fetchInvoicNo();
  }

  void selctedDate(context) async {
    String? date = await ContextProvider().selectDate(context);
    if (date == null) {
    } else {
      selectedDate.value = date;
    }
  }

 var hasData = false.obs; // Use RxBool for reactive variable

  // Method to toggle data fetching for testing
  void toggleData() {
    hasData.value = !hasData.value; // Toggle the data state
  }
  

  final partyNameController = TextEditingController();
  final billNoController = TextEditingController();
  final paidAmountController = TextEditingController();
  final descriptionCon = TextEditingController();

void setPaymentType(value){
  selectedPaymentType.value=value;
  Get.back();
}

RxList allPaymentOut = <PaymentOutModel>[].obs;

List<File?> fileList =[null,null];
   List<String?> fileNames =[null, null];
   RxString documentName =''.obs;
   RxString imgPath =''.obs;

var receiptNoModel = RecieptNoModel().obs;
void chooseImage()async{
  
 FileDetails? fileDetail=await _contextProvider.selectFile(allowedExtensions: ['jpg',
    'jpeg',
    'png',]);
  if(fileDetail != null){

  fileList[0]=File(fileDetail.filePath.toString());
  fileNames[0]=fileDetail.fileName;
  imgPath.value=fileDetail.filePath.toString();

  }
}



String saleValidator() {
    if (partyNameController.text.isEmpty) {
      SnackBars.showErrorSnackBar(text: "Please enter partyName");
      return "Please enter partyName";
    }  else if (recieptNo.value == '') {
      SnackBars.showErrorSnackBar(text: "Empty reciept number");
      return "Empty reciept number";
    } else if (descriptionCon.text.isEmpty) {
      SnackBars.showErrorSnackBar(text: "Please enter description");
      return "Please enter description";
    }  else {
      return "ok";
    }
  }

  void addPaymentOut() async {
    setLoadingValue(true);
    CredentialModel credentialModel =
        await SharedPreLocalStorage.getCredential();

    

    dio.FormData formData = dio.FormData.fromMap({
      'receiptNo':recieptNo.value ,
      // 'invoiceType': selectedSaleType.value.toString(),
      'date': selectedDate.value.toString(),
      
      'partyName': partyNameController.text,
      
      
      
      
      'description': descriptionCon.text,

       'paymentMethod': selectedPaymentType.value,
       'bankName':"",
       'referenceNo':"",
       'paidAmount':paidAmountController.text,
      
    });
    

    

   
    List<String> parameters = ["files"];

    if (fileList.length.toInt() >= 1) {
      for (int i = 0; i < parameters.length; i++) {
        if (fileList[i] != null) {
          String fileName = fileList[i]!.path.split('/').last;
          formData.files.add(
            MapEntry(
              parameters[i],
              await dio.MultipartFile.fromFile(fileList[i]!.path,
                  filename: fileName),
            ),
          );
        }
      }
    }
    var response = await _apiServices.postMultiPartData(
        data: formData,
        // fileParameters: parameters,
        files: fileList,
        endUrl: EndUrl.createPaymentOutUrl,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
      printInfo(info: "response to save invoice==$response");
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        //  var homec = Get.find<HomeController>();
        // fetchLatestChallan();
        SnackBars.showSuccessSnackBar(text: "Successfully saved challan");
        //  homec.getAllInvoice();
        // getAllChallan();
        setLoadingValue(false);
      printInfo(info: "response status ==${response.statusCode}");
        Get.back();
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }


  void fetchAllPaymentOout() async {
     setLoadingValue(true);
    var response = await _apiServices.getRequest(
        endurl: EndUrl.getAllPaymentOutUrl,
        authToken: await SharedPreLocalStorage.getToken());
 if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<PaymentOutModel> list = List<PaymentOutModel>.from(
            jsonResponse.map((x) => PaymentOutModel.fromJson(x)));

        allPaymentOut.assignAll(list);
          printInfo(info: "payment out list ==${allPaymentOut.length}");
        setLoadingValue(false);
      }
      setLoadingValue(false);
      
    }
    setLoadingValue(false);
   
  }

  


  void fetchInvoicNo() async {
    var response = await _apiServices.getRequest(
        endurl: EndUrl.getLatestInvoice,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        RecieptNoModel ob = RecieptNoModel(
            id: response.data['data']['_id'],
            paymentOutReceiptNo: response.data['data']['invoiceNo']);

            recieptNo.value =response.data['data']['invoiceNo'];
        receiptNoModel.value = ob;
      }
    }
  }
}