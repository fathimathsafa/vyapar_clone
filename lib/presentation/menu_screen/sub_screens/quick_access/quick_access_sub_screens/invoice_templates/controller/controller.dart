import 'package:get/get.dart';

class InvoiceTemplateController extends GetxController{


  RxInt selectedTempIndex = 0.obs;

  final tempList = ["Invoice","Purchase","Estimate"];

  void setTempIndex(value){
    selectedTempIndex.value = value;
  }
}