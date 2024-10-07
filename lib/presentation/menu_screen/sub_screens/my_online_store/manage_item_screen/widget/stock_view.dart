import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/manage_item_textformfield.dart';

class StockView extends StatelessWidget {
  const StockView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // Set your design screen size
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w), // Use ScreenUtil for padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h), // Use ScreenUtil for height
              SizedBox(height: 23.h), // Use ScreenUtil for height
              CustomTextFormField(
                labelText: "Opening Stock \$",
                hintText: "Ex : 300",
              ),
              SizedBox(height: 20.h), // Use ScreenUtil for height
              Row(
                children: [
                  Expanded(
                    child: ManageItemCustomTextFormField(
                      isEditable: false,
                      labelText: "As of Date",
                      hintText: "25/09/2024",
                      suffixIconWidget: Icon(
                        Icons.calendar_month_outlined,
                        size: 16.sp, // Use ScreenUtil for icon size
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  SizedBox(width: 13.w), // Use ScreenUtil for width
                  Expanded(
                    child: CustomTextFormField(
                      // isEditable: false,
                      labelText: "As Price/Unit \$",
                      hintText: "Ex : 2,000",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Use ScreenUtil for height
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      labelText: "Min Stock Qty \$",
                      hintText: "Ex : 5",
                    ),
                  ),
                  SizedBox(width: 13.w), // Use ScreenUtil for width
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
