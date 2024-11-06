import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/model/add_purchase_moel.dart';
import 'package:vyapar_clone/service/add_purchase_service.dart';

class AddPurchaseController extends GetxController {
  // Observables for form data
  RxString selectedDate = "9/20/2024".obs;
  RxString selectBillNo = "10121".obs;
  RxString partyName = ''.obs;
  RxString phoneNumber = ''.obs;
  RxDouble totalAmount = 0.0.obs;
  RxDouble receivedAmount = 0.0.obs;
  RxString selectedState = ''.obs;
  RxString description = ''.obs;

  // Payment types
  RxList<String> paymentTypes =
      ['Cash', 'Credit', 'Bank Transfer'].obs; // Add payment types here
  RxString selectedPaymentType = 'Cash'.obs; // Default value

  final PurchaseService _purchaseService =
      PurchaseService(); // Initialize PurchaseService

  AddPurchaseController();

  // Function to select date using context
  void selectDate(BuildContext context) async {
    String? date = await ContextProvider().selectDate(context);
    if (date != null) {
      selectedDate.value = date;
    }
  }

  // Method to add a purchase
  // void addPurchase() async {
  //   final purchase = AddPurchaseModel(
  //     partyName: partyName.value,
  //     phoneNumber: phoneNumber.value,
  //     totalAmount: totalAmount.value,
  //     receivedAmount: receivedAmount.value,
  //     state: selectedState.value,
  //     description: description.value,
  //     invoiceNumber: selectBillNo.value,
  //     date: selectedDate.value,
  //   );

  //   try {
  //     await _purchaseService.addPurchase(
  //       date: purchase.date,
  //       invoiceNumber: purchase.invoiceNumber,
  //       partyName: purchase.partyName,
  //       phoneNumber: purchase.phoneNumber,
  //       items: purchase
  //           .items, // Assuming `items` is passed separately if applicable
  //       totalAmount: purchase.totalAmount,
  //       receivedAmount: purchase.receivedAmount,
  //       paymentType: selectedPaymentType
  //           .value, // Use the selected payment type dynamically
  //       stateOfSupply: purchase.state,
  //       description: purchase.description,
  //       photoUrl: null, // Handle photo upload if necessary
  //     );
  //     // Optionally, reset form fields or show success message
  //   } catch (e) {
  //     // Handle error, e.g., show a message to the user
  //     print('Error adding purchase: $e');
  //   }
  // }
}
