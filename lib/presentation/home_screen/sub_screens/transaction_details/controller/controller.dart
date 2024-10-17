import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vyapar_clone/model/unit_model.dart';
import 'package:vyapar_clone/repository/api/end_urls/end_url.dart';

import '../../../../../core/common/loading_var.dart';
import '../../../../../core/isResponseOk.dart';

import '../../../../../model/invoice_no.dart';
import '../../../../../model/item_model.dart';
import '../../../../../repository/api/api_services/api_services.dart';
import '../../../../../repository/app_data/user_data/shared_preferences.dart';

class TransactionDetailController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  RxString selectedSaleDate = "9/20/2024".obs;
  RxString selectedPaymentType = "Cash".obs;

  RxString? selectedState = "Select".obs;
  RxInt selectedIndex = 0.obs;
  var unitModel = UnitModel().obs;
  var invoiceNo = InvoiceNoModel().obs;
  RxList itemList = <ItemModel>[].obs;
  //addItem

  // RxString selectedUnit = 'Unit'.obs;

  RxString selectedTax = 'Without Tax'.obs;
  RxBool isPriceEntered = false.obs;
   ValueNotifier<RxDouble> receivedAmountNotifier = ValueNotifier(0.0.obs);
  final TextEditingController recivedAmountController = TextEditingController();
  final itemNameContr = TextEditingController();
  final quantityContr = TextEditingController();
  final priceContr = TextEditingController();
  final discountContr = TextEditingController();
  final totalAmountContr = TextEditingController();

  RxDouble subTotalP = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble totalDiscount = 0.0.obs;

  RxList unitList = <UnitModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    // fetchUnitList();
    fetchInvoicNo();
  }

  RxDouble grandSubTotal = 0.0.obs;
  RxDouble grandTax = 0.0.obs;
  RxDouble grandQty = 0.0.obs;
  RxDouble grandDiscount = 0.0.obs;
  double totalTax = 0.0;
  double totalQty = 0.0;
  double subTotals = 0.0;
  void addItem({required ItemModel item}) {
    itemList.add(item);
    _calculateGrandTotal();
  }

  RxBool isChecked = false.obs;

  void _calculateGrandTotal() {
    double totalDiscount = 0.0;
    double totalTax = 0.0;
    double totalQty = 0.0;
    double subTotals = 0.0;

    for (int i = 0; i < itemList.length; i++) {
      ItemModel obj = itemList[i];
      double itemDiscount = double.parse(obj.discount ?? "0.0");
      double itemTax = double.parse(obj.tax ?? "0.0");
      double itemQty = double.parse(obj.quantity ?? "0.0");
      double subTotal = double.parse(obj.total ?? "0.0");
      totalDiscount = totalDiscount + itemDiscount;
      totalTax = totalTax + itemTax;
      totalQty = totalQty + itemQty;
      subTotals = subTotals + subTotal;
    }

    grandSubTotal.value = subTotals;
    grandTax.value = totalTax;
    grandQty.value = totalQty;
    grandDiscount.value = totalDiscount;
    totalAmountContr.text = subTotals.toString();
   
  }

  void calculateTotalAmount({
    double quantity = 1.0,
    double price = 0.0,
    double discountPercentage = 0.0,
    double taxPercentage = 0.0,
  }) {
    printInfo(info: "is this called");

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

  void fetchInvoicNo() async {
    var response = await _apiServices.getRequest(
        endurl: EndUrl.getLatestInvoice,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        InvoiceNoModel ob = InvoiceNoModel(
            id: response.data['data']['_id'],
            invoiceNo: response.data['data']['invoiceNo']);
        invoiceNo.value = ob;
      }
    }
  }

  void clearItemController(){
    itemNameContr.text = '';
   quantityContr.text = ''; 
   priceContr.text = ''; 
   discountContr.text = ''; 
   totalAmountContr.text = ''; 
   subTotalP.value =0.0;
   totalDiscount.value = 0.0;

  }

  RxDouble balanceDue = 0.0.obs;

}
