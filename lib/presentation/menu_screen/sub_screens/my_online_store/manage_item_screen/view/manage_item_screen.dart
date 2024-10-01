import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/add_button_green.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/sub_screen/add_item_manage_screen/view/add_item_manage_screen.dart';

// ignore: must_be_immutable
class ManageItemScreen extends StatelessWidget {
  int index = 1;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        title: Text(
          "Manage Items",
          style: TextStyle(color: Colorconst.cBlack),
        ),
        actions: [
          Icon(
            Icons.temple_buddhist_outlined,
            color: Colors.black54,
            size: 20.sp,
          ),
          SizedBox(
            width: 10.w,
          ),
          Icon(
            Icons.more_vert_outlined,
            color: Colors.black54,
            size: 24.sp,
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Column(
        children: [
          Divider(
            height: 1.w,
            color: Colorconst.cSecondaryGrey,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              24.r,
                            ),
                            border: Border.all(
                                width: 1.w,
                                color: 0 == selectedIndex
                                    ? Colorconst.cRed
                                    : Colorconst.cGrey),
                            color: 0 == selectedIndex
                                ? Colorconst.cffe3eaRedSecondary
                                : Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Text(
                            "+ Category ",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: 0 == selectedIndex
                                    ? Colorconst.cRed
                                    : Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Container(
                        height: 20.h,
                        width: 1.w,
                        color: Colorconst.cSecondaryGrey,
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              24.r,
                            ),
                            border: Border.all(
                                width: 1.w,
                                color: 1 == selectedIndex
                                    ? Colorconst.cRed
                                    : Colorconst.cGrey),
                            color: 1 == selectedIndex
                                ? Colorconst.cffe3eaRedSecondary
                                : Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Text(
                            "All",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: 1 == selectedIndex
                                    ? Colorconst.cRed
                                    : Colors.black),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Container(
              // height: 35.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
              ),

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_outlined,
                      size: 24.sp,
                      color: Colorconst.cBlue,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            hintText: "Search Items",
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Container(
                      height: 20.h,
                      width: 1.w,
                      color: Colorconst.cSecondaryGrey,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.filter_list_outlined,
                      color: Colorconst.cBlue,
                      size: 24.sp,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 6.h, bottom: 6.h),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colorconst.cSecondaryBlue,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Padding(
                          padding: EdgeInsets.all(17.r),
                          child: Icon(
                            Icons.add,
                            size: 24.sp,
                            color: Colorconst.cBlue,
                          ),
                        )),
                    SizedBox(
                      width: 12.w,
                    ),
                    SizedBox(
                      height: 50.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Web",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "₹ 10,000.00",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.more_vert_outlined,
                              color: Colorconst.cGrey,
                              size: 20.sp,
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "In Stock",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Icon(
                                  Icons.toggle_on_outlined,
                                  color: Colorconst.cBlue,
                                  size: 35.sp,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: AddButtonGreen(
              backgroundColor: Colorconst.cRed,
              iconBackGroundColor: Colorconst.cRed,
              icon: Icons.add,
              iconColor: Colors.white,
              text: "Add Items",
              onTap: () => Get.to(() => AddItemsScreen()),
            ),
          )
        ],
      ),
    );
  }
}
