import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
// import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/delivery_challan_screen/sub_screens/add_delivery_challan_screen/view/add_delivery_challan_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/estimate_quotation_screen/sub_screens/add_estimate_screen/view/add_estimate_screen.dart';

class EstimateDetailsScreen extends StatefulWidget {
  @override
  _EstimateDetailsScreenState createState() => _EstimateDetailsScreenState();
}

class _EstimateDetailsScreenState extends State<EstimateDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            "Estimate/Quotation",
            style: TextStyle(color: Colorconst.cBlack),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colorconst.cRed,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Open Estimate'),
              Tab(text: 'Closed Estimate'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildEmptyEstimateView(),
            _buildEmptyEstimateView(),
            _buildEmptyEstimateView(),
          ],
        ),
        floatingActionButton:
            _buildFloatingActionButton(context), // Added FloatingActionButton
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Widget _buildEmptyEstimateView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/animation/document.json",
            height: 150.h, width: 150.w),
        SizedBox(height: 20.h), // Use .h for height
        Text(
          "Hey! You have no estimate/quotations yet yet.",
          style: TextStyle(
              fontSize: 16.sp,
              color: Colorconst.cGrey), // Use .sp for font size
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.h),
        Text(
          "Please add your estimate/quotations here",
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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EstimateQuatationScreen()));
          },
          backgroundColor: Colorconst.cRed,
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Add Estimate',
            style: TextStyle(fontSize: 14.sp, color: Colorconst.cwhite),
          ),
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
