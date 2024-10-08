import 'package:get/get.dart';

import '../../../../../../../../core/common/context_provider.dart';


class AddPaymentController extends GetxController {
  RxString selectedDate = "9/20/2024".obs;

  void selctedDate(context) async {
    String? date = await ContextProvider().selectDate(context);
    if (date == null) {
    } else {
      selectedDate.value = date;
    }
  }
}