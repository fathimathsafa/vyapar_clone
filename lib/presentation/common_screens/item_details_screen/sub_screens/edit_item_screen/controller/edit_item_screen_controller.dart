import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemController extends GetxController {
  // Manage the toggle state between Product (true) and Services (false)
  RxBool isProduct = true.obs;

  // Manage the edit/save state
  RxBool isEditing = false.obs;

  // TextEditingController for HSN/SAC Code
  final TextEditingController hsnCodeController = TextEditingController();

  void toggleProductService(bool value) {
    isProduct.value = value;
  }

  void toggleEditSave() {
    isEditing.value = !isEditing.value; // Toggle between edit and save
  }

  @override
  void onClose() {
    // Dispose of the TextEditingController when the controller is closed
    hsnCodeController.dispose();
    super.onClose();
  }
}
