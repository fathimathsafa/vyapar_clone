import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/pdf_icon_widget.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/low_stock_summery_screen/widgets/low_stock_filter_summary_list.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/widget/filtter_chips.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/widget/stock_filtter_bottom_sheet.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/widget/stock_item_list.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/widget/sumery_card_list.dart';

class LowStockSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colorconst.cwhite,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Low Stock Summary Report',
            style: TextStyle(color: Colorconst.cBlack)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colorconst.cwhite,
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Filters Applied:',
                        style: TextStyle(
                            fontSize: 14.sp, color: Colorconst.cBlack)),
                    MaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => StockFilterBottomSheet(),
                        );
                      },
                      shape: StadiumBorder(
                        side: BorderSide(
                            color: Colorconst.cGrey,
                            width: 1.0.w), // Border properties
                      ),
                      child: Row(
                        children: [
                          Text('Filters',
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colorconst.cBlack)),
                          Icon(Icons.filter_alt_outlined, color: Colors.blue),
                        ],
                      ),
                    ),
                  ],
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
                            builder: (context) => StockFilterBottomSheet(),
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
                            builder: (context) => StockFilterBottomSheet(),
                          );
                        },
                        color: Colorconst.cGrey2,
                        child: Text(
                          "Stock-All",
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
                            builder: (context) => StockFilterBottomSheet(),
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
          LowStockSummaryCards(),
          SizedBox(height: 10.h),
          Expanded(child: StockItemList()),
        ],
      ),
    );
  }
}
