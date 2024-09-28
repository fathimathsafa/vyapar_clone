
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:vyapar_clone/core/constatnts/colors.dart';
// import 'package:vyapar_clone/core/constatnts/images.dart';

// import '../../widget/add_button_green.dart';
// import '../../widget/app_bar_widget.dart';
// import 'add_payment_out_screen.dart';

// class PaymentListScreen extends StatelessWidget {
//   PaymentListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: appBar(
//           title: "All Transactions",
//           backgroundColor: Colorconst.c0a7aa7Blue,
//           iconTextColor: Colors.white),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Imageconst().setImage(
//                 imageName: "images-removebg-preview.png",
//                 width: double.infinity,
//                 hieght: 100.h),
//             Text(
//               "Add your 1st Payment Out",
//               style: TextStyle(
//                   fontSize: 15.sp,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 14.h,
//             ),
//             Text(
//               "Record payment given to your parties & easily link them to purchase bills",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 14.sp,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             AddButtonGreen(
//               onTap: () => Get.to(() => AddPaymentOutScreen()),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
