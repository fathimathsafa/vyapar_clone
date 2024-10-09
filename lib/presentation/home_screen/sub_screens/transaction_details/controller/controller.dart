import 'package:get/get.dart';

class TransactionDetailController extends GetxController{

  RxString selectedSaleDate = "9/20/2024".obs;

 RxString? selectedState ="Select".obs;
 RxInt selectedIndex = 0.obs;

 //addItem

  RxString selectedUnit = 'Unit'.obs;

  RxString selectedTax = 'Without Tax'.obs;
  RxBool isPriceEntered = false.obs;
 
}