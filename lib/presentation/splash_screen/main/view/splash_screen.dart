import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../controller/controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final _controller = Get.put(SplashMainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(height: double.infinity,width: double.infinity,
    
    color: Colorconst.cSecondaryBlue,
    ),);
  }
}