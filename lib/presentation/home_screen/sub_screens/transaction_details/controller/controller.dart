import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/core/models/credential_model.dart';
import 'package:vyapar_clone/model/state_model.dart';
import 'package:vyapar_clone/model/tax_model.dart';

import 'package:vyapar_clone/model/unit_model.dart';
import 'package:vyapar_clone/repository/api/end_urls/end_url.dart';

import '../../../../../core/common/loading_var.dart';
import '../../../../../core/isResponseOk.dart';

import '../../../../../model/invoice_no.dart';
import '../../../../../model/item_model.dart';
import '../../../../../repository/api/api_services/api_services.dart';
import '../../../../../repository/app_data/user_data/shared_preferences.dart';

class TransactionDetailController extends GetxController {
  final ContextProvider _contextProvider = ContextProvider();
  final ApiServices _apiServices = ApiServices();

  RxString selectedSaleDate = "9/20/2024".obs;
  RxString selectedPaymentType = "Cash".obs;

  var selectedState = StateModel().obs;
  var selectedTax = TaxModel(taxType: "None",rate: '0.0').obs;

  RxString isTaxOrNo = 'Without Tax'.obs;
  RxInt selectedIndex = 0.obs;
  RxString selectedSaleType = 'Credit'.obs;
  var unitModel = UnitModel().obs;
  var invoiceNo = InvoiceNoModel().obs;
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
    fetchUnitList();
  }

  void setSaleFormType(index){
    if(index==0){
      selectedSaleType.value = 'Credit';
    }else{
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
   List<File?> fileList =[null,null];
   List<String?> fileNames =[null, null];
   RxString documentName =''.obs;
   RxString imgPath =''.obs;

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
         if(units.length.toInt()!=0){
          unitModel.value = units[0];
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

        List<TaxModel> list = List<TaxModel>.from(
            jsonResponse.map((x) => TaxModel.fromJson(x)));

        taxList.assignAll(list);

        setLoadingValue(false);
      }
      setLoadingValue(false);
      
    }
    setLoadingValue(false);
   
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

void setPaymentType(value){
  selectedPaymentType.value=value;
  Get.back();
}

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
void chooseDocument()async{
  
 FileDetails? fileDetail=await _contextProvider.selectFile(allowedExtensions: [ 'pdf',    // PDF files
  'doc',   
  'docx',   
  'xls',     
  'xlsx',   
  'ppt',    
  'pptx',]);
  if(fileDetail != null){
  
  fileList[1]=File(fileDetail.filePath.toString());
  fileNames[1]=fileDetail.fileName;
  documentName.value=fileDetail.fileName.toString();
  

  }
}

void addSale()async{

   CredentialModel credentialModel = await SharedPreLocalStorage.getCredential();

    List<Map<String, dynamic>> items = [];
  for(int i=0; i<itemList.length;i++){
    ItemModel item = itemList[i];
    Map<String, dynamic> object ={
       "name": item.itemName,
      "quantity": item.quantity,
      "unit": item.unit,
      "price": item.price,
      "discountPercent": item.discountP,
      "taxPercent": item.taxPercent,
      "finalAmount": item.total
    };
     items.add(object);

  }

  Map<String, dynamic> data ={
    'invoiceNo':invoiceNo.value.invoiceNo.toString(),
    'invoiceType':selectedSaleType.value.toString(),
    'invoiceDate':selectedSaleDate.value.toString(),

    'partyName':credentialModel.userId.toString(),
    'billingName':customerTxtCont.text,
    'stateOfSupply':selectedState.value.id.toString(),
    'phoneNo':phoneNumberController.text,
    'billingAddress':'',
    'description':descriptionContr.text,
    'paymentMethod':selectedPaymentType.value,
    'bankName':'',
    'referenceNo':referenceNoContr.text,
    'items':jsonEncode(items),
    'roundOff':'00',
    'totalAmount':grandSubTotal.value.toStringAsFixed(2),
    'receivedAmount':double.parse(recivedAmountController.text).toStringAsFixed(2),
    'balanceAmount':grandSubTotal.value.toStringAsFixed(2),
    'source':'Direct',
    'grossTotal':grandSubTotal.value.toStringAsFixed(2),


  };
  List<String> parameters=["files","files"];
  var response = await _apiServices.postMultiPartData(
    data: data,
    fileParameters: parameters,
    files: fileList,
        endUrl: EndUrl.invoiceUrl,
        authToken: await SharedPreLocalStorage.getToken());


        if (response != null) {
        printInfo(info: "response to save invoice==$response");
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
       

        setLoadingValue(false);
      }
      setLoadingValue(false);
      
    }
    setLoadingValue(false);

}




}
