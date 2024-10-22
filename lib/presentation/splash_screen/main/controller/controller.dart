import 'dart:async';

import 'package:get/get.dart';


import '../../../../core/models/credential_model.dart';
import '../../../../repository/app_data/user_data/shared_preferences.dart';
import '../../../bottom_navigation_screen/view/bottom_navigation_screen.dart';
import '../../view/onboarding_screen.dart';


class SplashMainController extends GetxController{

   void splashEngine() {
    Timer(Duration(seconds: 3.toInt()), () async {
       CredentialModel model= await SharedPreLocalStorage.getCredential();
       printInfo(info: "token ==${model.token}");
       printInfo(info: "userId ==${model.userId}");
       if(model.token==''){
         Get.to(()=> OnboardingScreen());
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