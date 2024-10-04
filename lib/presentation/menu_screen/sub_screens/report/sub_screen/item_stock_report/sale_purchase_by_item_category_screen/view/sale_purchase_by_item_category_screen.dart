import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/controller/date_controller.dart';
import 'package:vyapar_clone/core/common/widget/all_parties_name_widget.dart/controller/drop_down_controller.dart';
import 'package:vyapar_clone/core/common/widget/all_parties_name_widget.dart/view/all_parties_name_widget.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/core/common/widget/pdf_icon_widget.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/sale_purchase_by_item_category_screen/widget/category_row_widget.dart';

class SalePurchaseByItemCategoryScreen extends StatelessWidget {
  final DateController controller = Get.put(DateController());
  final DropdownController dropdownController = Get.put(DropdownController());
  final ValueNotifier<String> selectedValueNotifier =
      ValueNotifier<String>('Name'); // Initial value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text('Sale/Purchase By Item Category',
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
                builder: (_) => const PdfOptionsBottomSheet(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colors.green),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const XlsOptionsBottomSheet(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DateDropdownAndPicker(),
          const Divider(),
          Padding(
            padding: EdgeInsets.only(left: 6.0.w, right: 6.w),
            child: Row(
              children: [
                Text('Party Name',
                    style: TextStyle(fontSize: 12.sp, color: Colorconst.cBlue)),
                SizedBox(
                  width: 100.w,
                ),
                Text('Sort by',
                    style: TextStyle(fontSize: 12.sp, color: Colorconst.cBlue)),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 6.0.w, right: 6.w),
              child: AllPartyNameWidget(
                  selectedValueNotifier: selectedValueNotifier)),
          const CategoryRowWidget(),
          Padding(
            padding: EdgeInsets.only(left: 6.0.w, right: 6.w),
            child: const Row(
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
          )
        ],
      ),
    );
  }
}
