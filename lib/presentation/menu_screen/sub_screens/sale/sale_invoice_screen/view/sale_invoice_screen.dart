import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_sale.dart';



class SaleInvoistListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen height and width using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // White app bar color
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Sale List',
          style: TextStyle(color: Colors.black), // Title color
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_sharp, color: Colorconst.cGrey),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(Icons.picture_as_pdf, color: Colorconst.cRed),
            onPressed: () {
              // PDF action
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade100,
              Colors.lightBlue.shade50,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container for Total Sale info
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * .01, vertical: screenWidth * .01),
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(5.r), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Sale",
                      style: TextStyle(color: Colorconst.cGrey),
                    ),
                    Text(
                      "₹5000.00",
                      style: TextStyle(
                          color: Colorconst.cBlack,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Expanded widget to allow ListView.builder to take remaining space
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Modify this for actual items
                itemBuilder: (context, index) {
                  return Card(
                    color: Colorconst.cwhite,
                    margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * .01,
                        vertical: screenWidth * .01),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Arun",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                              Container(
                                height: screenHeight * .04,
                                width: screenWidth * .12,
                                decoration: ShapeDecoration(
                                  shape: const StadiumBorder(),
                                  color: Colorconst.cCream,
                                ),
                                child: Center(
                                  child: Text(
                                    'PAID',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colorconst.cOrange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '#sale1',
                                    style: TextStyle(
                                        color: Colorconst.cGrey,
                                        fontSize: 10.sp),
                                  ),
                                  Text(
                                    '24 sep,24',
                                    style: TextStyle(
                                        color: Colorconst.cGrey,
                                        fontSize: 10.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '₹5000 ',
                            style: TextStyle(
                                color: Colorconst.cBlack,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenHeight * .03,
                          )
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: screenWidth * .01),
                                Column(
                                  children: [
                                    Text("Balance: ₹5000"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.print, color: Colors.grey),
                              SizedBox(width: screenWidth * .03),
                              Icon(Icons.share_rounded, color: Colors.grey),
                              SizedBox(width: screenWidth * .03),
                              Icon(Icons.more_vert, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
              'Add Sale',
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
