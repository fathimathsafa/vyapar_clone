import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/splash_screen/controller/controller.dart';

class SignInController extends GetxController{


  RxBool isFlat = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    deleteSplashMemory();
  }

  void deleteSplashMemory(){
    Get.delete<SplashScreenController>(tag: 'Splash memory deleted');
  }
}