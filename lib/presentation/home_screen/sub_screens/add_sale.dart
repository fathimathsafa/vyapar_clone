import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_item.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/zigzag_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSaleInvoiceScreen extends StatefulWidget {
  AddSaleInvoiceScreen({super.key});

  @override
  State<AddSaleInvoiceScreen> createState() => _AddSaleInvoiceScreenState();
}

class _AddSaleInvoiceScreenState extends State<AddSaleInvoiceScreen> {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Sale",
          style: TextStyle(color: Colorconst.cBlack),
        ),
        actions: [
          ToggleSwitch(
            minHeight: 28.h,
            minWidth: 58.w,
            cornerRadius: 20.r,
            activeBgColors: [
              [Colors.green[800]!],
              [Colors.red[800]!]
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            initialLabelIndex: selectedIndex,
            totalSwitches: 2,
            labels: const ['Credit', 'Cash'],
            radiusStyle: true,
            onToggle: (index) {
              setState(() {
                selectedIndex = index!; // Update the selected index
              });
              // print('switched to: $index');
            },
          ),
          SizedBox(width: 10.w),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
          SizedBox(width: 10.w),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 500.h),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        DateInvoiceWidget(invoiceNumber: "10120"),
                        SizedBox(height: 10.h),
                        Container(
                          height: 240.h,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              SizedBox(height: 20.h),
                              CustomTextFormField(
                                labelText: selectedIndex == 0
                                    ? "Customer *"
                                    : "Billing Name *", // Change label based on toggle
                                hintText: selectedIndex == 0
                                    ? "Enter Customer"
                                    : "Enter Billing Name", // Change hint accordingly
                              ),
                              SizedBox(height: 25.h),
                              CustomTextFormField(
                                keyboardType: TextInputType.number,
                                labelText: "Phone Number",
                                hintText: "Enter Phone Number",
                              ),
                              SizedBox(height: 20.h),
                              AddItemButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddItemSaleScreen()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colorconst.cBlack,
                            fontSize: 15.sp,
                          ),
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
                  ValueListenableBuilder<double>(
                    valueListenable: totalAmountNotifier,
                    builder: (context, totalAmount, child) {
                      return Column(
                        children: [
                          if (totalAmount > 0) ...[
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
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
                                          children: [
                                            Container(
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: isChecked
                                                    ? Colors.blue
                                                    : Colors.transparent,
                                              ),
                                              child: isChecked
                                                  ? const Icon(Icons.check,
                                                      color: Colors.white,
                                                      size: 18)
                                                  : null,
                                            ),
                                            SizedBox(width: screenWidth * .01),
                                            const Text("Received",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colorconst.cBlack)),
                                            SizedBox(width: screenWidth * .5),
                                            SizedBox(
                                              width: screenWidth * 0.25,
                                              child: Stack(children: [
                                                Positioned(
                                                  left: 0,
                                                  right: 0,
                                                  bottom: screenHeight * 0.001,
                                                  child: CustomPaint(
                                                    painter:
                                                        DottedLinePainter(),
                                                  ),
                                                ),
                                                ValueListenableBuilder<double>(
                                                  valueListenable:
                                                      receivedAmountNotifier,
                                                  builder: (context,
                                                      receivedAmount, child) {
                                                    return TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: "₹",
                                                        border:
                                                            InputBorder.none,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left:
                                                                    screenWidth *
                                                                        0.025),
                                                      ),
                                                      onChanged: (value) {
                                                        double parsedValue =
                                                            double.tryParse(
                                                                    value) ??
                                                                0.0;
                                                        receivedAmountNotifier
                                                                .value =
                                                            parsedValue;
                                                      },
                                                      style: TextStyle(
                                                          fontSize:
                                                              screenWidth *
                                                                  0.04,
                                                          color: Colorconst
                                                              .cBlack),
                                                      initialValue:
                                                          isReceivedChecked
                                                                  .value
                                                              ? totalAmount
                                                                  .toString()
                                                              : '',
                                                    );
                                                  },
                                                ),
                                              ]),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Padding(
                              padding: EdgeInsets.only(left: screenWidth * .03),
                              child: ValueListenableBuilder<double>(
                                valueListenable: receivedAmountNotifier,
                                builder: (context, receivedAmount, child) {
                                  double balanceDue =
                                      totalAmount - receivedAmount;
                                  return Row(
                                    children: [
                                      const Text("Balance Due",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14)),
                                      SizedBox(width: screenWidth * .53),
                                      Text("₹ ",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              color: Colorconst.cBlack)),
                                      Text(balanceDue.toStringAsFixed(2),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: screenWidth * 0.03))
                                    ],
                                  );
                                },
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
                            SizedBox(height: screenHeight * .01),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: screenHeight * .25,
                              color: Colorconst.cwhite,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Payment Type",
                                        style:
                                            TextStyle(color: Colorconst.cGrey),
                                      ),
                                      SizedBox(
                                        width: screenWidth * .45,
                                      ),
                                      const Icon(
                                        Icons.money,
                                        color: Colorconst.Green,
                                      ),
                                      // SizedBox(
                                      //   width: screenWidth * .01,
                                      // ),
                                      const Text("Cash"),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * .04,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(Icons.add, color: Colorconst.cBlue),
                                      Text(
                                        "Add Payment Type",
                                        style:
                                            TextStyle(color: Colorconst.cBlue),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const Text(
                                        "State of Supply",
                                        style:
                                            TextStyle(color: Colorconst.cGrey),
                                      ),
                                      SizedBox(
                                        width: screenWidth * .4,
                                      ),
                                      const Text("Select State"),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * .01),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
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
                                  padding: const EdgeInsets.all(10),
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
                                    child: const Center(
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
                            Container(
                              height: screenHeight * .2,
                              width: double.infinity,
                              color: Colors.white,
                              child: Center(
                                child: Container(
                                    height: screenHeight * .15,
                                    width: screenWidth * .8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey)),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // Your onPressed logic
                                      },
                                      style: ButtonStyle(
                                        side: WidgetStateProperty.all(
                                            const BorderSide(
                                                color: Colors.black, width: 2)),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: screenWidth * .1),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.document_scanner_outlined,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              'Add Your Documents',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Positioned text above the bottom button
          Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Container(
              color: Colorconst.cLightPink,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Current Plan May not support some features",
                    style: interFontGrey(context, fontsize: 12),
                    // textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: screenWidth * 0.020,
                    color: Colorconst.cGrey,
                  )
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
