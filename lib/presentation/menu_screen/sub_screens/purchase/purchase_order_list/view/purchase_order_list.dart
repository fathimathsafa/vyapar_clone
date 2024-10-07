
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:vyapar_clone/core/common/widget/add_button_green.dart';
// import 'package:vyapar_clone/core/constatnts/colors.dart';
// import 'package:vyapar_clone/core/constatnts/images.dart';
// import 'package:vyapar_clone/presentation/menu_screen/controller/menu_controller.dart';




// class PurchaseOrderListScreen extends StatelessWidget {
//   PurchaseOrderListScreen({super.key});

//   final MenuGetController _controller = Get.put(MenuGetController());

//   final List<String> purchaseOrderTabList = [
//     "All",
//     "Open Orders",
//     "Closed Orders",
//   ];
//   final List<Widget> tabWidget =[
//     AllWidget(),

//     Center(child:  Text("Open Orders",style: TextStyle(color: Colors.red,fontSize: 20.sp))),
//     Center(child:  Text("Closed Orders",style: TextStyle(color: Colors.red,fontSize: 20.sp))),


//   ];
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colorconst.cSecondaryBlue,
//       appBar: AppBar(
//           title: "Purchase Order",
//           backgroundColor: Colors.white,
//           iconTextColor: Colors.black),
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             color: Colors.white,
//             child: Padding(
//               padding:  EdgeInsets.only(top: 10.h,left: 10.w),
//               child: Text("Choose to view :",style: TextStyle(color: Colors.black,fontSize: 10.sp),),
//             )),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               width: double.infinity,
//               decoration:const BoxDecoration(
//                   color: Colors.white,
//                  ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
//                 child: Obx(
//                   () {

//                     return Row(
//                       children: List.generate(
//                         purchaseOrderTabList.length,
//                         (index) => Padding(
//                           padding: EdgeInsets.only(right: 12.w),
//                           child: GestureDetector(
//                             onTap: () {
//                               _controller.selectedPurchaseTabIndex.value = index;
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                     24.r,
//                                   ),
//                                   border: Border.all(
//                                       width: 1.w,
//                                       color: index == _controller.selectedPurchaseTabIndex.value
//                                           ? Colorconst.cRed
//                                           : Colorconst.cGrey),
//                                   color: index == _controller.selectedPurchaseTabIndex.value
//                                       ? Colorconst.cffe3eaRedSecondary
//                                       : Colors.white),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 8.w, vertical: 4.h),
//                                 child: Text(
//                                 purchaseOrderTabList[index],
//                                   style: TextStyle(
//                                       fontSize: 11.sp,
//                                       color: index == _controller.selectedPurchaseTabIndex.value
//                                           ? Colorconst.cRed
//                                           : Colors.black),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Obx(
//                () {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   child: tabWidget[_controller.selectedPurchaseTabIndex.value],
//                 );
//               }
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 12.h),
//             child: AddButtonGreen(
//               backgroundColor: Colorconst.cRed,
//               iconBackGroundColor: Colorconst.cRed,
//               icon: Icons.add,
//               iconColor: Colors.white,
//               text: "Add Purchase Return",
//               onTap: () => Get.to(() => AddPurchaseOrderScreen()),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class AllWidget extends StatelessWidget {
//   const AllWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Imageconst().setImage(
//                       imageName: "images-removebg-preview.png",
//                       width: double.infinity,
//                       hieght: 100.h),
                
//                   SizedBox(
//                     height: 14.h,
//                   ),
//                   Text(
//                     "Hey! You have no orders yet. Please add your purchase order here",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 14.sp,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                 ],
//               );
//   }
// }
