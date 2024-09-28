import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // For Lottie animation
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_sale.dart';

class ManageSaleOrders extends StatefulWidget {
  const ManageSaleOrders({super.key});

  @override
  _ManageSaleOrdersState createState() => _ManageSaleOrdersState();
}

class _ManageSaleOrdersState extends State<ManageSaleOrders> {
  int _selectedButtonIndex = 0; // To track selected button

  // Function to build the buttons
  Widget _buildOrderButton(
      String text, int index, double buttonHeight, double fontSize) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedButtonIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.3),
          decoration: ShapeDecoration(
            color: _selectedButtonIndex == index
                ? Colors.pink.shade100 // Light pink for selected
                : Colors.white,
            shape: StadiumBorder(
              side: BorderSide(
                color: _selectedButtonIndex == index ? Colors.red : Colors.grey,
                width: 2, // Adjust the width of the border
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color:
                    _selectedButtonIndex == index ? Colors.red : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          // Row of buttons
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Row(
              children: [
                _buildOrderButton(
                    "All", 0, screenHeight * 0.04, screenWidth * 0.03),
                _buildOrderButton(
                    "Open Orders", 1, screenHeight * 0.04, screenWidth * 0.03),
                _buildOrderButton("Closed Orders", 2, screenHeight * 0.04,
                    screenWidth * 0.03),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          // Lottie animation in the center
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add your Lottie animation here (Make sure to add a valid lottie JSON file URL)
                Lottie.asset(
                  'assets/animation/document.json',
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.3,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: screenHeight * 0.02),

                // Centered text
                Text(
                  'Hey you have no orders yet. Please add your sale',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'order here.',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddSaleInvoiceScreen()));
            },
            backgroundColor: Colorconst.cRed,
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add Sale Order',
              style: TextStyle(fontSize: 14.sp, color: Colorconst.cwhite),
            ),
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
