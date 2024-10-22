import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/party%20details/sub_PartyDetail/add_party/view/add_party.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/party%20details/sub_PartyDetail/edit_party/edit_party.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/add_sale.dart';

import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/greetin_offer/view/greeting_offer.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/setting/sub_settings/party/view/party.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/setting/sub_settings/reminder/sub_reminder/view/payment_reminder.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/vyaprar_premium/view/vyapar_premium.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/all_party_reports/view/all_party_reports.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/party_report_by_item_screen/view/party_report_by_items.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/payment_in_screen/sub_screen/view/payment_in_screen.dart';

import '../sub_PartyDetail/import_party/view/import_party_new.dart';

class PartyDetails extends StatelessWidget {
  const PartyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Party Details',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Get.off(() => EditPartyPage());
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _showMoreActionsBottomSheet(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Party Info
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(8.r), // Responsive border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Party Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gokul',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp)), // Responsive font size
                      SizedBox(height: 4.h), // Responsive height
                      Text('111', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  // Payable Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red, size: 18.sp),
                          SizedBox(width: 4.w),
                          Text('Payable: ₹1.00',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text('No Credit Limit Set',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Send Reminder and Send Statement Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.alarm),
                  label: Text(
                    'Send Reminder',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.picture_as_pdf),
                  label: Text(
                    'Send Statement',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Search Transactions Field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Transactions',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    _showFilterBottomSheet(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Transactions (Payment-In, Credit Note, Sale)
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionCard(context, 'Payment-In', '1.00', '1.00',
                      'INV-001', '24 Sept, 24'),
                  _buildTransactionCard(context, 'Credit Note', '10,000.00',
                      '10,000.00', 'INV-002', '10 Sept, 24'),
                  _buildTransactionCard(context, 'Sale', '10,000.00',
                      '10,000.00', 'INV-003', '19 Sept, 24'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar with a circular avatar button
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.off(() => PaymentInScreen());
              },
              child: Text(
                'Take Payment',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            // Circular Avatar Button
            FloatingActionButton(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              onPressed: () {
                // Handle add action here
                print('Add button pressed');
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(() => AddSaleInvoiceScreen());
              },
              child: Text(
                'Add Sale',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  void _showMoreActionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'More Actions',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 16.h),
              ListTile(
                leading: Icon(Icons.chat, color: Colors.green),
                title: Text('Chat on WhatsApp'),
                onTap: () {
                  // Handle WhatsApp action here
                  Navigator.pop(context);
                  // e.g. launchWhatsApp();
                },
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf, color: Colors.blue),
                title: Text('Send PDF'),
                onTap: () {
                  // Handle Send PDF action here
                  Navigator.pop(context);
                  // e.g. sendPdf();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Filter Transactions',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 16.h),
                  // ...List.generate(transactionTypes.length, (index) {
                  //   return CheckboxListTile(
                  //     title: Text(transactionTypes[index]),
                  //     value: _selectedFilters[index],
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _selectedFilters[index] = value!;
                  //       });
                  //     },
                  //   );
                  // }),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      // Handle filtering here
                      Navigator.pop(context);
                    },
                    child: Text('Apply Filters'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTransactionCard(BuildContext context, String title,
      String amount, String received, String invoiceNo, String date) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp, // Responsive font size
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount: $amount',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Invoice No: $invoiceNo',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Received: $received',
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  'Date: $date',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
