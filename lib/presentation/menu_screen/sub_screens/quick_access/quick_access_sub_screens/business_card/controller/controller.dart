import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessCardController extends GetxController with GetTickerProviderStateMixin{

late TabController tabController;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     tabController = TabController(length: 3, vsync: this);
  }


  @override
  void onClose() {
    tabController.dispose(); // Dispose the controller when the widget is destroyed
    super.onClose();
  }
  RxInt selectedImageTab1 = 0.obs;
  void setImageTab1(value){

   selectedImageTab1.value = value;
  }
}