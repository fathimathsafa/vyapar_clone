import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w), // Use ScreenUtil for width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h), // Use ScreenUtil for height
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sale Price",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp, // Use ScreenUtil for font size
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.h), // Use ScreenUtil for height
              Divider(
                height: 1.h, // Use ScreenUtil for height
                color: Colorconst.cSecondaryGrey,
              ),
              SizedBox(height: 23.h), // Use ScreenUtil for height
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
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  "Without Tax",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize:
                                        13.sp, // Use ScreenUtil for font size
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                    width: 8.w), // Use ScreenUtil for width
                                Transform.rotate(
                                  angle: -1.55,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 12,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Use ScreenUtil for height
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
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  "Percentage",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize:
                                        13.sp, // Use ScreenUtil for font size
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                    width: 8.w), // Use ScreenUtil for width
                                Transform.rotate(
                                  angle: -1.55,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 12,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Use ScreenUtil for height
              Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 20.sp, // Use ScreenUtil for size
                    color: Colorconst.cBlue,
                  ),
                  SizedBox(width: 10.w), // Use ScreenUtil for width
                  Text(
                    "Add Wholesale Price",
                    style: TextStyle(
                      color: Colorconst.cBlue,
                      fontSize: 13.sp, // Use ScreenUtil for font size
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 7.w), // Use ScreenUtil for width
                  CircleAvatar(
                    radius: 6.r, // Use ScreenUtil for radius
                    backgroundColor: Colors.grey[350],
                    child: Icon(
                      FontAwesomeIcons.crown,
                      size: 7.sp, // Use ScreenUtil for size
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h), // Use ScreenUtil for height
            ],
          ),
        ),
        Container(
          height: 10.h, // Use ScreenUtil for height
          width: double.infinity,
          color: Colorconst.cSecondaryBlue,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w), // Use ScreenUtil for width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h), // Use ScreenUtil for height
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Purchase Price",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp, // Use ScreenUtil for font size
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.h), // Use ScreenUtil for height
              Divider(
                height: 1.h, // Use ScreenUtil for height
                color: Colorconst.cSecondaryGrey,
              ),
              SizedBox(height: 23.h), // Use ScreenUtil for height
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
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  "Without Tax",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize:
                                        13.sp, // Use ScreenUtil for font size
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                    width: 8.w), // Use ScreenUtil for width
                                Transform.rotate(
                                  angle: -1.55,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 12,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Use ScreenUtil for height
            ],
          ),
        ),
        Container(
          height: 10.h, // Use ScreenUtil for height
          width: double.infinity,
          color: Colorconst.cSecondaryBlue,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w), // Use ScreenUtil for width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h), // Use ScreenUtil for height
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Taxes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp, // Use ScreenUtil for font size
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.h), // Use ScreenUtil for height
              Divider(
                height: 1.h, // Use ScreenUtil for height
                color: Colorconst.cSecondaryGrey,
              ),
              SizedBox(height: 23.h), // Use ScreenUtil for height
              Stack(
                children: [
                  CustomTextFormField(
                    labelText: "GST",
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
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  "Percentage",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize:
                                        13.sp, // Use ScreenUtil for font size
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                    width: 8.w), // Use ScreenUtil for width
                                Transform.rotate(
                                  angle: -1.55,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 12,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Use ScreenUtil for height
            ],
          ),
        ),
      ],
    );
  }
}
