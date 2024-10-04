import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/adjust_stock_screen/controller/stock_option_controller.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/edit_item_screen/controller/custom_tabview_controller.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/edit_item_screen/controller/edit_item_screen_controller.dart';

class EditItemScreen extends StatelessWidget {
  final EditItemController controller = Get.put(EditItemController());
  final TextEditingController _dateController = TextEditingController(
    text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
  );

  final StockOptionController stockOptionController =
      Get.put(StockOptionController());

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
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'Edit Item',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colorconst.cBlue,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        color: Colorconst.cwhite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Product",
                              style: TextStyle(
                                  color: Colorconst.cGrey, fontSize: 14.sp),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Obx(() => Switch(
                                  value: controller.isProduct.value,
                                  onChanged: (value) {
                                    controller.toggleProductService(value);
                                  },
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Services",
                              style: TextStyle(
                                  color: Colorconst.cGrey, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.only(left: 6.w, right: 6.w),
                        color: Colorconst.cwhite,
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            TextFormField(
                              style: TextStyle(color: Colorconst.cBlack),
                              decoration: InputDecoration(
                                labelText: 'Item Name',
                                suffixIcon: MaterialButton(
                                  height: 20.h,
                                  color: Colors.lightBlue[50],
                                  shape: StadiumBorder(),
                                  onPressed: () {
                                    // Handle Edit Unit action
                                  },
                                  child: Text(
                                    'Edit Unit',
                                    style: TextStyle(
                                        color: Colorconst.cBlue,
                                        fontSize: 11.sp),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .grey, // Customize the border color
                                    width: 1.5, // Customize the border width
                                  ),
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                // Increase vertical padding for taller TextFormField
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 16.w),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: EdgeInsets.only(left: 250.w),
                              child: Text('BUNDLES (BDL)',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10.sp)),
                            ),
                            SizedBox(height: 10.h),
                            TextFormField(
                              style: TextStyle(color: Colorconst.cBlack),
                              decoration: InputDecoration(
                                labelText: 'Item Code/Barcode',
                                suffixIcon: MaterialButton(
                                  height: 20.h,
                                  color: Colors.lightBlue[50],
                                  shape: StadiumBorder(),
                                  onPressed: () {
                                    // Handle Edit Unit action
                                  },
                                  child: Text(
                                    'Assaign Code',
                                    style: TextStyle(
                                        color: Colorconst.cBlue,
                                        fontSize: 11.sp),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .grey, // Customize the border color
                                    width: 1.5, // Customize the border width
                                  ),
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                // Increase vertical padding for taller TextFormField
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 16.w),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            DropdownButtonFormField(
                              style: TextStyle(color: Colorconst.cBlack),
                              items: [
                                DropdownMenuItem(
                                  child: Text('Category 1'),
                                  value: 'Category 1',
                                ),
                                DropdownMenuItem(
                                  child: Text('Category 2'),
                                  value: 'Category 2',
                                ),
                              ],
                              onChanged: (value) {
                                // Handle category selection
                              },
                              decoration: InputDecoration(
                                labelText: 'Item Category',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .grey, // Customize the border color
                                    width: 1.5, // Customize the border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0.r), // Optional: round the borders
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .blue, // Customize the border color when focused
                                    width:
                                        2.0, // Customize the border width when focused
                                  ),
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h,
                                    horizontal: 16.w), // Inner padding
                              ),
                            ),
                            SizedBox(height: 20.h),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'HSN/SAC Code',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {
                                    // Handle HSN/SAC search
                                  },
                                ),
                                // Regular border when the field is not focused
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .grey, // Customize the border color
                                    width: 1.5, // Customize the border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0.r), // Round the corners
                                ),
                                // Border when the field is focused
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors
                                        .blue, // Customize the border color when focused
                                    width: 2.0, // Thicker border when focused
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0.r), // Keep rounded corners
                                ),
                                // Optional: disabled border

                                // Padding inside the TextFormField
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 16.w),
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.only(left: 6),
                        child: Column(
                          children: [
                            DefaultTabController(
                              length: 3,
                              child: Column(
                                children: [
                                  TabBar(
                                    labelColor: Colorconst.cRed,
                                    unselectedLabelColor: Colorconst.cBlack,
                                    tabs: [
                                      Tab(text: 'Pricing'),
                                      Tab(text: 'Stock'),
                                      Tab(text: 'Online Store'),
                                    ],
                                  ),
                                  CustomTabViewWidget(
                                    dateController: _dateController,
                                    selectDate: _selectDate,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        color: Colorconst.cwhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 350),
              opacity: 1.0,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Center(
                              child: Text(
                            "Delete",
                            style: interFontGrey(context),
                          )),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Colorconst.cRed,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Center(
                              child: Text(
                            "Edit",
                            style: interFontGrey(context,
                                color: Colorconst.cwhite),
                          )),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
