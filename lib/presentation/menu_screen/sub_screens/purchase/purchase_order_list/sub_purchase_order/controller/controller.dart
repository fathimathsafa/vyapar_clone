import 'package:get/get.dart';

import '../../../../../../../core/common/context_provider.dart';

class AddPurchaseeScreenController extends GetxController {
  RxString selectedPurchaseDate = "9/20/2024".obs;
  RxString selectedReturnNo = "10120".obs;
  RxString selectedPaymentType = "Cash".obs;

  void selctedDate(context) async {
    String? date = await ContextProvider().selectDate(context);
    if (date == null) {
    } else {
      selectedPurchaseDate.value = date;
    }
  }
}
