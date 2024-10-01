import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';


import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/bottom_button_mange_item_widget.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/manage_item_textformfield.dart';


class AddItemsScreen extends StatefulWidget {
  @override
  State<AddItemsScreen> createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        title: const Text("Add Item"),
        actions: [
          Icon(
            Icons.add_a_photo_outlined,
            color: Colorconst.cBlue,
            size: 22.sp,
          ),
          SizedBox(
            width: 16.w,
          ),
          Icon(
            Icons.settings_outlined,
            color: Colors.black54,
            size: 24.sp,
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .5),
              child: Column(
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              const SizedBox(),
                              Text(
                                "Product",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.toggle_off,
                                color: Colorconst.cBlue,
                                size: 34.sp,
                              ),
                              Text(
                                "Services",
                                style: TextStyle(
                                  color: Colorconst.cGrey,
                                  fontSize: 13.sp,
                                ),
                              ),
                              const SizedBox(),
                              const SizedBox(),
                            ],
                          ),
                        ),
                        Container(
                            color: Colorconst.cSecondaryBlue,
                            width: double.infinity,
                            height: screenHeight * 0.01),
                        Container(
                          // height: screenHeight * 0.33,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03),
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.03),
                              Stack(
                                children: [
                                  ManageItemCustomTextFormField(
                                    labelText: "Item Name *",
                                    hintText: "Enter item name",
                                    onChanged: (value) {
                                      double parsedValue =
                                          value.toString() != "" ? 1.0 : 0.0;
                                      totalAmountNotifier.value = parsedValue;
                                      if (isReceivedChecked.value) {
                                        receivedAmountNotifier.value =
                                            parsedValue;
                                      }
                                    },
                                  ),
                                  Positioned(
                                    right: 5.w,
                                    top: 0,
                                    bottom: 0,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colorconst.cSecondaryBlue,
                                            borderRadius:
                                                BorderRadius.circular(24.r)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Center(
                                              child: Text(
                                            "Select Unit",
                                            style: TextStyle(
                                                color: Colorconst.cBlue,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500),
                                          )),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: screenHeight * 0.005),

                  ValueListenableBuilder<double>(
                    valueListenable: totalAmountNotifier,
                    builder: (context, totalAmount, child) {
                      return Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            if (totalAmount > 0) ...[
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Stack(
                                  children: [
                                    CustomTextFormField(
                                      labelText: "Item code / Barcode",
                                      hintText: "Item code / Barcode",
                                    ),
                                    Positioned(
                                      right: 5.w,
                                      top: 0,
                                      bottom: 0,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6.h),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colorconst.cSecondaryBlue,
                                              borderRadius:
                                                  BorderRadius.circular(24.r)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Center(
                                                child: Text(
                                              "Assign Code",
                                              style: TextStyle(
                                                  color: Colorconst.cBlue,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 20.h),
                                child: ManageItemCustomTextFormField(
                                  isEditable: false,
                                  labelText: "Item Category",
                                  suffixIconWidget: Icon(
                                    Icons.arrow_drop_down,
                                    size: 24.sp,
                                    color: Colors.black54,
                                  ),
                                  // hintText: "Enter item name",
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w,
                                    right: 10.w,
                                    top: 20.h,
                                    bottom: 10.h),
                                child: ManageItemCustomTextFormField(
                                  labelText: "HSN/SAC Code",
                                  suffixIconWidget: Icon(
                                    Icons.search_outlined,
                                    size: 24.sp,
                                    color: Colorconst.cBlue,
                                  ),
                                  // hintText: "Enter item name",
                                ),
                              ),
                              Container(
                                height: 10.h,
                                width: double.infinity,
                                color: Colorconst.cSecondaryBlue,
                              ),
                              TabBar(
                                controller: _tabController,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorColor: Colorconst.cRed,
                                labelColor: Colorconst.cRed,
                                unselectedLabelColor: Colors.black54,
                                tabs: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: Text(
                                      "Pricing",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    "Stock",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Online Store",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 525.h,
                                child: TabBarView(
                                  controller: _tabController,
                                  children:const <Widget>[
                                     PricingView(),
                                     StockView(),
                                   OnlineStoreView()
                                  ],
                                ),
                              )
                            ],
                        
                        
                            if(totalAmount <1)...[
                               SizedBox(height: 200.h,)
                            ]
                          ],
                        ),
                      );
                    },
                  ),
                 
                ],
                
              ),
            ),
          ),
          // Positioned text above the bottom button

          // Bottom button fixed at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomButtonManageItem( saveBackGroundClr: Colorconst.cRed,isOnlyTwoButtons: true,),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double dashWidth = 5, dashSpace = 3, startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sale Price",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 1.h,
                color: Colorconst.cSecondaryGrey,
              ),
              SizedBox(
                height: 23.h,
              ),
              Stack(
                children: [
                  CustomTextFormField(
                    labelText: "Sale Price",
                    // hintText: "Enter item name",
                  ),
                  Positioned(
                    right: 5.w,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colorconst.cSecondaryGrey,
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                              child: Row(
                            children: [
                              Text(
                                "Without Tax",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Transform.rotate(
                                  angle: -1.55,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 12,
                                    color: Colors.black45,
                                  ))
                            ],
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  CustomTextFormField(
                    labelText: "Disc On Sale Price",
                    // hintText: "Enter item name",
                  ),
                  Positioned(
                    right: 5.w,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colorconst.cSecondaryGrey,
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                              child: Row(
                            children: [
                              Text(
                                "Percentage",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Transform.rotate(
                                  angle: -1.55,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 12,
                                    color: Colors.black45,
                                  ))
                            ],
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 20.sp,
                    color: Colorconst.cBlue,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Add Wholesale Price",
                    style: TextStyle(
                        color: Colorconst.cBlue,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  CircleAvatar(
                    radius: 6.r,
                    backgroundColor: Colors.grey[350],
                    child: Icon(
                      FontAwesomeIcons.crown,
                      size: 7.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
        Container(
          height: 10.h,
          width: double.infinity,
          color: Colorconst.cSecondaryBlue,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Purchase Price",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 1.h,
                color: Colorconst.cSecondaryGrey,
              ),
              SizedBox(
                height: 23.h,
              ),
              Stack(
                children: [
                  CustomTextFormField(
                    labelText: "Purchase Price",
                    // hintText: "Enter item name",
                  ),
                  Positioned(
                    right: 5.w,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colorconst.cSecondaryGrey,
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                              child: Row(
                            children: [
                              Text(
                                "Without Tax",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Transform.rotate(
                                  angle: -1.55,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 12,
                                    color: Colors.black45,
                                  ))
                            ],
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        Container(
          height: 10.h,
          width: double.infinity,
          color: Colorconst.cSecondaryBlue,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Taxes",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 1.h,
                color: Colorconst.cSecondaryGrey,
              ),
              SizedBox(
                height: 23.h,
              ),
              ManageItemCustomTextFormField(
                // isEditable: false,
                labelText: "Tax Rate",
                hintText: "None",
                suffixIconWidget: Icon(
                  Icons.arrow_drop_down,
                  size: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StockView extends StatelessWidget {
  const StockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 23.h,
              ),
              CustomTextFormField(
                labelText: "Opening Stock \$",
                hintText: "Ex : 300",
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: ManageItemCustomTextFormField(
                      isEditable: false,
                      labelText: "As of Date",
                      hintText: "25/09/2024",
                      suffixIconWidget: Icon(
                        Icons.calendar_month_outlined,
                        size: 16.sp,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      // isEditable: false,
                      labelText: "As Price/Unit \$",
                      hintText: "Ex : 2,000",
                     
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      
                      labelText: "Min Stock Qty \$",
                      hintText: "Ex : 5",
                     
                    ),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      
                      labelText: "Item Location",
                      hintText: "Item Location",
                      
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
class OnlineStoreView extends StatelessWidget {
  const OnlineStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 23.h,
              ),
              ManageItemCustomTextFormField(
                labelText: "Online Store Item Price",
                hintText: "Online Store Item Price",
                suffixIconWidget: Icon(Icons.error_outline_outlined,size: 17.sp,color: Colors.black54,),
              ),
              SizedBox(
                height: 20.h,
              ),

               ManageItemCustomTextFormField(
                labelText: "Online Store Item Description",
                hintText: "Online Store Item Description",
                suffixIconWidget: Icon(Icons.error_outline_outlined,size: 17.sp,color: Colors.black54,),
              )
             
            ],
          ),
        ),
      ],
    );
  }
}