import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // For Lottie animation
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/add_sale.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_orders/controller/manage_sale_order.dart';

class ManageSaleOrders extends StatelessWidget {
  const ManageSaleOrders({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final SaleOrderController controller = Get.put(SaleOrderController());

    return Scaffold(
      body: Column(
        children: [
          // Row of buttons
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.w, vertical: 20.h), // Use ScreenUtil for padding
            child: Row(
              children: [
                _buildOrderButton("All", 0, controller),
                _buildOrderButton("Open Orders", 1, controller),
                _buildOrderButton("Closed Orders", 2, controller),
              ],
            ),
          ),
          SizedBox(height: 20.h), // Use ScreenUtil for spacing

          // Lottie animation in the center
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animation/document.json',
                  width: 0.5.sw, // Use ScreenUtil for width
                  height: 0.3.sh, // Use ScreenUtil for height
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20.h), // Use ScreenUtil for spacing

                // Centered text
                Text(
                  'Hey you have no orders yet. Please add your sale',
                  style: TextStyle(
                    fontSize: 15.sp, // Use ScreenUtil for font size
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'order here.',
                  style: TextStyle(
                    fontSize: 15.sp, // Use ScreenUtil for font size
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

  // Function to build the buttons
  Widget _buildOrderButton(
      String text, int index, SaleOrderController controller) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.updateSelectedButton(
              index); // Update the selected index in the controller
        },
        child: Obx(() => Container(
              padding: EdgeInsets.symmetric(
                  vertical: 20.h * 0.3), // Use ScreenUtil for padding
              decoration: ShapeDecoration(
                color: controller.selectedButtonIndex.value == index
                    ? Colors.pink.shade100 // Light pink for selected
                    : Colors.white,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: controller.selectedButtonIndex.value == index
                        ? Colors.red
                        : Colors.grey,
                    width: 2, // Adjust the width of the border
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.sp, // Use ScreenUtil for font size
                    color: controller.selectedButtonIndex.value == index
                        ? Colors.red
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
