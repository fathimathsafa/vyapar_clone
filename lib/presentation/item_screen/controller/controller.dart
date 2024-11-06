import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/model/category_model.dart';

import '../../../core/common/context_provider.dart';
import '../../../core/common/loading_var.dart';
import '../../../core/isResponseOk.dart';
import '../../../core/models/credential_model.dart';
import '../../../core/snackbar/my_snackbar.dart';
import '../../../model/unit_model.dart';
import '../../../repository/api/api_services/api_services.dart';
import '../../../repository/api/end_urls/end_url.dart';
import '../../../repository/app_data/user_data/shared_preferences.dart';
import '../model/item_bar_model.dart';

class ItemScreenController extends GetxController {
  final ContextProvider _contextProvider = ContextProvider();
  final ApiServices _apiServices = ApiServices();
  final cateController =TextEditingController();
   TextEditingController itemNameController = TextEditingController();
  final itemCodeController =TextEditingController();
  final itemHsnCodeController =TextEditingController();
  final salePriceController =TextEditingController();
  final discOnSaleController =TextEditingController();
  RxList categoryList = <CategoryModel>[].obs;
  var selectedCate = CategoryModel().obs;
    var selectedUnitModel = UnitModel().obs;
    RxList unitList = <UnitModel>[].obs;
    RxList itemList = <ItemBarList>[].obs;
  void fetchCategories() async {
    setLoadingValue(true);
    var response = await _apiServices.getRequest(
        endurl: EndUrl.getCategory,
        authToken: await SharedPreLocalStorage.getToken());
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<CategoryModel> list = List<CategoryModel>.from(
            jsonResponse.map((x) => CategoryModel.fromJson(x)));

        categoryList.assignAll(list);

        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchItemList();
  }

  void fetchUnitList() async {
    setLoadingValue(true);

    var response = await _apiServices.getRequest(
        endurl: EndUrl.unitListUrl,
        authToken: await SharedPreLocalStorage.getToken());
      //  printInfo(info: "response status code ==${response!.data}");
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<UnitModel> units = List<UnitModel>.from(
            jsonResponse.map((x) => UnitModel.fromJson(x)));
         if(units.length.toInt()!=0){
          selectedUnitModel.value = units[0];
          setLoadingValue(false);
         } 
          setLoadingValue(false);
        unitList.assignAll(units);

        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }
  void fetchItemList() async {
    setLoadingValue(true);

    var response = await _apiServices.getRequest(
        endurl: EndUrl.addItem,
        authToken: await SharedPreLocalStorage.getToken());
      //  printInfo(info: "response status code ==${response!.data}");
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<ItemBarList> units = List<ItemBarList>.from(
            jsonResponse.map((x) => ItemBarList.fromJson(x)));
        
          setLoadingValue(false);
        itemList.assignAll(units);
        // print("Item length==${itemList.length}");
        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }



  void addItem() async {
    setLoadingValue(true);
    CredentialModel credentialModel =
        await SharedPreLocalStorage.getCredential();

    

    dio.FormData formData = dio.FormData.fromMap({
      'itemName':itemNameController.text,
      'itemHsn': itemHsnCodeController.text,
      // 'category': cateController.text,
      'itemCode': itemCodeController.text,
      'unit': selectedUnitModel.value.id,
      'salePrice': salePriceController.text,
      'salePriceIncludesTax': false,
      // 'discountValue': '',
      'discountType': "percentage",
      // 'purchasePrice': "",
      'purchasePriceIncludesTax': false,
      // 'items':[{ "name": "item1", "quantity": '2', "unit": "KILOGRAM", "price": "120", "discountPercent": "2", "taxPercent": "66f7e57fdcfcf7f3a6fc5066" ,"finalAmount":"245.76"}].toString(),
      'openingQuantity': null,
      'stockPrice': 0,
      'minStockToMaintain': null,
      'location': null,
      // 'taxRate': ,
      
    });
    // formData.fields.add(MapEntry('items', jsonEncode(items)));

    // printInfo(info: "item ==${jsonEncode(items)}");

   
    // List<String> parameters = ["files", "files"];

    // if (fileList.length.toInt() >= 1) {
    //   for (int i = 0; i < parameters.length; i++) {
    //     if (fileList[i] != null) {
    //       String fileName = fileList[i]!.path.split('/').last;
    //       formData.files.add(
    //         MapEntry(
    //           parameters[i],
    //           await dio.MultipartFile.fromFile(fileList[i]!.path,
    //               filename: fileName),
    //         ),
    //       );
    //     }
    //   }
    // }
    var response = await _apiServices.postMultiPartData(
        data: formData,
        // fileParameters: parameters,
        // files: fileList,
        endUrl: EndUrl.addItem,
        authToken: await SharedPreLocalStorage.getToken());

    if (response != null) {
      printInfo(info: "response to save invoice==$response");
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        // var homec = Get.find<HomeController>();
        // fetchInvoicNo();
        Get.snackbar("Successfully saved item", "",
            backgroundColor: Colors.green);
            fetchItemList();
        SnackBars.showSuccessSnackBar(text: "Successfully saved item");
  
        setLoadingValue(false);

        Get.back();
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }
}
