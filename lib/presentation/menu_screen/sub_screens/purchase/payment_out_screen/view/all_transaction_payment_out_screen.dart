import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/purchase/payment_out_screen/sub_screens/add_payment_out_screen/view/add_payment_out_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/payment_in_screen/sub_screen/payment_in_screen.dart';

class PaymentAllTransactionScreen extends StatefulWidget {
  const PaymentAllTransactionScreen({super.key});

  @override
  _PaymentAllTransactionScreenState createState() =>
      _PaymentAllTransactionScreenState();
}

class _PaymentAllTransactionScreenState
    extends State<PaymentAllTransactionScreen> {
  // Simulating backend data fetching
  bool hasData = false; // Change this to true when data is fetched

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

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
        child: hasData
            ? buildTransactionList(screenWidth, screenHeight)
            : buildNoDataView(screenWidth, screenHeight),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.02),
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
  Widget buildNoDataView(double screenWidth, double screenHeight) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.7,
            height: screenHeight * 0.4,
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
          SizedBox(height: screenHeight * 0.02),
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
  Widget buildTransactionList(double screenWidth, double screenHeight) {
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
            // Divider between the two icon buttons
            Container(
              width: 2,
              height: 25,
              color: Colorconst.cGrey,
            ),
            SizedBox(
              width: screenWidth * .02,
            ),
            IconButton(
              onPressed: () {
                _showDatePicker(context); // Show date picker
              },
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colorconst.cBlue,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
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
            SizedBox(
              width: screenWidth * .45,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
        Divider(),
        // Expanded widget to wrap ListView.builder to handle scrolling
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
                    ), // Example leading icon
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
                          'Total:₹10.00', // Example text
                          style: TextStyle(
                              fontSize: 9.sp, color: Colorconst.cBlack),
                        ),
                        Text(
                          'Balance:₹10.00', // Example text
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
  void _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Set initial date to today
      firstDate: DateTime(2000), // Minimum selectable date
      lastDate: DateTime(2100), // Maximum selectable date
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // Header background color (Calendar header)
              onPrimary: Colors.white, // Header text color (Calendar title)
              onSurface: Colors.black, // Default text color inside the calendar
            ),
            dialogBackgroundColor:
                Colors.blue[100], // Calendar background color
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Button text color
              ),
            ),
          ),
          child: child!, // Only return the calendar picker directly
        );
      },
    );

    if (picked != null) {
      // Do something with the picked date if it's not null
      print("Selected Date: ${picked.toString()}");
    }
  }
}
