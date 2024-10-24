

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/core/models/add_item.dart';
import 'package:vyapar_clone/core/models/sale_model.dart';
import 'package:vyapar_clone/model/invoice_model.dart';
import 'package:vyapar_clone/model/party_model.dart';

import 'package:vyapar_clone/repository/app_data/database/db.dart';

import '../../../core/common/loading_var.dart';
import '../../../core/isResponseOk.dart';
import '../../../repository/api/api_services/api_services.dart';
import '../../../repository/api/end_urls/end_url.dart';
import '../../../repository/app_data/user_data/shared_preferences.dart';


class HomeController extends GetxController with GetTickerProviderStateMixin {
  final ContextProvider contextProvider = ContextProvider();
  final ScrollController scrollController = ScrollController();
  final ApiServices _apiServices = ApiServices();

   final Repository repository;

  HomeController({required this.repository});

  // final TextEditingController recievedMoneyTxtCnt = TextEditingController();
  // final TextEditingController searchTxtCnt = TextEditingController();
  // final TextEditingController customerTxtCnt = TextEditingController();
  // final TextEditingController billingNameTxtCnt = TextEditingController();
  // final TextEditingController phoneNumTxtCnt = TextEditingController();
  // //add item to sale
  // final TextEditingController itemNameTxtCnt = TextEditingController();
  // final TextEditingController quantityTxtCnt = TextEditingController();

  // final TextEditingController priceRateTxtCnt = TextEditingController();

  RxInt screenIndex = 0.obs;
  RxInt selectedHeaderBtnIndex = 0.obs;
  // RxDouble itemPrice = 0.00.obs;
  // RxBool checkedBoxValue = false.obs;
  // RxDouble grandTotalPrice = 0.00.obs;
  // RxDouble dueRemain = 0.00.obs;

  // var saleList = <SaleModel>[].obs;
  // var searchableSale = <SaleModel>[].obs;
  // var itemList = <AddItemModel>[].obs;
  RxBool isAddButnVisible = true.obs;

  // void onHeaderButtonTap(value) {
  //   selectedHeaderBtnIndex.value = value;
  // }
  var allInvoice = <InvoiceModel>[].obs;
  var allParties = <PartyModel>[].obs;
  

  late TabController tabController;
  RxInt tabIndex = 0.obs;
  void settabIndexValue (value){

    tabIndex.value = value;
    tabController.index = value;
  }
  

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
    _tabListener();
    scrollListener();
    getAllInvoice();
    getAllParty();
      // fetchSale();
    // _inititalizeInvoiceNum();
    // _initializedDate();
    // initializeSale();
  }

  _tabListener(){

     tabController.addListener(() {
    
        tabIndex.value = tabController.index; 
   
    });
  }

  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  void scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isAddButnVisible.value) {
          isAddButnVisible.value = false;
        }
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isAddButnVisible.value) {
          isAddButnVisible.value = true;
        }
      } 
    });
  }

  // RxInt paymentIndex = 0.obs;
  // void setPaymentType(value) {
  //   paymentIndex.value = value;
  // }

  void setCurrenScreen(value) {
    screenIndex.value = value;
  }


  void getAllInvoice()async{
  setLoadingValue(true);
    var response = await _apiServices.getRequest(
        endurl: EndUrl.invoiceUrl,
        authToken: await SharedPreLocalStorage.getToken());
 if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<InvoiceModel> list = List<InvoiceModel>.from(
            jsonResponse.map((x) => InvoiceModel.fromJson(x)));

        allInvoice.assignAll(list);

        printInfo(info: "length of invoices ==${allInvoice.length}");

        setLoadingValue(false);
      }
      setLoadingValue(false);
      
    }
    setLoadingValue(false);
   

  }
  void getAllParty()async{
  setLoadingValue(true);
    var response = await _apiServices.getRequest(
        endurl: EndUrl.getAllParty,
        authToken: await SharedPreLocalStorage.getToken());
 if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['data'];

        List<PartyModel> list = List<PartyModel>.from(
            jsonResponse.map((x) => PartyModel.fromJson(x)));

        allParties.assignAll(list);

        printInfo(info: "length of invoices ==${allInvoice.length}");

        setLoadingValue(false);
      }
      setLoadingValue(false);
      
    }
    setLoadingValue(false);
   

  }
}
