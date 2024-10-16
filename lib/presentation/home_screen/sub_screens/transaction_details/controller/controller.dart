import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/shared_preference_const.dart';
import 'package:vyapar_clone/model/unit_model.dart';
import 'package:vyapar_clone/repository/api/end_urls/end_url.dart';

import '../../../../../core/common/loading_var.dart';
import '../../../../../core/isResponseOk.dart';

import '../../../../../repository/api/api_services/api_services.dart';
import '../../../../../repository/app_data/user_data/shared_preferences.dart';

class TransactionDetailController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  RxString selectedSaleDate = "9/20/2024".obs;
  RxString selectedPaymentType = "Cash".obs;

  RxString? selectedState = "Select".obs;
  RxInt selectedIndex = 0.obs;
  var unitModel = UnitModel().obs;

  //addItem

  // RxString selectedUnit = 'Unit'.obs;

  RxString selectedTax = 'Without Tax'.obs;
  RxBool isPriceEntered = false.obs;

  final TextEditingController recivedAmountController = TextEditingController();
  final itemNameContr = TextEditingController();
  final quantityContr = TextEditingController();
  final priceContr = TextEditingController();
  final discountContr = TextEditingController();
  final totalAmountContr = TextEditingController();
  RxString selectedInvoicNm = '10120'.obs;

  RxDouble subTotalP = 0.0.obs; 
  RxDouble totalPrice = 0.0.obs; 
  RxDouble totalDiscount = 0.0.obs; 

  RxList unitList = <UnitModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    // fetchUnitList();
  }


  


  void calculateTotalAmount({
  double quantity = 1.0,            
  double price = 0.0,               
  double discountPercentage = 0.0,  
  double taxPercentage = 0.0,      
}) {
  printInfo(info:  "is this called");
  
  double baseAmount = quantity * price;
  subTotalP.value = baseAmount;
  
  double discountAmount = (discountPercentage / 100) * baseAmount;
    totalDiscount.value = discountAmount;
     
  double taxableAmount = baseAmount - discountAmount;
  double taxAmount = (taxPercentage / 100) * taxableAmount;

  
  double totalAmount = taxableAmount + taxAmount;

    totalPrice.value = totalAmount;
    totalAmountContr.text = totalAmount.toString();
}

  void fetchUnitList() async {
    setLoadingValue(true);

    var response = await _apiServices.getRequest(
        endurl: EndUrl.unitListUrl,
        authToken: await SharedPreLocalStorage.getToken());
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<UnitModel> units = List<UnitModel>.from(
            jsonResponse.map((x) => UnitModel.fromJson(x)));

        unitList.assignAll(units);

        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);

   
  }
}
