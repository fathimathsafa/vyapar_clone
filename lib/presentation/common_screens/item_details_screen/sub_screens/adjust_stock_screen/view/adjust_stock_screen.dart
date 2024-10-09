import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/adjust_stock_screen/widget/stock_option_widget.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/adjust_stock_screen/controller/stock_option_controller.dart';

class AdjustStockScreen extends StatelessWidget {
  // Use local variables for temporary state management in stateless widget
  final TextEditingController _dateController = TextEditingController(
    text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
  );
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  final StockOptionController stockOptionController =
      Get.put(StockOptionController());

  AdjustStockScreen({super.key});

  // Add a method to show the date picker and update the text field
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Adjust Stock',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Radio buttons to select between Add and Reduce Stock
            StockOptionWidget(),
            SizedBox(height: 20.h),

            // Date input field with calendar picker
            TextField(
              style: const TextStyle(color: Colorconst.cBlack),
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Enter Adjustment Date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, _dateController),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              labelText: 'Quantity',
              hintText: "Enter Quantity",
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20.h),

            // Price input field
            CustomTextFormField(
              labelText: 'Enter Price',
              hintText: "Enter Price",
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20.h),

            // Adjustment details input field
            CustomTextFormField(
              labelText: 'Adjustment Details',
              hintText: "Adjustment Details",
              keyboardType: TextInputType.number,
            ),
            const Spacer(),

            // Add Stock button at the bottom
            SizedBox(
              width: double.infinity,
              child: Obx(
                () => MaterialButton(
                  color: Colorconst.cBlue,
                  onPressed: () {
                    // Handle stock adjustment here, passing appropriate values
                  },
                  child: Text(
                    stockOptionController.stockOption.value == 0
                        ? 'Add Stock'
                        : 'Reduce Stock',
                    style: const TextStyle(color: Colorconst.cwhite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
