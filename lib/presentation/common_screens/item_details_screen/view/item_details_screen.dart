import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/adjust_stock_screen/view/adjust_stock_screen.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/edit_item_screen/view/edit_item_screen.dart';

class ItemDetailsScreen extends StatelessWidget {
  final List<Map<String, String>> listItems = [
    {
      "leading": "Reduce Stock",
      "trailing": "₹290.0",
      "date": "10/04/2024",
      "tittle": "55.0"
    },
    {
      "leading": "Ghee",
      "trailing": "₹290.0",
      "date": "10/04/2024",
      "tittle": "5.0 Bdl"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cwhite,
      appBar: AppBar(
        title: const Text(
          'Item Details',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colors.green),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const XlsOptionsBottomSheet(),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colorconst.cBlue,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditItemScreen()));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item details section
          Text(
            'Dss',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colorconst.cGrey),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Sale Price',
                      style:
                          TextStyle(fontSize: 14.sp, color: Colorconst.cGrey)),
                  Text('₹ 58.00',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colorconst.cBlack)),
                ],
              ),
              Column(
                children: [
                  Text('Purchase Price',
                      style:
                          TextStyle(fontSize: 14.sp, color: Colorconst.cGrey)),
                  Text('₹ 0.00',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colorconst.cBlack)),
                ],
              ),
              Column(
                children: [
                  Text('In Stock',
                      style:
                          TextStyle(fontSize: 14.sp, color: Colorconst.cGrey)),
                  Text('-5.0',
                      style: TextStyle(
                        color: Colorconst.cRed,
                        fontSize: 14.sp,
                      )),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          const Divider(),

          // Stock transactions section

          SizedBox(height: 10.h),

          Container(
            height: 60.h,
            width: double.infinity,
            color: Colorconst.cGrey.withOpacity(0.2),
            child: Column(
              children: [
                Text(
                  "Stock Transactions",
                  style: TextStyle(
                      color: Colorconst.cBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Transactions",
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 13.sp),
                    ),
                    Text(
                      "Quantity",
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 13.sp),
                    ),
                    Text(
                      "Total Amount",
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 13.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          // List of transactions
          Expanded(
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                final item = listItems[index];
                return ListTile(
                  leading: Column(
                    children: [
                      Text(
                        item["leading"]!,
                        style: TextStyle(
                            fontSize: 14.sp, color: Colorconst.cBlack),
                      ),
                      Text(
                        item["date"]!,
                        style:
                            TextStyle(fontSize: 12.sp, color: Colorconst.cGrey),
                      ),
                    ],
                  ),
                  title: Center(
                    child: Text(
                      item["tittle"]!,
                      style:
                          TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
                    ),
                  ),
                  trailing: Text(
                    item["trailing"]!,
                    style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
                  ),
                );
              },
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AdjustStockScreen()));
            },
            backgroundColor: Colorconst.cBlue,
            label: Text(
              'Adjust Stock',
              style: TextStyle(fontSize: 14.sp, color: Colorconst.cwhite),
            ),
            shape: const StadiumBorder(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
