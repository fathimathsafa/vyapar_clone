import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/pdf_icon_widget.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/sale_purchase_by_item_category_screen/widget/category_row_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockSummeryByItemCategoryScreen extends StatelessWidget {
  const StockSummeryByItemCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text('Stock Summery By Item Category',
            style: TextStyle(color: Colorconst.cwhite)),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colorconst.cwhite,
          ),
        ),
        actions: [
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
          CategoryRowWidget(),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.0.w, right: 6.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uncategorized",
                  style: TextStyle(
                    color: Colorconst.cBlack,
                  ),
                ),
                Text(
                  "0.0",
                  style: TextStyle(
                    color: Colorconst.cGrey,
                  ),
                ),
                Text(
                  "0.0",
                  style: TextStyle(
                    color: Colorconst.cGrey,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
