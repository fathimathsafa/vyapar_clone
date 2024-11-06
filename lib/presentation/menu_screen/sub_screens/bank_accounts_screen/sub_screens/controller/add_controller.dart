import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/common/loading_var.dart';
import 'package:vyapar_clone/repository/api/api_services/api_services.dart';

import '../../../../../../core/isResponseOk.dart';
import '../../../../../../core/snackbar/my_snackbar.dart';
import '../../../../../../repository/api/end_urls/end_url.dart';
import '../../../../../../repository/app_data/user_data/shared_preferences.dart';

class AddBankAccountController extends GetxController {
  final _apiServices = ApiServices();
  // State variables
  var printBankDetails = false.obs; // Observables to track state
  var printUPIQR = false.obs;
  var selectedDate = DateTime.now().obs; // Date picker observable
  final  dateController = TextEditingController();
  final openingBalanceController = TextEditingController();
  final accountHolderCont = TextEditingController();
  final accountNumberCon = TextEditingController();
  final ifscCodeController = TextEditingController();
  final branchContr = TextEditingController();
  final upiIdOrqContr = TextEditingController();
  final accountNameContr = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    dateController.text =
        DateFormat('yyyy-MM-dd').format(selectedDate.value); // Set initial date
  }

  // Date picker function
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }


  String saleValidator() {
    if (accountNameContr.text.isEmpty) {
      SnackBars.showErrorSnackBar(text: "Please enter bank ");
      return "Please enter bank";
    } else if (openingBalanceController.text.length.toInt() == 0) {
      SnackBars.showErrorSnackBar(text: "Please enter opening balance");
      return "Please enter opening balance";
    } else if (accountHolderCont.text =='') {
      SnackBars.showErrorSnackBar(text: "Account holder name is empty");
      return "Empty";
    } else if (ifscCodeController.text.isEmpty) {
      SnackBars.showErrorSnackBar(text: "Please enter ifsc code");
      return "Please enter description";
    }  else {
      return "ok";
    }
  }

void addBankAccount()async{
  setLoadingValue(true);
    Map<String, dynamic> data ={
  "accountDisplayName": accountNameContr.text,
  "openingBalance": openingBalanceController.text,
  "asOfDate": dateController.text,
  "printUPIQRCodeOnInvoice": printUPIQR.value,
  "printBankDetailsOnInvoice": printBankDetails.value,
  "accountNumber": accountNumberCon.text,
  "ifscCode": ifscCodeController.text,
  "upiIDForQRCode": upiIdOrqContr.text,
  "branchName": branchContr.text,
  "accountHolderName": accountHolderCont.text
};

 var response = await _apiServices.postJsonData(
        data: data,
        // fileParameters: parameters,
        
        endUrl: EndUrl.bank,
        authToken: await SharedPreLocalStorage.getToken());


         if (response != null) {
      printInfo(info: "response to save invoice==$response");
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        
       
        Get.snackbar("Successfully added bank", "",
            backgroundColor: Colors.green);
        // SnackBars.showSuccessSnackBar(text: "Successfully saved invoice");
       
        setLoadingValue(false);

       
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);

}

}
