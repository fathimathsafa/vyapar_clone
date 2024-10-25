import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/purchase/payment_out_screen/controller/all_transaction_payment_out.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/purchase/payment_out_screen/sub_screens/add_payment_out_screen/view/add_payment_out_screen.dart';

import '../sub_screens/add_payment_out_screen/controller/controller.dart';

class PaymentAllTransactionScreen extends StatelessWidget {
   PaymentAllTransactionScreen({super.key});

    final AddPaymentController controller =
        Get.put(AddPaymentController()); // Initialize controller
  @override
  Widget build(BuildContext context) {
      controller.fetchAllPaymentOout();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colorconst.cwhite),
        ),
        title: Text(
          "All Transaction Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => controller.hasData.value
            ? buildTransactionList()
            : buildNoDataView()),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddPaymentOutScreen()));
            },
            backgroundColor: Colorconst.Green,
            icon: Icon(Icons.add_circle, color: Colors.white),
            label: Text(
              'Give Payment',
              style: TextStyle(fontSize: 14.sp, color: Colorconst.cwhite),
            ),
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Widget to build the no data view
  Widget buildNoDataView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().setWidth(300),
            height: ScreenUtil().setHeight(200),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/images-removebg-preview.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            "Add Your first Payment In",
            style: TextStyle(fontSize: 19.sp),
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          Text(
            "Record payment received from parties and easily",
            style: TextStyle(color: Colorconst.cBlack, fontSize: 15.sp),
          ),
          Text(
            "link them to your current invoices.",
            style: TextStyle(color: Colorconst.cBlack, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  // Widget to build the transaction list
  Widget buildTransactionList() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "This Month",
              style: TextStyle(fontSize: 14.sp),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down),
            ),
            Container(
              width: 2,
              height: 25,
              color: Colorconst.cGrey,
            ),
            SizedBox(width: ScreenUtil().setWidth(10)),
            IconButton(
              onPressed: () {
                _showDatePicker(); // Show date picker
              },
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colorconst.cBlue,
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(10)),
            Text(
              "01/09/2024 To 30/09/2024",
              style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Text(
              "Payment-In",
              style: TextStyle(fontSize: 14.sp),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Text(
              "Party Name",
              style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlue),
            ),
            Text(
              "  All Parties",
              style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
            ),
            SizedBox(width: ScreenUtil().setWidth(100)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
       const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: 2, // Number of items in the list
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Arun', // Title text
                          style: TextStyle(
                              fontSize: 12.sp, color: Colorconst.cBlack),
                        ),
                        Text(
                          '24/09/2024', // Title text
                          style: TextStyle(
                              fontSize: 12.sp, color: Colorconst.cGrey),
                        ),
                      ],
                    ),
                    title: Center(
                      child: Text(
                        'PayIn: 1', // Title text
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total: ₹10.00', // Example text
                          style: TextStyle(
                              fontSize: 9.sp, color: Colorconst.cBlack),
                        ),
                        Text(
                          'Balance: ₹10.00', // Example text
                          style: TextStyle(
                              fontSize: 10.sp, color: Colorconst.cGrey),
                        ),
                      ],
                    ),
                  ),
                  Divider(), // Divider between ListTiles
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // Function to show the date picker
  void _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.blue[100],
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      print("Selected Date: ${picked.toString()}");
    }
  }
}
