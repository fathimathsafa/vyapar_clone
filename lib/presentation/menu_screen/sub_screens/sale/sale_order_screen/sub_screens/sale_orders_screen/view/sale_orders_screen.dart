import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sale_order_screen/view/sale_order_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sale_order_screen/widget/filtter_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaleOrdersScreen extends StatefulWidget {
  @override
  _SaleOrdersScreenState createState() => _SaleOrdersScreenState();
}

class _SaleOrdersScreenState extends State<SaleOrdersScreen> {
  String _currentFilter = "All"; // Keep track of which filter is selected

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter buttons
        Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterButton(
                label: "All",
                selected: _currentFilter == "All",
                onPressed: () {
                  setState(() {
                    _currentFilter = "All";
                  });
                },
              ),
              SizedBox(width: 10.w),
              FilterButton(
                label: "Open Orders",
                selected: _currentFilter == "Open Orders",
                onPressed: () {
                  setState(() {
                    _currentFilter = "Open Orders";
                  });
                },
              ),
              SizedBox(width: 10.w),
              FilterButton(
                label: "Closed Orders",
                selected: _currentFilter == "Closed Orders",
                onPressed: () {
                  setState(() {
                    _currentFilter = "Closed Orders";
                  });
                },
              ),
            ],
          ),
        ),
        // Dynamic content based on the selected filter
        Expanded(
          child: Center(
            child: _getOrdersContent(),
          ),
        ),
        // Add sale order button
        Padding(
          padding: EdgeInsets.all(16.0.w),
          child: ElevatedButton.icon(
            onPressed: () {
              // Handle add sale order
            },
            icon: Icon(
              Icons.add,
              color: Colorconst.cwhite,
              size: 18.sp,
            ),
            label: Text(
              "Add Sale Order",
              style: TextStyle(color: Colorconst.cwhite, fontSize: 14.sp),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colorconst.cRed,
              shape: StadiumBorder(),
              minimumSize: Size(100.w, 50.h),
            ),
          ),
        ),
      ],
    );
  }

  // Method to return different content based on the selected filter
  Widget _getOrdersContent() {
    if (_currentFilter == "All") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animation/document.json',
            height: 150.h,
            width: 105.w,
          ),
          SizedBox(height: 20),
          Text(
            "Hey! You have no orders yet.\nPlease add your sale order here",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );
    } else if (_currentFilter == "Open Orders") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animation/document.json',
            height: 150.h,
            width: 105.w,
          ),
          SizedBox(height: 20),
          Text(
            "Hey! You have no orders yet.\nPlease add your sale order here",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );
    } else if (_currentFilter == "Closed Orders") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animation/document.json',
            height: 150.h,
            width: 105.w,
          ),
          SizedBox(height: 20),
          Text(
            "Hey! You have no orders yet.\nPlease add your sale order here",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );
    }
    return Container();
  }
}
