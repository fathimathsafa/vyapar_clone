

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/core/models/add_item.dart';
import 'package:vyapar_clone/core/models/sale_model.dart';

import 'package:vyapar_clone/repository/app_data/database/db.dart';


class HomeController extends GetxController with GetTickerProviderStateMixin {
  final ContextProvider contextProvider = ContextProvider();
  final ScrollController scrollController = ScrollController();

   final Repository repository;

  HomeController({required this.repository});

  final TextEditingController recievedMoneyTxtCnt = TextEditingController();
  final TextEditingController searchTxtCnt = TextEditingController();
  final TextEditingController customerTxtCnt = TextEditingController();
  final TextEditingController billingNameTxtCnt = TextEditingController();
  final TextEditingController phoneNumTxtCnt = TextEditingController();
  //add item to sale
  final TextEditingController itemNameTxtCnt = TextEditingController();
  final TextEditingController quantityTxtCnt = TextEditingController();

  final TextEditingController priceRateTxtCnt = TextEditingController();

  RxInt screenIndex = 0.obs;
  RxInt selectedHeaderBtnIndex = 0.obs;
  RxDouble itemPrice = 0.00.obs;
  RxBool checkedBoxValue = false.obs;
  RxDouble grandTotalPrice = 0.00.obs;
  RxDouble dueRemain = 0.00.obs;

  var saleList = <SaleModel>[].obs;
  var searchableSale = <SaleModel>[].obs;
  var itemList = <AddItemModel>[].obs;
  RxBool isAddButnVisible = true.obs;

  void onHeaderButtonTap(value) {
    selectedHeaderBtnIndex.value = value;
  }

  

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
      fetchSale();
    _inititalizeInvoiceNum();
    _initializedDate();
    initializeSale();
  }

  _tabListener(){

     tabController.addListener(() {
    
        tabIndex.value = tabController.index; 
   
    });
  }

  void initializeSale() {
    searchableSale.assignAll(saleList);
  }

  void _inititalizeInvoiceNum() {
    int number = saleList.length + 1;
    invoiceNumber.value = "23-24-01 $number";
  }

  void updatedInvoiceNum() {
    _inititalizeInvoiceNum();
  }

  void _initializedDate() {
    date.value = contextProvider.getCurrentDate();
  }

  void updateDate() {
    _initializedDate();
  }

  RxString invoiceNumber = "".obs;
  RxString date = "".obs;
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

  RxInt paymentIndex = 0.obs;
  void setPaymentType(value) {
    paymentIndex.value = value;
  }

  void setCurrenScreen(value) {
    screenIndex.value = value;
  }

  RxString selectedTaxItem = "Without Tax".obs;
  final List<String> taxDropItems = [
    'Without Tax',
    'Item2',
    'Item3',
    'Item4',
  ];
  RxString selectedUnitItem = "Unit".obs;

  final List<String> unitDropItems = [
    'Unit',
  ];

  void addItemIntoSale(AddItemModel model) {
    itemList.add(model);
    itemNameTxtCnt.text = '';
    quantityTxtCnt.text = '';
    priceRateTxtCnt.text = '';

    selectedTaxItem.value = 'Without Tax';
    itemPrice.value = 0.00;
    grandTotal(list: itemList);
    Get.snackbar("Added item", "Successfully added a item",
        backgroundColor: Colors.green);
  }

  void addSale(SaleModel model) {
  

    try {
       addSaleItem(model);
    customerTxtCnt.text = '';
    billingNameTxtCnt.text = '';
    phoneNumTxtCnt.text = '';

    Get.snackbar("Added sale", "Successfully added a sale",
        backgroundColor: Colors.green);
      
    } catch (e) {
      printInfo(info: "error===${e}");
      Get.snackbar("Error", "$e",
        backgroundColor: Colors.red);
    }
   
  }

  searchByDateInvoiceNum(value) {
    if (value == '') {
      searchableSale.assignAll(saleList);
    } else {
      List<SaleModel> searchedList = saleList
          .where((t) =>
              t.billDate.toString().contains(value.toString()))
          .toList();

      searchableSale.assignAll(searchedList);
    }
  }

  void grandTotal({required List<AddItemModel> list}) {
    double grandTotal = 0.0;

    for (int i = 0; i < list.length; i++) {
      AddItemModel ob = list[i];
      double price = double.parse(ob.totalPrice.toString());
      grandTotal = grandTotal + price;
    }

    grandTotalPrice.value = grandTotal;
    dueRemain.value = grandTotal;
    checkedBoxValue.value = false;
  }

  String totalAmount({quantity, price}) {
    return "${double.parse(quantity.toString() == '' ? '1.0' : quantity.toString()) * double.parse(price.toString() == '' ? '0.0' : price.toString())}";
  }



  Future<void> fetchSale() async {
    
    try {
      saleList.value = await repository.getAllSale();
      searchableSale.value = await repository.getAllSale();
    } catch(e){
         printInfo(info: "eorrr====$e");
    }
  }

  Future<void> addSaleItem(SaleModel saleObj) async {

    printInfo(info: "sale object == ${saleObj.toJson()}");
     await repository.insertSale(saleObj);
     printInfo(info: "sale item ==${saleList.length}");
       fetchSale();
  }

  

  Future<void> deleteSale(int id) async {
    await repository.deleteSale(id);
    fetchSale();

    Get.back();
    Get.snackbar("Deleted", "Sale has been deleted",backgroundColor: Colors.blue);
  }
}
