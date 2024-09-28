
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import 'package:vyapar_clone/core/common/widget/bottom_button.dart';

// import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
// import 'package:vyapar_clone/core/constatnts/colors.dart';


// import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
// import 'package:vyapar_clone/presentation/home_screen/widget/zigzag_widget.dart';



// class AddPaymentOutScreen extends StatelessWidget {
//   final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);
//   final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);
//   final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);

//   @override
//   Widget build(BuildContext context) {
//     // Get screen size using MediaQuery
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colorconst.cSecondaryGrey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(onPressed: ()=> Get.back(), icon:const Icon(Icons.arrow_back)),
//         title:const Text("Payment-Out"),
//         actions: [Icon(Icons.settings_outlined,color: Colors.black54,size: 24.sp,),SizedBox(width: 10.w,)],
       
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.only(bottom: screenHeight * .5),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     child: Column(
//                       children: [
//                         DateInvoiceWidget(invoiceNumber: "10120",titleOne:  "Return No.",titleTwo: "Date",),
//                         SizedBox(height: screenHeight * 0.01),
//                         Container(
//                           height: screenHeight * 0.18,
//                           color: Colors.white,
//                           padding: EdgeInsets.symmetric(
//                               horizontal: screenWidth * 0.03),
//                           child: Column(
//                             children: [
//                               SizedBox(height: screenHeight * 0.01),
//                               CustomTextFormField(
//                                 labelText: "Party Name *",
//                                 hintText: "Enter party name",
//                               ),
//                               SizedBox(height: screenHeight * 0.03),
//                               CustomTextFormField(
//                                 labelText: "Bill No",
//                                 hintText: "Enter bill no.",
//                               ),
                             
//                               SizedBox(height: screenHeight * 0.03),
                             
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.005),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.04,
//                       vertical: screenHeight * 0.02,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Paid",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                             fontSize: 14.sp,
//                           ),
//                         ),
//                         SizedBox(
//                           width: screenWidth * 0.25,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 left: 0,
//                                 right: 0,
//                                 bottom: screenHeight * 0.001,
//                                 child: CustomPaint(
//                                   painter: DottedLinePainter(),
//                                 ),
//                               ),
//                               TextFormField(
//                                 keyboardType: TextInputType.number,
                                
//                                 decoration: InputDecoration(
//                                   hintText: "₹",
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.only(
//                                     left: screenWidth * 0.025,
//                                   ),
//                                 ),
//                                 onChanged: (value) {
//                                   double parsedValue =
//                                       double.tryParse(value) ?? 0.0;
//                                   totalAmountNotifier.value = parsedValue;
//                                   if (isReceivedChecked.value) {
//                                     receivedAmountNotifier.value = parsedValue;
//                                   }
//                                 },
//                                 style: TextStyle(fontSize: screenWidth * 0.04,color: Colors.black),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   ValueListenableBuilder<double>(
//                     valueListenable: totalAmountNotifier,
//                     builder: (context, totalAmount, child) {
//                       return Column(
//                         children: [
//                           if (totalAmount > 0) ...[
                        
//                             SizedBox(height: screenHeight * 0.01),
//                             Padding(
//                               padding: EdgeInsets.only(left: screenWidth * .03,bottom: 6.h),
//                               child: ValueListenableBuilder<double>(
//                                 valueListenable: receivedAmountNotifier,
//                                 builder: (context, receivedAmount, child) {
//                                   double balanceDue =
//                                       totalAmount - receivedAmount;
//                                   return Row(
//                                     children: [
//                                        SizedBox(width: 5.w,),
//                                      const Text("Balance Due",
//                                           style: TextStyle(
//                                               color: Colors.green,
//                                               fontSize: 14)),
//                                       // SizedBox(width: screenWidth * .53),
//                                        Expanded(child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [

//                                          Text("₹ ",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                               fontSize: screenWidth * 0.04)),
//                                               SizedBox(width: 48.w,),
//                                       Text(balanceDue.toStringAsFixed(2),
//                                           style: TextStyle(
//                                               color: Colors.green,
//                                               fontSize: screenWidth * 0.03)),
//                                               SizedBox(width: 15.w,)
//                                        ],))
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                             ClipPath(
//                               clipper: ZigzagClipper(),
//                               child: Container(
//                                 color: Colors.white,
//                                 height: screenHeight * .02,
//                                 width: double.infinity,
//                               ),
//                             ),
//                             SizedBox(height: screenHeight * .01),
//                             Container(
//                               padding: EdgeInsets.all(10),
//                               height: screenHeight * .12,
//                               color: Colorconst.cwhite,
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                      const Text(
//                                         "Payment Type",
//                                         style:
//                                             TextStyle(color: Colorconst.cGrey),
//                                       ),
//                                       SizedBox(
//                                         width: screenWidth * .45,
//                                       ),
//                                      const Icon(
//                                         Icons.money,
//                                         color: Colorconst.Green,
//                                       ),
//                                       // SizedBox(
//                                       //   width: screenWidth * .01,
//                                       // ),
//                                       SizedBox(width: 5.w,),
//                                      const Text("Cash",style: TextStyle(color: Colors.black),),
//                                    const   Icon(Icons.arrow_drop_down),
//                                    SizedBox(width: 6.w,),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: screenHeight * .02,
//                                   ),
//                                const   Row(
//                                     children: [
//                                       Icon(Icons.add, color: Colorconst.cBlue),
//                                       Text(
//                                         "Add Payment Type",
//                                         style:
//                                             TextStyle(color: Colorconst.cBlue),
//                                       ),
//                                     ],
//                                   ),
                                
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: screenHeight * .01),
//                             Container(
//                                color: Colorconst.cwhite,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     padding:const EdgeInsets.all(10),
//                                     height: screenHeight * .18,
//                                     width: screenWidth * .7,
//                                     color: Colorconst.cwhite,
//                                     child: Center(
//                                       child: TextFormField(
//                                         decoration: const InputDecoration(
//                                           labelText: 'Description',
//                                           hintText: 'Add Note',
//                                           border: OutlineInputBorder(),
//                                         ),
//                                         maxLines: 3,
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     // padding: EdgeInsets.all(10),
//                                     // height: screenHeight * .18,
//                                     height: screenHeight * .11,
//                                     width: screenWidth * .27,
//                                     color: Colorconst.cwhite,
//                                     child: Container(
//                                       width: 60,
//                                       height: 10,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(8.0),
//                                         border: Border.all(color: Colors.grey),
//                                       ),
//                                       child:const Center(
//                                         child: Icon(
//                                           Icons.add_a_photo,
//                                           color: Colors.blue,
//                                           size: 30,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(width: 5.w,)
                                 
//                                 ],
//                               ),
//                             ),
                           
                            
//                           ],
//                         ],
//                       );
//                     },
//                   ),
               
               
//                SizedBox(height: 100.h,)
//                 ],
//               ),
//             ),
//           ),
//           // Positioned text above the bottom button
          
//           // Bottom button fixed at the bottom
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: BottomButton(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DottedLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 1
//       ..style = PaintingStyle.stroke;

//     double dashWidth = 5, dashSpace = 3, startX = 0;
//     while (startX < size.width) {
//       canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
//       startX += dashWidth + dashSpace;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
