import 'package:get/get.dart';

class EditItemController extends GetxController {
  // Manage the toggle state between Product (true) and Services (false)
  RxBool isProduct = true.obs;

  void toggleProductService(bool value) {
    isProduct.value = value;
  }
}
