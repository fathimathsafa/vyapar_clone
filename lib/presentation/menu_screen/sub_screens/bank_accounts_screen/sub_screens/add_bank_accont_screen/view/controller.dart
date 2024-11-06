import 'package:get/get.dart';
import 'package:vyapar_clone/model/add_bank_account_model.dart';
import 'package:vyapar_clone/service/add_bank_account_service.dart';
import 'package:flutter/material.dart';

class AddBankAccountController extends GetxController {
  // final BankAccountService _service = BankAccountService();

  // Rx<BankAccountModel?> bankAccount = Rx<BankAccountModel?>(null);
  RxBool printBankDetails = false.obs;
  RxBool printUPIQR = false.obs;
  TextEditingController accountDisplayNameController = TextEditingController();
  TextEditingController openingBalanceController = TextEditingController();
  TextEditingController asOfDateController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController upiIDController = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchBankAccount();
  // }

  // void fetchBankAccount() async {
  //   bankAccount.value = await _service.getBankAccountDetails();
  //   if (bankAccount.value != null) {
  //     accountDisplayNameController.text = bankAccount.value!.accountDisplayName;
  //     openingBalanceController.text =
  //         bankAccount.value!.openingBalance.toString();
  //     asOfDateController.text = bankAccount.value!.asOfDate;
  //     accountHolderNameController.text = bankAccount.value!.accountHolderName;
  //     accountNumberController.text = bankAccount.value!.accountNumber;
  //     ifscCodeController.text = bankAccount.value!.ifscCode;
  //     branchNameController.text = bankAccount.value!.branchName;
  //     upiIDController.text = bankAccount.value!.upiIDForQRCode;

  //     printBankDetails.value = bankAccount.value!.printBankDetailsOnInvoice;
  //     printUPIQR.value = bankAccount.value!.printUPIQRCodeOnInvoice;
  //   }
  // }

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      asOfDateController.text = pickedDate.toString().split(" ")[0];
    }
  }
}
