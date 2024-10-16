import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/loading_var.dart';
import 'package:vyapar_clone/core/models/credential_model.dart';
import 'package:vyapar_clone/core/snackbar/my_snackbar.dart';
import 'package:vyapar_clone/presentation/splash_screen/controller/controller.dart';
import 'package:vyapar_clone/repository/api/api_services/api_services.dart';
import 'package:vyapar_clone/repository/api/end_urls/end_url.dart';

import '../../../core/isResponseOk.dart';
import '../../../repository/app_data/user_data/shared_preferences.dart';
import '../../bottom_navigation_screen/view/bottom_navigation_screen.dart';

class SignInController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  RxBool isFlat = true.obs;
  @override
  void onInit() {
    super.onInit();
    deleteSplashMemory();
  }

  void deleteSplashMemory() {
    Get.delete<SplashScreenController>(tag: 'Splash memory deleted');
  }

  void login({number}) async {
    setLoadingValue(true);

    var data = {"phoneNo": int.parse(number)};
    var response =
        await _apiServices.postJsonData(data: data, endUrl: EndUrl.loginUrl);
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        try {
          CredentialModel model = CredentialModel(
              token: response.data["data"]["token"],
              userId: response.data["data"]["user"]["id"],
              phoneNo: response.data["data"]["user"]["details"]["phoneNo"]);
          await SharedPreLocalStorage.setCredential(model);
          Get.off(() => BottomNavigationScreen());
          SnackBars.showSuccessSnackBar(text: "You are logged in.");

          setLoadingValue(false);
        } catch (e) {
          SnackBars.showAlertSnackBar(text: "Failed to save user credential.");
          setLoadingValue(false);
        }

        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }
}
