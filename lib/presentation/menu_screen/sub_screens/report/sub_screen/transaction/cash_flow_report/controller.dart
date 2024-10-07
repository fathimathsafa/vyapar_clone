import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashFlowReportController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  RxBool isMoneyIn = true.obs; // Reactive variable

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      isMoneyIn.value = tabController.index == 0;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
