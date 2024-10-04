import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/adjust_stock_screen/controller/stock_option_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockOptionWidget extends StatelessWidget {
  final StockOptionController stockOptionController =
      Get.put(StockOptionController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(() => RadioListTile<int>(
                value: 0,
                groupValue: stockOptionController.stockOption.value,
                onChanged: (int? value) {
                  stockOptionController.setStockOption(value!);
                },
                title: Text(
                  'Add Stock',
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 12.sp),
                ),
              )),
        ),
        Expanded(
          child: Obx(() => RadioListTile<int>(
                value: 1,
                groupValue: stockOptionController.stockOption.value,
                onChanged: (int? value) {
                  stockOptionController.setStockOption(value!);
                },
                title: Text(
                  'Reduce Stock',
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 12.sp),
                ),
              )),
        ),
      ],
    );
  }
}
