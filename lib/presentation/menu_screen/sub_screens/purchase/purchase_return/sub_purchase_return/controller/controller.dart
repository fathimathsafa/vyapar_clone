import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/core/models/credential_model.dart';

import 'package:vyapar_clone/core/snackbar/my_snackbar.dart';
import 'package:vyapar_clone/model/state_model.dart';
import 'package:vyapar_clone/model/tax_model.dart';

import 'package:vyapar_clone/model/unit_model.dart';
import 'package:vyapar_clone/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:vyapar_clone/repository/api/end_urls/end_url.dart';

import '../../../../../../../core/common/loading_var.dart';
import '../../../../../../../core/isResponseOk.dart';
import '../../../../../../../model/item_model.dart';
import '../../../../../../../repository/api/api_services/api_services.dart';
import '../../../../../../../repository/app_data/user_data/shared_preferences.dart';
import '../../model/return_no_model.dart';


class PurchaseReturnController extends GetxController {
 final ContextProvider _contextProvider = ContextProvider();
  final ApiServices _apiServices = ApiServices();

  RxString selectedSaleDate = "9/20/2024".obs;
  // RxString selectedBillDate = "9/20/2024".obs;
  RxString selectedPaymentType = "Cash".obs;
 RxBool youRedting= false.obs;
 RxString saleId = ''.obs;
  var selectedState = StateModel().obs;
  var selectedTax = TaxModel(taxType: "None", rate: '0.0').obs;

  RxString isTaxOrNo = 'Without Tax'.obs;
  RxInt selectedIndex = 0.obs;
  RxString selectedSaleType = 'Credit'.obs;
  var unitModel = UnitModel().obs;
  var invoiceNo = ReturnNoModel().obs;
  
  RxList itemList = <ItemModel>[].obs;

  //addItem

  // RxString selectedUnit = 'Unit'.obs;

  // RxString selectedTax = 'Without Tax'.obs;
  RxBool isPriceEntered = false.obs;
  ValueNotifier<RxDouble> receivedAmountNotifier = ValueNotifier(0.0.obs);
  final TextEditingController recivedAmountController = TextEditingController();
  final itemNameContr = TextEditingController();
  final quantityContr = TextEditingController();
  final priceContr = TextEditingController();
  final discountContr = TextEditingController();
  final totalAmountContr = TextEditingController();
  final billNoController = TextEditingController();
  final selectedBillDate = TextEditingController();

  final referenceNoContr = TextEditingController();
  final descriptionContr = TextEditingController();
  final customerTxtCont = TextEditingController();
  final phoneNumberController = TextEditingController();

  RxDouble subTotalP = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble totalDiscount = 0.0.obs;
  RxDouble totalTaxes = 0.0.obs;

  RxList unitList = <UnitModel>[].obs;
  RxList stateList = <StateModel>[].obs;
  RxList taxList = <TaxModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchInvoicNo();
    // fetchUnitList();
    // setLoadingValue(false);
  }

  void setSaleFormType(index) {
    if (index == 0) {
      selectedSaleType.value = 'Credit';
    } else {
      selectedSaleType.value = 'Cash';
    }
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

  List<File?> fileList = [null, null];
  List<String?> fileNames = [null, null];
  RxString documentName = ''.obs;
  RxString imgPath = ''.obs;

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
    printInfo(info: "discountPrecentage==${discountPercentage}");

    double baseAmount = quantity * price;
    subTotalP.value = baseAmount;

    double discountAmount = (discountPercentage / 100) * baseAmount;
    totalDiscount.value = discountAmount;

    double taxableAmount = baseAmount - discountAmount;
    double taxAmount = (taxPercentage / 100) * taxableAmount;
    totalTaxes.value = taxAmount;

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
        if (units.length.toInt() != 0) {
          unitModel.value = units[0];
          setLoadingValue(false);
        }
        unitList.assignAll(units);

        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }

  void fetchInvoicNo() async {
    var response = await _apiServices.getRequest(
        endurl: EndUrl.getRetutnNo,
        authToken: await SharedPreLocalStorage.getToken());
   print("response of invoice number ==${response!.data}");
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        ReturnNoModel ob = ReturnNoModel(
            id: response.data['data']['_id'].toString(),
            purchaseReturnNo: response.data['data']['purchaseReturnNo']);
        invoiceNo.value = ob;
      }
    }
  }

  void fetchStates() async {
    setLoadingValue(true);
    var response = await _apiServices.getRequest(
        endurl: EndUrl.statesUrl,
        authToken: await SharedPreLocalStorage.getToken());
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<StateModel> list = List<StateModel>.from(
            jsonResponse.map((x) => StateModel.fromJson(x)));

        stateList.assignAll(list);

        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }

  void fetchTax() async {
    setLoadingValue(true);
    var response = await _apiServices.getRequest(
        endurl: EndUrl.taxUrl,
        authToken: await SharedPreLocalStorage.getToken());
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<TaxModel> list =
            List<TaxModel>.from(jsonResponse.map((x) => TaxModel.fromJson(x)));

        taxList.assignAll(list);

        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }

  void clearItemController() {
    itemNameContr.text = '';
    quantityContr.text = '';
    priceContr.text = '';
    discountContr.text = '';
    totalAmountContr.text = '';
    subTotalP.value = 0.0;
    totalDiscount.value = 0.0;
  }

  RxDouble balanceDue = 0.0.obs;

  void setPaymentType(value) {
    selectedPaymentType.value = value;
    Get.back();
  }

  void chooseImage() async {
    FileDetails? fileDetail =
        await _contextProvider.selectFile(allowedExtensions: [
      'jpg',
      'jpeg',
      'png',
    ]);
    if (fileDetail != null) {
      fileList[0] = File(fileDetail.filePath.toString());
      fileNames[0] = fileDetail.fileName;
      imgPath.value = fileDetail.filePath.toString();
    }
  }

  void chooseDocument() async {
    FileDetails? fileDetail =
        await _contextProvider.selectFile(allowedExtensions: [
      'pdf', // PDF files
      'doc',
      'docx',
      'xls',
      'xlsx',
      'ppt',
      'pptx',
    ]);
    if (fileDetail != null) {
      fileList[1] = File(fileDetail.filePath.toString());
      fileNames[1] = fileDetail.fileName;
      documentName.value = fileDetail.fileName.toString();
    }
  }

  String saleValidator() {
    print("Return number ==${invoiceNo.value.purchaseReturnNo}");
    if (customerTxtCont.text.isEmpty) {
      SnackBars.showErrorSnackBar(text: "Please enter party name");
      return "Please enter party name";
    } else if (itemList.length.toInt() == 0) {
      SnackBars.showErrorSnackBar(text: "Please add item");
      return "Please add item";
    } else if (invoiceNo.value.purchaseReturnNo == null) {
      SnackBars.showErrorSnackBar(text: "Empty return number is empty");
      return "Empty return number is empty";
    } else if (descriptionContr.text.isEmpty) {
      SnackBars.showErrorSnackBar(text: "Please enter description");
      return "Please enter description";
    } else if (selectedState.value.id == null) {
      SnackBars.showErrorSnackBar(text: "Please select state");
      return "Please select state";
    } else if (selectedPaymentType.value == '') {
      SnackBars.showErrorSnackBar(text: "Please select payment method");
      return "Please select payment method";
    } else {
      return "ok";
    }
  }

  void addSale() async {
    setLoadingValue(true);
    CredentialModel credentialModel =
        await SharedPreLocalStorage.getCredential();

    List<Map<String, dynamic>> items = [];
    for (int i = 0; i < itemList.length; i++) {
      ItemModel item = itemList[i];
      Map<String, dynamic> object = {
        "name": item.itemName,
        "quantity": item.quantity,
        "unit": item.unit,
        "price": item.price,
        "discountPercent": item.discountP ?? "",
        // "taxPercent": item.taxPercent,
        "taxPercent": item.taxPercent ?? "",
        "finalAmount": item.total
      };
      items.add(object);
    }

    dio.FormData formData = dio.FormData.fromMap({
      'billNo': billNoController.text,
      // 'billId': invoiceNo.value.id.toString(),
      "returnNo":invoiceNo.value.purchaseReturnNo.toString(),
      'billDate': selectedSaleDate.value.toString(),
      'partyName': customerTxtCont.text,
      // 'billingName': customerTxtCont.text,
      'stateOfSupply': selectedState.value.id.toString(),
      'phoneNo': phoneNumberController.text,
      // 'billingAddress': '',
      'description': descriptionContr.text,
      'paymentMethod': selectedPaymentType.value.toString(),
      'bankName': '',
      // 'items':[{ "name": "item1", "quantity": '2', "unit": "KILOGRAM", "price": "120", "discountPercent": "2", "taxPercent": "66f7e57fdcfcf7f3a6fc5066" ,"finalAmount":"245.76"}].toString(),
      'referenceNo': referenceNoContr.text,
      'roundOff': '00',
      'totalAmount': grandSubTotal.value.toStringAsFixed(2).toString(),
      'receivedAmount': double.parse(recivedAmountController.text)
          .toStringAsFixed(2)
          .toString(),
      'balanceAmount': grandSubTotal.value.toStringAsFixed(2).toString(),
      'source': 'Direct',
      'grossTotal': grandSubTotal.value.toStringAsFixed(2).toString(),
    });
    formData.fields.add(MapEntry('items', jsonEncode(items)));

    printInfo(info: "item ==${jsonEncode(items)}");

    // for (int i = 0; i < items.length; i++) {
    //   formData.fields.add(MapEntry('items[$i][name]', items[i]['name'].toString()));
    //   formData.fields.add(MapEntry('items[$i][quantity]', items[i]['quantity'].toString()));
    //   formData.fields.add(MapEntry('items[$i][unit]', items[i]['unit'].toString()));
    //   formData.fields.add(MapEntry('items[$i][price]', items[i]['price'].toString()));
    //   formData.fields.add(MapEntry('items[$i][discountPercent]', items[i]['discountPercent'].toString()));
    //   formData.fields.add(MapEntry('items[$i][taxPercent]', items[i]['taxPercent'].toString()));
    //   formData.fields.add(MapEntry('items[$i][finalAmount]', items[i]['finalAmount'].toString()));
    // }
    List<String> parameters = ["files", "files"];

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
        endUrl: EndUrl.addDebit,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
      printInfo(info: "response to save invoice==$response");
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var homec = Get.find<HomeController>();
        fetchInvoicNo();
        Get.snackbar("Successfully saved invoice", "",
            backgroundColor: Colors.green);
        SnackBars.showSuccessSnackBar(text: "Successfully saved invoice");
        homec.getAllInvoice();
        setLoadingValue(false);

        Get.back();
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }
  void updateSale() async {
    setLoadingValue(true);
    CredentialModel credentialModel =
        await SharedPreLocalStorage.getCredential();

    List<Map<String, dynamic>> items = [];
    for (int i = 0; i < itemList.length; i++) {
      ItemModel item = itemList[i];
      Map<String, dynamic> object = {
        "name": item.itemName,
        "quantity": item.quantity,
        "unit": item.unit,
        "price": item.price,
        "discountPercent": item.discountP ?? "",
        // "taxPercent": item.taxPercent,
        "taxPercent": item.taxPercent ?? "",
        "finalAmount": item.total
      };
      items.add(object);
    }

    dio.FormData formData = dio.FormData.fromMap({
      'invoiceNo': invoiceNo.value.purchaseReturnNo.toString(),
      'invoiceType': selectedSaleType.value.toString(),
      'invoiceDate': selectedSaleDate.value.toString(),
      'partyName': customerTxtCont.text,
      'billingName': customerTxtCont.text,
      'stateOfSupply': selectedState.value.id.toString(),
      'phoneNo': phoneNumberController.text,
      'billingAddress': '',
      'description': descriptionContr.text,
      'paymentMethod': selectedPaymentType.value.toString(),
      'bankName': '',
      // 'items':[{ "name": "item1", "quantity": '2', "unit": "KILOGRAM", "price": "120", "discountPercent": "2", "taxPercent": "66f7e57fdcfcf7f3a6fc5066" ,"finalAmount":"245.76"}].toString(),
      'referenceNo': referenceNoContr.text,
      'roundOff': '00',
      'totalAmount': grandSubTotal.value.toStringAsFixed(2).toString(),
      'receivedAmount': double.parse(recivedAmountController.text)
          .toStringAsFixed(2)
          .toString(),
      'balanceAmount': grandSubTotal.value.toStringAsFixed(2).toString(),
      'source': 'Direct',
      'grossTotal': grandSubTotal.value.toStringAsFixed(2).toString(),
    });
    formData.fields.add(MapEntry('items', jsonEncode(items)));

    printInfo(info: "item ==${jsonEncode(items)}");

    // for (int i = 0; i < items.length; i++) {
    //   formData.fields.add(MapEntry('items[$i][name]', items[i]['name'].toString()));
    //   formData.fields.add(MapEntry('items[$i][quantity]', items[i]['quantity'].toString()));
    //   formData.fields.add(MapEntry('items[$i][unit]', items[i]['unit'].toString()));
    //   formData.fields.add(MapEntry('items[$i][price]', items[i]['price'].toString()));
    //   formData.fields.add(MapEntry('items[$i][discountPercent]', items[i]['discountPercent'].toString()));
    //   formData.fields.add(MapEntry('items[$i][taxPercent]', items[i]['taxPercent'].toString()));
    //   formData.fields.add(MapEntry('items[$i][finalAmount]', items[i]['finalAmount'].toString()));
    // }
    List<String> parameters = ["files", "files"];

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
    var response = await _apiServices.putMultiPartData(
        data: formData,
        // fileParameters: parameters,
        files: fileList,
        endUrl: EndUrl.invoiceUrl+saleId.value,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
      printInfo(info: "response to save invoice==$response");
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var homec = Get.find<HomeController>();
        fetchInvoicNo();
        Get.snackbar("Successfully saved invoice", "",
            backgroundColor: Colors.green);
        SnackBars.showSuccessSnackBar(text: "Successfully saved invoice");
        homec.getAllInvoice();
        setLoadingValue(false);

        Get.back();
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }

  void getSaleDetailById({required String id}) async {

    saleId.value = id;
    setLoadingValue(true);

    var response = await _apiServices.getRequest(
        endurl: EndUrl.invoiceUrl + id,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
      setLoadingValue(false);
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];
        // SaleDetailModel model = SaleDetailModel(
          
        //   invoiceNo: jsonResponse['invoiceNo'],
        //   invoiceType: jsonResponse['invoiceType'],
        //   invoiceDate: jsonResponse['invoiceDate'],
        //   party: jsonResponse['party'],
        //   partyName: jsonResponse['partyName'],
        //   document: jsonResponse['document'],
        //   image: jsonResponse['image'],
        //   paymentMethod: jsonResponse['paymentMethod'],
        //   items: jsonResponse["items"] == null
        //       ? []
        //       : List<Item>.from(
        //           jsonResponse["items"]!.map((x) => Item.fromJson(x))),
        //   roundOff: double.parse(jsonResponse['roundOff'] != null
        //       ? jsonResponse['roundOff'].toString()
        //       : '0'),
        //   totalAmount: double.parse(jsonResponse['totalAmount'] != null
        //       ? jsonResponse['totalAmount'].toString()
        //       : '0'),
        //   receivedAmount: double.parse(jsonResponse['receivedAmount'] != null
        //       ? jsonResponse['receivedAmount'].toString()
        //       : '0'),
        //   balanceAmount: double.parse(jsonResponse['balanceAmount'] != null
        //       ? jsonResponse['balanceAmount'].toString()
        //       : '0'),
        //   createdBy: jsonResponse['createdBy'],
        //   source: jsonResponse['source'],
        //   createdAt: jsonResponse["createdAt"],
        //   updatedAt: jsonResponse["updatedAt"],
        //   v: jsonResponse['__v'],
        // );

        // saleDetailModel.value = model;
        List<ItemModel> items = [];

        // for (int i = 0; i < saleDetailModel.value.items!.length; i++) {
        //   Item item = saleDetailModel.value.items![i];
        //   ItemModel object = ItemModel(
        //       discountP: item.discountPercent.toString(),
        //       itemName: item.itemId!.itemName.toString(),
        //       price: item.price.toString(),
        //       quantity: item.quantity.toString(),
        //       unit: item.unit.toString(),
        //       taxPercent: item.taxPercent!.rate,
        //       total: item.finalAmount.toString(),
        //       subtotalP: item.price.toString());
        //   items.add(object);
        // }
        itemList.assignAll(items);

        // selectedSaleType.value = model.invoiceType.toString();
        // invoiceNo.value.invoiceNo = int.parse(model.invoiceNo.toString());
        // customerTxtCont.text = model.partyName.toString();
        // //  grandTax.value = model.
        // selectedPaymentType.value = model.paymentMethod.toString();
        // _calculateGrandTotal();
        // //  grandDiscount.value =
        // //  phoneNumberController.text = model.
        // printInfo(info: "sale object ===${model.items!.length}");
        // Get.to(() => AddSaleInvoiceScreen());
      }
    }

    setLoadingValue(false);
  }

  void deleteSaleById({required String id}) async {
    setLoadingValue(true);
   
    var response = await _apiServices.deleteRequest(
        endurl: EndUrl.invoiceUrl + id,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
       setLoadingValue(false);
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        final controller = Get.find<HomeController>();
        controller.getAllInvoice();
        Get.back();
        SnackBars.showSuccessSnackBar(text: "Deleted invoice");

      }
    }

     setLoadingValue(false);
  }
}
