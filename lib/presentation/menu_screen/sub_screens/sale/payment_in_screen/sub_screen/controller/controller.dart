

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/core/models/credential_model.dart';
import 'package:vyapar_clone/core/snackbar/my_snackbar.dart';
import 'package:vyapar_clone/model/reciept_no_model.dart';
import 'package:vyapar_clone/model/state_model.dart';
import 'package:vyapar_clone/model/tax_model.dart';

import 'package:vyapar_clone/model/unit_model.dart';
import 'package:vyapar_clone/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:vyapar_clone/repository/api/end_urls/end_url.dart';

import '../../../../../../../core/common/loading_var.dart';
import '../../../../../../../core/isResponseOk.dart';
import '../../../../../../../model/invoice_no.dart';
import '../../../../../../../repository/api/api_services/api_services.dart';
import '../../../../../../../repository/app_data/user_data/shared_preferences.dart';



class PaymentInController extends GetxController {
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
  var invoiceNo = RecieptNoModel().obs;
 

  //addItem

  // RxString selectedUnit = 'Unit'.obs;

  // RxString selectedTax = 'Without Tax'.obs;
  RxBool isPriceEntered = false.obs;
  //  ValueNotifier<RxDouble> receivedAmountNotifier = ValueNotifier(0.0.obs);
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
  final receivedController = TextEditingController();

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
 
   List<File?> fileList =[null,null];
   List<String?> fileNames =[null, null];
   RxString documentName =''.obs;
   RxString imgPath =''.obs;

  RxBool isChecked = false.obs;

  

  

  

  void fetchInvoicNo() async {
    var response = await _apiServices.getRequest(
        endurl: EndUrl.paymentOutRecieptNo,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        RecieptNoModel ob = RecieptNoModel(
            id: response.data['data']['_id'],
            paymentOutReceiptNo: response.data['data']['paymentOutReceiptNo']);
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

String saleValidator(){

  if(customerTxtCont.text.isEmpty){
    SnackBars.showErrorSnackBar(text: "Please enter customer");
   return "Please enter customer";
  }else if(invoiceNo.value.paymentOutReceiptNo==null){
    SnackBars.showErrorSnackBar(text: "Empty receipt number");
    return "Empty receipt number";
  }else if(descriptionContr.text.isEmpty){
    SnackBars.showErrorSnackBar(text: "Please enter description");
    return "Please enter description";
  }else if(selectedState.value.id == null){
    SnackBars.showErrorSnackBar(text: "Please select state");
    return "Please select state";
  }else if(selectedPaymentType.value==''){
    SnackBars.showErrorSnackBar(text: "Please select payment method");
    return "Please select payment method";
  }else{
    return "ok";
  }
}

void addSale()async{
  setLoadingValue(true);
   CredentialModel credentialModel = await SharedPreLocalStorage.getCredential();

  


  dio.FormData formData = dio.FormData.fromMap({
    'receiptNo': invoiceNo.value.paymentOutReceiptNo.toString(),
    // 'invoiceType': selectedSaleType.value.toString(),
    'date': selectedSaleDate.value.toString(),
    'partyName': 'AK Traders',
    'billingName': customerTxtCont.text,
    'stateOfSupply': selectedState.value.id.toString(),
    // 'phoneNo': phoneNumberController.text,
    // 'billingAddress': '', 
    'description': descriptionContr.text,
    'paymentMethod': selectedPaymentType.value.toString(),
    'bankName': '', 
    // 'items':[{ "name": "item1", "quantity": '2', "unit": "KILOGRAM", "price": "120", "discountPercent": "2", "taxPercent": "66f7e57fdcfcf7f3a6fc5066" ,"finalAmount":"245.76"}].toString(),
    'referenceNo': referenceNoContr.text,
    // 'roundOff': '00',
    'totalAmount': totalAmountContr.text,
    'receivedAmount': double.parse(receivedController.text).toStringAsFixed(2).toString(),
    // 'balanceAmount': grandSubTotal.value.toStringAsFixed(2).toString(),
    // 'source': 'Direct',
    // 'grossTotal': grandSubTotal.value.toStringAsFixed(2).toString(),
  });
     

     
      
  
  List<String> parameters=["files","files"];


  if (fileList.length.toInt() >= 1
          ) {
        for (int i = 0; i < parameters.length; i++) {
          if(fileList[i] !=null){
          String fileName = fileList[i]!.path.split('/').last;
          formData.files.add(
            MapEntry(
              parameters[i],
              await  dio.MultipartFile.fromFile(fileList[i]!.path, filename: fileName),
            ),
          );

          }
        }
      }
  var response = await _apiServices.postMultiPartData(
    data: formData,
    // fileParameters: parameters,
    files: fileList,
        endUrl: EndUrl.createPayIn,
        authToken: await SharedPreLocalStorage.getToken());


        if (response != null) {
        printInfo(info: "response to save invoice==$response");
      if (response.statusCode!.toInt()==201 || response.statusCode!.toInt()==200) {
       
         fetchInvoicNo();
         Get.snackbar("Successfully saved payment in", "",backgroundColor: Colors.green);
         
        
        setLoadingValue(false);
        
        Get.back();
      }
      setLoadingValue(false);
      
    }
    setLoadingValue(false);

}



}