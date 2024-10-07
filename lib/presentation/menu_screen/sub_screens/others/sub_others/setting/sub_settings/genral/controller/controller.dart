import 'package:get/get.dart';

class GeneralSettingController extends GetxController {
  RxInt decimalNumber = 2.obs;
  void setDecimalNumber(isMinus) {
    if (isMinus) {
      decimalNumber.value--;
    } else {
      decimalNumber.value++;
    }
  }

  RxList<bool> toggles = List.generate(4, (_) => false).obs;

  void toggleButton(int index) {
    toggles[index] = !toggles[index];
  }
}
