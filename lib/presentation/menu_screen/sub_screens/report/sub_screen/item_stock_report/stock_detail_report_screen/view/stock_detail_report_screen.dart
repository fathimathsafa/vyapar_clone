import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/controller/date_controller.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/core/common/widget/filtter_bottom-sheet_widget/view/filtter_bottom_sheet_widget.dart';
import 'package:vyapar_clone/core/common/widget/math_operation_container.dart';
import 'package:vyapar_clone/core/common/widget/pdf_icon_widget.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/view/item_details_screen.dart';

class StockDetailReport extends StatelessWidget {
  final DateController controller = Get.put(DateController());

  // Sample data for ListView.builder
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Soap',
    },
    {
      'title': 'Ghee',
    },

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Stock Detail Report',
            style: TextStyle(color: Colorconst.cBlack)),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => PdfOptionsBottomSheet(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colors.green),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => XlsOptionsBottomSheet(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                DateDropdownAndPicker(),
                const Divider(),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Filters Applied:',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colorconst.cBlack)), // Using ScreenUtil
                      MaterialButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => FilterBottomSheet(),
                          );
                        },
                        shape: const StadiumBorder(
                          side: BorderSide(color: Colorconst.cGrey, width: 1.0),
                        ),
                        child: Row(
                          children: [
                            Text('Filters',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        Colorconst.cBlack)), // Using ScreenUtil
                            const Icon(Icons.filter_alt_outlined,
                                color: Colorconst.cBlue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Row(
                    children: [
                      MaterialButton(
                        height: 20.h,
                        shape: const StadiumBorder(),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => FilterBottomSheet(),
                          );
                        },
                        color: Colorconst.cGrey2,
                        child: Text(
                          "Item category-All",
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 11.sp),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      MaterialButton(
                        height: 20.h,
                        shape: const StadiumBorder(),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => FilterBottomSheet(),
                          );
                        },
                        color: Colorconst.cGrey2,
                        child: Text(
                          "Status-All",
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 11.sp),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 6.w),
            child: QtyConatinerWidget(
              closingQty: 10.0, // Example static data
              beginningQty: 5.0,
              qtyIn: 3.0,
              qtyOut: 2.0,
            ),
          ), // Responsive height
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0), // Padding for left and right
                      child: Container(
                        color: Colors
                            .white, // Set the background color of the container
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemDetailsScreen()));
                          },
                          child: ListTile(
                            title: Text(item['title'],
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colorconst
                                        .cBlack)), // Using ScreenUtil for responsive text
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Closing Quantity:-0',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colorconst.cGrey)),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Beginning Qty",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colorconst.cGrey)),
                                        Text("0.0",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colorconst.cGrey))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Quantity In",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colorconst.cGrey)),
                                        Text("0.0",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colorconst.cGrey))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Quantity Out",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colorconst.cGrey)),
                                        Text("0.0",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colorconst.cGrey))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 8
                            .h), // Space between ListTiles (adjust height as needed)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
