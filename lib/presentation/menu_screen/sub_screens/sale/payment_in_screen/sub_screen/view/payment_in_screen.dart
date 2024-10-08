import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import 'package:vyapar_clone/presentation/home_screen/widget/zigzag_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/payment_in_screen/widget/receipt_date_widget.dart';

import '../controller/controller.dart';

class PaymentInScreen extends StatelessWidget {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);
  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);
  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);


final _controller = Get.put(PaymentInController());
  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Payment-In",
          style: TextStyle(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .5),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Obx(
                         () {
                            return DateReciptWidget(receiptNumber: "1",date: _controller.selectedDate.value,
                            
                            onTapDate: () => _controller.selctedDate(context),
                            );
                          }
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 180.h,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03),
                          child: Column(
                            children: [
                              SizedBox(height: 20.h),
                              CustomTextFormField(
                                labelText: "Customer *",
                                hintText: "Enter Customer",
                              ),
                              SizedBox(height: 25.h),
                              CustomTextFormField(
                                labelText: "Phone Number",
                                keyboardType: TextInputType.number,
                                hintText: "Enter Phone Number",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recieved",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Colorconst.cBlack),
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 10.h,
                                child: CustomPaint(
                                  painter: DottedLinePainter(),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "₹",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 20.w,
                                  ),
                                ),
                                onChanged: (value) {
                                  double parsedValue =
                                      double.tryParse(value) ?? 0.0;
                                  totalAmountNotifier.value = parsedValue;
                                  if (isReceivedChecked.value) {
                                    receivedAmountNotifier.value = parsedValue;
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colorconst.cBlack),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colorconst.Green,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          width: 140.w,
                        ),
                        Text(
                          "₹",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colorconst.cBlack,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipPath(
                    clipper: ZigzagClipper(),
                    child: Container(
                      color: Colors.white,
                      height: screenHeight * .02,
                      width: double.infinity,
                    ),
                  ),
                  ValueListenableBuilder<double>(
                    valueListenable: totalAmountNotifier,
                    builder: (context, totalAmount, child) {
                      return Column(
                        children: [
                          if (totalAmount > 0) ...[
                            Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * .036),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      isReceivedChecked.value =
                                          !isReceivedChecked.value;
                                      if (isReceivedChecked.value) {
                                        receivedAmountNotifier.value =
                                            totalAmount;
                                      } else {
                                        receivedAmountNotifier.value = 0.0;
                                      }
                                    },
                                    child: ValueListenableBuilder<bool>(
                                      valueListenable: isReceivedChecked,
                                      builder: (context, isChecked, child) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: screenHeight * .159,
                              color: Colorconst.cwhite,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Payment Type",
                                        style:
                                            TextStyle(color: Colorconst.cGrey),
                                      ),
                                      SizedBox(
                                        width: screenWidth * .45,
                                      ),
                                      Icon(
                                        Icons.money,
                                        color: Colorconst.Green,
                                      ),
                                      // SizedBox(
                                      //   width: screenWidth * .01,
                                      // ),
                                      Text("Cash"),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * .04,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.add, color: Colorconst.cBlue),
                                      Text(
                                        "Add Payment Type",
                                        style:
                                            TextStyle(color: Colorconst.cBlue),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * .01),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: screenHeight * .18,
                                  width: screenWidth * .7,
                                  color: Colorconst.cwhite,
                                  child: Center(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Description',
                                        hintText: 'Add Note',
                                        border: OutlineInputBorder(),
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: screenHeight * .18,
                                  width: screenWidth * .29,
                                  color: Colorconst.cwhite,
                                  child: Container(
                                    width: 60,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Bottom button fixed at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomButton(),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double dashWidth = 5, dashSpace = 3, startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
