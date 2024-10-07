import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
// import 'package:vyapar_clone/presentation/dash_board_screen/view/dash_board_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/dash_board_screen.dart/view/dash_board_screen.dart';

class OnlineOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 30.0.h),
      child: Column(
        children: [
          Image.asset(
            'assets/images/images__3_-removebg-preview.png',
            height: 100.h,
            width: 100.w,
          ),
          SizedBox(height: 20.h),
          Text(
            "No Online Orders",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colorconst.cBlack),
          ),
          SizedBox(height: 10.h),
          Text(
            "Create your online store to get orders online",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colorconst.cGrey,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 40.h),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashBoardOnlineScreen()));
            },
            icon: Icon(
              Icons.store,
              color: Colorconst.cwhite,
              size: 18.sp,
            ),
            label: Text(
              "Create Store",
              style: TextStyle(color: Colorconst.cwhite, fontSize: 14.sp),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: StadiumBorder(),
              minimumSize: Size(150.w, 50.h),
            ),
          ),
        ],
      ),
    );
  }
}
