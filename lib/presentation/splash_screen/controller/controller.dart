import 'dart:async';

import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/splash_screen/view/splash_screen.dart';

import '../../../core/models/credential_model.dart';
import '../../../repository/app_data/user_data/shared_preferences.dart';
import '../../bottom_navigation_screen/view/bottom_navigation_screen.dart';

class SplashScreenController extends GetxController{

  RxBool first = true.obs;
  RxDouble fontsize = 20.0.obs;
  // Color color = Colorconst.text1;
   void splashEngine() {
    Timer(Duration(seconds: 1.toInt()), () async {
       CredentialModel model= await SharedPreLocalStorage.getCredential();
       printInfo(info: "token ==${model.token}");
       printInfo(info: "userId ==${model.userId}");
       if(model.token==''){
        //  Get.to(()=> SplashScreen());
       }else{

       Get.off(() => BottomNavigationScreen());
       }
    });
  }

  @override
  void onInit() {
   
    super.onInit();
    splashEngine();
  }
}