import 'package:get/get.dart';

import '../../../../../../../core/common/context_provider.dart';

class PurchaseReturnController extends GetxController {
  RxString selectedPurchaseDate = "9/20/2024".obs;

  void selctedDate(context) async {
    String? date = await ContextProvider().selectDate(context);
    if (date == null) {
    } else {
      selectedPurchaseDate.value = date;
    }
  }
}
