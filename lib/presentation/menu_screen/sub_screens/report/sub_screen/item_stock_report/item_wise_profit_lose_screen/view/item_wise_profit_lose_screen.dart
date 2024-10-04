import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/core/common/widget/pdf_icon_widget.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/item_wise_profit_lose_screen/controller/profit_lose_drop_down_controller.dart';

class ItemWiseProfitLoseScreen extends StatelessWidget {
  // Instantiate the DropdownController
  final ProfitLoseDropdownController dropdownController =
      Get.put(ProfitLoseDropdownController());

  // Checkbox state management
  final RxBool isSaleChecked = false.obs;

  // Sample data for the list
  final List<Map<String, String>> listItems = [
    {"leading": "Cake", "trailing": "₹290.0"},
    {"leading": "Ghee", "trailing": "₹290.0"},
  ];
  // Function to show alert dialog
  void _showAlertDialog(BuildContext context, String itemName, String amount) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            width: double.infinity,
            color: Colors.blue, // Heading color
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Particulars',
                  style: TextStyle(color: Colorconst.cwhite, fontSize: 13.sp),
                ),
                Text(
                  'Amount',
                  style: TextStyle(color: Colorconst.cwhite, fontSize: 13.sp),
                ),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sale (+)',
                    style: TextStyle(color: Colorconst.cBlack, fontSize: 12.sp),
                  ),
                  Text(
                    '₹290.0',
                    style: TextStyle(color: Colorconst.Green, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ce.Note/Sale Return\n (+)',
                    style: TextStyle(color: Colorconst.cBlack, fontSize: 12.sp),
                  ),
                  Text(
                    '₹290.0',
                    style: TextStyle(color: Colorconst.cRed, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Purchase (-)',
                    style: TextStyle(
                        color: Colorconst.cBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹290.0',
                    style: TextStyle(color: Colorconst.cRed, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dr.Note/Purchase\n Return(+)',
                    style: TextStyle(color: Colorconst.cBlack, fontSize: 12.sp),
                  ),
                  Text(
                    '₹00.0',
                    style: TextStyle(color: Colorconst.Green, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax Payable (-)',
                    style: TextStyle(
                        color: Colorconst.cBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹00.0',
                    style: TextStyle(color: Colorconst.cRed, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax Recievable (+)',
                    style: TextStyle(
                        color: Colorconst.cBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹0.0',
                    style: TextStyle(color: Colorconst.Green, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Opening Stock (-)',
                    style: TextStyle(
                      color: Colorconst.cBlack,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    '₹0.0',
                    style: TextStyle(color: Colorconst.cRed, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Closing Stock (+)',
                    style: TextStyle(
                        color: Colorconst.cBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹0.0',
                    style: TextStyle(color: Colorconst.Green, fontSize: 12.sp),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Net Profit',
                    style: TextStyle(
                        color: Colorconst.Green,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹290.0',
                    style: TextStyle(
                        color: Colorconst.Green,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK', style: TextStyle(color: Colorconst.Green)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text('Item Wise Profit & Loss',
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
          DateDropdownAndPicker(),
          Divider(),
          Text(
            "Sort By",
            style: TextStyle(
                color: Colorconst.cBlue,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold),
          ),
          Obx(() => Row(
                children: [
                  Checkbox(
                    value: isSaleChecked.value,
                    onChanged: (value) {
                      isSaleChecked.value = value ?? false;
                    },
                  ),
                  Text(
                    'Items having sale ',
                    style: TextStyle(fontSize: 14.sp, color: Colorconst.cGrey),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.0.w), // Padding for alignment
            child: Obx(
              () => DropdownButton<String>(
                value: dropdownController.selectedValue.value,
                items: dropdownController.dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(color: Colorconst.cBlack),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    dropdownController.setSelected(newValue);
                  }
                },
                isExpanded: true, // Optional: make the dropdown full-width
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Item Name',
                style: TextStyle(
                  fontSize: 12.sp,
                  decoration: TextDecoration.underline, // Adds an underline
                  color: Colorconst.cGrey, // Text color
                ),
              ),
              Text(
                'Profit/Loss Amount',
                style: TextStyle(
                  decoration: TextDecoration.underline, // Adds an underline
                  fontSize: 12.sp,
                  color: Colorconst.cGrey, // Text color
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                final item = listItems[index];
                return InkWell(
                  onTap: () {
                    _showAlertDialog(
                        context, item["leading"]!, item["trailing"]!);
                  },
                  child: ListTile(
                    leading: Text(
                      item["leading"]!,
                      style: TextStyle(
                          fontSize: 14.0.sp,
                          color: Colorconst.cBlack), // Customize text style
                    ),
                    trailing: Text(
                      item["trailing"]!,
                      style: TextStyle(
                          fontSize: 14.0.sp,
                          color: Colorconst.Green), // Customize text style
                    ),
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
              ),
              Text(
                "₹580",
                style: TextStyle(color: Colorconst.Green, fontSize: 14.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
