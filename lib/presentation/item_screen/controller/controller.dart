import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/model/category_model.dart';

import '../../../core/common/context_provider.dart';
import '../../../core/common/loading_var.dart';
import '../../../core/isResponseOk.dart';
import '../../../model/unit_model.dart';
import '../../../repository/api/api_services/api_services.dart';
import '../../../repository/api/end_urls/end_url.dart';
import '../../../repository/app_data/user_data/shared_preferences.dart';

class ItemScreenController extends GetxController {
  final ContextProvider _contextProvider = ContextProvider();
  final ApiServices _apiServices = ApiServices();
  final cateController =TextEditingController();
  RxList categoryList = <CategoryModel>[].obs;
  var selectedCate = CategoryModel().obs;
    var selectedUnitModel = UnitModel().obs;
    RxList unitList = <UnitModel>[].obs;
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
}
