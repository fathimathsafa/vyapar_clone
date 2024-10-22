import 'package:get/get.dart';
import 'package:vyapar_clone/model/add_purchase_moel.dart';
import 'package:vyapar_clone/service/add_purchase_service.dart';

import '../../../../../../../../core/common/context_provider.dart';

class AddPurchaseController extends GetxController {
  RxString selectedDate = "9/20/2024".obs;
  RxString selectBillNo = "10121".obs;

  void selctedDate(context) async {
    String? date = await ContextProvider().selectDate(context);
    if (date == null) {
    } else {
      selectedDate.value = date;
    }
  }

  // final PurchaseService purchaseService;

  AddPurchaseController();

  var partyName = ''.obs;
  var phoneNumber = ''.obs;
  var totalAmount = 0.0.obs;
  var receivedAmount = 0.0.obs;
  var selectedState = ''.obs;
  var description = ''.obs;

  void addPurchase() async {
    final purchase = Purchase(
      partyName: partyName.value,
      phoneNumber: phoneNumber.value,
      totalAmount: totalAmount.value,
      receivedAmount: receivedAmount.value,
      state: selectedState.value,
      description: description.value,
    );

    try {
      // await purchaseService.addPurchase(purchase);
      // Optionally, reset the fields or show success message
    } catch (e) {
      // Handle error, e.g., show a message to the user
    }
  }
}
