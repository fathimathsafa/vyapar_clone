import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/party_reports/controller/party_statement_controller.dart';


class PartyStatement extends StatelessWidget {
  final PartyStatementController controller =
      Get.put(PartyStatementController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Party Statement',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colorconst.cBlack),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
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
          children: [
            Container(
              color: Colorconst.cwhite,
              child: Column(
                children: [
                  DateDropdownAndPicker(),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Filters Apllied:",
                            style: TextStyle(
                                color: Colorconst.cBlack, fontSize: 16.sp),
                          ),
                          SizedBox(height: 10.h),
                          MaterialButton(
                            minWidth: 100.h,
                            height: 20.h,
                            shape: StadiumBorder(),
                            onPressed: () {},
                            color: Colorconst.cGrey,
                            child: Text(
                              "Theme:Vypar view",
                              style: TextStyle(color: Colorconst.cGrey2),
                            ),
                          )
                        ],
                      ),
                      MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Colorconst.cBlue,
                            ),
                            Text("Filter")
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            // Search Bar
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  style: TextStyle(color: Colorconst.cBlack),
                  decoration: InputDecoration(
                    labelText: 'Search Party',
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Colorconst.cBlue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0.r),
                      borderSide: BorderSide.none, // Remove border line
                    ),
                  ),
                  onChanged: (value) {
                    controller.filterResults(value);
                  },
                ),
              ),
            ),
            // Suggestions List
            Obx(() {
              if (controller.showSuggestions.value &&
                  controller.searchQuery.value.isNotEmpty) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.filteredResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.filteredResults[index]),
                        onTap: () {
                          controller.selectParty(
                              controller.filteredResults[index]);
                        },
                      );
                    },
                  ),
                );
              }
              return Container();
            }),

            // Conditionally show content based on search query
            Obx(() {
              return Expanded(
                child: controller.searchQuery.value.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/download-removebg-preview.png",
                              height: 100.h,
                              width: 100.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle tap on text
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'To see the statement in full details,',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colorconst.cGrey),
                                  ),
                                  Text(
                                    'Please select a party.',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colorconst.cGrey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          // Bottom Container for Amounts and Table
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildAmountContainer('Total Amount', '₹5000'),
                              _buildAmountContainer('Closing Balance', '₹5000',
                                  amountColor: Colorconst.cRed),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildTransactionsTable(),
                        ],
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountContainer(String title, String amount,
      {Color amountColor = Colorconst.cBlack}) {
    return Container(
      height: 50.h,
      width: 140.h,
      decoration: BoxDecoration(
          color: Colorconst.cwhite, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colorconst.cGrey, fontSize: 13.sp),
          ),
          Text(
            amount,
            style: TextStyle(color: amountColor, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsTable() {
    return Card(
      color: Colorconst.cwhite,
      margin: EdgeInsets.all(16.w),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              'Txns Type',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
            title: Center(
              child: Text(
                'Amount',
                style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
              ),
            ),
            trailing: Text(
              'Balance',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
          ),
          const Divider(),
          _buildTransactionRow('Sales', '12 sep 24 sale 1', '₹4000', '₹0.00'),
          Divider(),
          _buildTransactionRow('Sale 1', '12 sep 24 sale 1', '₹2000', '₹0.00'),
          Divider(),
          _buildTransactionRow('Opening Balance', '12 sep 24 sale 1', '₹1000',
              '₹2000.00'),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(
      String txnType, String date, String amount, String balance) {
    return ListTile(
      leading: Text(
        txnType,
        style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(color: Colorconst.cBlack, fontSize: 12.sp),
          ),
          Text(
            '₹500',
            style: TextStyle(color: Colorconst.cBlack, fontSize: 12.sp),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
          ),
          Text(
            balance,
            style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
