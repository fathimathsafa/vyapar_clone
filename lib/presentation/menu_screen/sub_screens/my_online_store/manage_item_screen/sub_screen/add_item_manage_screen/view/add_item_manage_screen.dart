import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/bottom_button_mange_item_widget.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/manage_item_textformfield.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/online_store_view.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/pricing_view.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/stock_view.dart';

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
                  SizedBox(height: 1.h),
                  _buildProductServicesHeader(),
                  _buildItemForm(screenWidth, screenHeight),
                  _buildTotalAmountSection(totalAmountNotifier),
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
            child: BottomButtonManageItem(
              saveBackGroundClr: Colorconst.cRed,
              isOnlyTwoButtons: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductServicesHeader() {
    return Container(
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
              fontWeight: FontWeight.w500,
            ),
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
    );
  }

  Widget _buildItemForm(double screenWidth, double screenHeight) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.03),
          _buildItemNameField(),
        ],
      ),
    );
  }

  Widget _buildItemNameField() {
    return Stack(
      children: [
        ManageItemCustomTextFormField(
          labelText: "Item Name *",
          hintText: "Enter item name",
          onChanged: (value) {
            double parsedValue = value.toString() != "" ? 1.0 : 0.0;
            totalAmountNotifier.value = parsedValue;
            if (isReceivedChecked.value) {
              receivedAmountNotifier.value = parsedValue;
            }
          },
        ),
        Positioned(
          right: 5.w,
          top: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: _buildSelectUnitButton(),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectUnitButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colorconst.cSecondaryBlue,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(
          child: Text(
            "Select Unit",
            style: TextStyle(
              color: Colorconst.cBlue,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalAmountSection(ValueNotifier<double> totalAmountNotifier) {
    return ValueListenableBuilder<double>(
      valueListenable: totalAmountNotifier,
      builder: (context, totalAmount, child) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              if (totalAmount > 0) ...[
                SizedBox(height: 30.h),
                _buildItemCodeField(),
                _buildItemCategoryField(),
                _buildHsnSacCodeField(),
                _buildTabBar(),
                _buildTabBarView(),
              ] else ...[
                SizedBox(height: 200.h),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemCodeField() {
    return Padding(
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
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: _buildAssignCodeButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignCodeButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colorconst.cSecondaryBlue,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(
          child: Text(
            "Assign Code",
            style: TextStyle(
              color: Colorconst.cBlue,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemCategoryField() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
      child: ManageItemCustomTextFormField(
        isEditable: false,
        labelText: "Item Category",
        suffixIconWidget: Icon(
          Icons.arrow_drop_down,
          size: 24.sp,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildHsnSacCodeField() {
    return Padding(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 10.h),
      child: ManageItemCustomTextFormField(
        labelText: "HSN/SAC Code",
        suffixIconWidget: Icon(
          Icons.search_outlined,
          size: 24.sp,
          color: Colorconst.cBlue,
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colorconst.cRed,
      labelColor: Colorconst.cRed,
      unselectedLabelColor: Colors.black54,
      tabs: [
        _buildTab("Pricing"),
        _buildTab("Stock"),
        _buildTab("Online Store"),
      ],
    );
  }

  Widget _buildTab(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return SizedBox(
      height: 525.h,
      child: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          PricingView(),
          StockView(),
          OnlineStoreView(),
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
