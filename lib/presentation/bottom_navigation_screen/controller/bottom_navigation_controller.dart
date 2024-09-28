import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:vyapar_clone/presentation/dash_board_screen/view/dash_board_screen.dart';
import 'package:vyapar_clone/presentation/home_screen/view/home_screen.dart';
import 'package:vyapar_clone/presentation/item_screen/view/item_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/view/menu_screen.dart';

class BottomNavigationController extends GetxController {
  final PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;

  final List<IconData> getIcons = [
    Icons.home_outlined,
    Icons.dashboard_outlined,
    Icons.apps_outlined,
    Icons.menu_outlined,
    Icons.workspace_premium_outlined,
  ];
  final List<String> iconsName = [
    "HOME",
    "DASHBOARD",
    "ITEMS ",
    "MENU",
    "GET PREMIUM",
  ];

  final List<Widget> sampleWidgets = [
    // HomeScreen(),
    //  Center(child:  Text("home",style: TextStyle(color: Colors.red,fontSize: 20.sp),)),
    HomeScreen(),
    DashBoardScreen(),
    ItemPage(), MenuScreen(),
    Center(
        child: Text("GET PREMIUM",
            style: TextStyle(color: Colors.red, fontSize: 20.sp))),
  ];
}
