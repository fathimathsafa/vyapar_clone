import 'dart:async';

import 'package:get/get.dart';

class SplashScreenController extends GetxController{

  RxBool first = true.obs;
  RxDouble fontsize = 20.0.obs;
  // Color color = Colorconst.text1;
   void splashEngine() {
    Timer(Duration(seconds: 4.toInt()), () async {
      // await Get.off(() => BaseScreen());
    });
  }

  @override
  void onInit() {
   
    super.onInit();
    splashEngine();
  }
}