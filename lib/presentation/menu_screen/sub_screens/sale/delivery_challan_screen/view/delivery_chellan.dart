import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/delivery_challan_screen/controller/delivery_challan_controller.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/delivery_challan_screen/sub_screens/add_delivery_challan_screen/view/add_delivery_challan_screen.dart';


class DeliveryChallanScreen extends StatelessWidget {
  final DeliveryChallanController controller = Get.put(DeliveryChallanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Delivery Challan Details",
            style: TextStyle(color: Colorconst.cBlack),
          ),
          bottom: TabBar(
            controller: controller.tabController,
            labelColor: Colorconst.cRed,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Open Challan'),
              Tab(text: 'Closed Challan'),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            _buildEmptyChallanView(),
            _buildEmptyChallanView(),
            _buildEmptyChallanView(),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Widget _buildEmptyChallanView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/animation/document.json",
            height: 150.h, width: 150.w),
        SizedBox(height: 20.h),
        Text(
          "Hey! You have no delivery challans yet.",
          style: TextStyle(fontSize: 16.sp, color: Colorconst.cGrey),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.h),
        Text(
          "Please add your delivery challans here",
          style: TextStyle(fontSize: 16.sp, color: Colorconst.cGrey),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => AddDeliveryChallanScreen());
          },
          backgroundColor: Colorconst.cRed,
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Add Delivery Challan',
            style: TextStyle(fontSize: 14.sp, color: Colorconst.cwhite),
          ),
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
