
// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vyapar_clone/core/constatnts/colors.dart';


// class AddButtonGreen extends StatelessWidget {
//   AddButtonGreen(
//       {super.key,
//       this.text,
//       this.icon,
//       this.backgroundColor,
//       this.borderRadius,
//       this.iconBackGroundColor,
//       this.iconColor,
//       this.onTap});
//   final String? text;
//   final IconData? icon;
//   final Color? backgroundColor;
//   final Color? iconColor;
//   final Color? iconBackGroundColor;
//   final double? borderRadius;
//   final Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 24.r),
//                 color: backgroundColor ?? Colorconst.c2c9f1dGreen),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor:iconBackGroundColor?? Colors.white,
//                     radius: 9.r,
//                     child: Icon(
//                       icon ?? Icons.add,
//                       color:iconColor?? Colorconst.c2c9f1dGreen,
//                       size: 15.sp,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8.w,
//                   ),
//                   Text(
//                     text ?? "Give Payments",
//                     style: TextStyle(
//                         fontSize: 10.sp,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
