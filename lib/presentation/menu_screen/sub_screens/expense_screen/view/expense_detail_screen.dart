import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/add_button_green.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/controller/menu_controller.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/expense_screen/sub_screens/add_expense_screen/view/add_expense_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/expense_screen/widget/category_widget.dart';

class ExpenseDetailScreen extends StatelessWidget {
  ExpenseDetailScreen({super.key});

  final MenuGetController _controller = Get.put(MenuGetController());

  final List<String> purchaseOrderTabList = [
    "Categories",
    "Items",
  ];
  final List<Widget> tabWidget = [
    CategoriesScreen(),
    ItemsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Expense",
          style: TextStyle(
            color: Colorconst.cBlack,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.search_outlined,
            size: 23.sp,
            color: Colors.black54,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
                child: Obx(() {
                  return Row(
                    children: List.generate(
                      purchaseOrderTabList.length,
                      (index) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _controller.selectedExpenseTabIndex.value = index;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.w,
                                        color: index ==
                                                _controller
                                                    .selectedExpenseTabIndex
                                                    .value
                                            ? Colorconst.cBlue
                                            : Colors.transparent)),
                                color: index ==
                                        _controller
                                            .selectedExpenseTabIndex.value
                                    ? Colors.white
                                    : Colors.white),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Center(
                                child: Text(
                                  purchaseOrderTabList[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: index ==
                                              _controller
                                                  .selectedExpenseTabIndex.value
                                          ? Colorconst.cBlue
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: tabWidget[_controller.selectedExpenseTabIndex.value],
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: AddButtonGreen(
              backgroundColor: Colorconst.cRed,
              iconBackGroundColor: Colorconst.cRed,
              icon: Icons.add,
              iconColor: Colors.white,
              text: "Add Expenses",
              onTap: () => Get.to(() => AddExpenseScreen()),
            ),
          )
        ],
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Categories> category = [
    Categories(expenseTitle: "Petrol", expenseValue: "₹ 1200.00"),
    Categories(expenseTitle: "Rent", expenseValue: "₹ 12000.00"),
    Categories(expenseTitle: "Salary", expenseValue: "₹ 12.00"),
    Categories(expenseTitle: "Tea", expenseValue: "₹ 12.00"),
    Categories(expenseTitle: "Transport", expenseValue: "₹ 12.00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 6.h,),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1.w, color: Colorconst.cSecondaryGrey))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "₹ 0.00 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colorconst.cBlue,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: category.length,
            itemBuilder: (context, index) =>
                CategoryWidget(obj: category[index]),
          ),
        ),

        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

class ItemsScreen extends StatelessWidget {
  ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 6.h,),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1.w, color: Colorconst.cSecondaryGrey))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "₹ 0.00 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colorconst.cBlue,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

class Categories {
  String? expenseTitle;
  String? expenseValue;
  Categories({this.expenseTitle, this.expenseValue});
}
