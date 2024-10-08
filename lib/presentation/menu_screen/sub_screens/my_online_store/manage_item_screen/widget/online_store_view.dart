import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_item_screen/widget/manage_item_textformfield.dart';

class OnlineStoreView extends StatelessWidget {
  const OnlineStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w), // Use ScreenUtil for width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h), // Use ScreenUtil for height
              SizedBox(height: 23.h), // Use ScreenUtil for height
              ManageItemCustomTextFormField(
                labelText: "Online Store Item Price",
                hintText: "Online Store Item Price",
                suffixIconWidget: Icon(
                  Icons.error_outline_outlined,
                  size: 17.sp, // Use ScreenUtil for size
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20.h), // Use ScreenUtil for height
              ManageItemCustomTextFormField(
                labelText: "Online Store Item Description",
                hintText: "Online Store Item Description",
                suffixIconWidget: Icon(
                  Icons.error_outline_outlined,
                  size: 17.sp, // Use ScreenUtil for size
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
