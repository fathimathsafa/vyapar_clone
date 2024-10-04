import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/cash_in_hand_screen/sub_screens/add_bank_accont_screen_inhnad/view/add_bank_account_inhand_screen.dart';

class LoadingController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // Simulate a loading delay
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to BankTransfer page after the delay
      Get.off(() =>
          const BankTransfer()); // Replace the current screen with BankTransfer
    });
  }
}
