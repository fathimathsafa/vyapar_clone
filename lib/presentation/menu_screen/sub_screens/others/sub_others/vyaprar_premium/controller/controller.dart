// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VyaparPremiumController extends GetxController {
  RxInt goldPlaneBtnIndex = 0.obs;
  void setgoldPlanBtnIndexValue(value) {
    goldPlaneBtnIndex.value = value;
  }

  RxInt planListLength = 22.obs;

  RxInt selectedPlanListIndex = 0.obs;
  void setPlanListIndex(value) {
    selectedPlanListIndex.value = value;
  }

  //vyapar licence screen data
  RxBool gstinCheckB = false.obs;
  void setGstinCheckBvalue(value) {
    gstinCheckB.value = value;
  }

  final gstnInputController = TextEditingController();
}
