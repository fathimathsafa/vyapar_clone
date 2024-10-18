import 'package:get/get.dart';

class TransactionDetailController extends GetxController {
  RxString selectedSaleDate = "9/20/2024".obs;

  RxString? selectedState = "Select".obs;
  RxInt selectedIndex = 0.obs;

  //addItem

  RxString selectedUnit = 'Unit'.obs;

  RxString selectedTax = 'Without Tax'.obs;
  RxBool isPriceEntered = false.obs;

  RxList addedItems = [].obs;
  RxDouble totalDiscount = 0.0.obs;
  RxDouble totalTaxAmount = 0.0.obs;
  RxInt totalQuantity = 0.obs;
  RxDouble subtotal = 0.0.obs;

  // Method to add items and recalculate totals
  void addItem(item) {
    addedItems.add(item);
    recalculateTotals();
  }

  void recalculateTotals() {
    totalDiscount.value =
        addedItems.fold(0, (sum, item) => sum + item.discount);
    totalTaxAmount.value = addedItems.fold(0, (sum, item) => sum + item.tax);
    // totalQuantity.value = addedItems.fold(0, (sum, item) => sum + item.quantity);
    subtotal.value = addedItems.fold(0, (sum, item) => sum + item.subtotal);
  }
}
