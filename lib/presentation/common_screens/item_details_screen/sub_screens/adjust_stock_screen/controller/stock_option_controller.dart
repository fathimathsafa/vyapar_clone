import 'package:get/get.dart';

class StockOptionController extends GetxController {
  var stockOption = 0.obs; // Observable variable to track stock option

  void setStockOption(int value) {
    stockOption.value = value; // Update the stockOption value
  }
}
