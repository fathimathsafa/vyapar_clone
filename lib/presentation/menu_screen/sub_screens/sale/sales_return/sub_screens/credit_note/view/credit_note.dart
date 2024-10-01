import 'package:flutter/material.dart';

import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_item.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/zigzag_widget.dart';

class CreditNoteScreen extends StatelessWidget {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);
  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);
  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text("Credit Note"),
        actions: [
          // ToggleSwitch(
          //   minHeight: 30,
          //   minWidth: 60.0,
          //   cornerRadius: 20.0,
          //   activeBgColors: [
          //     [Colors.green[800]!],
          //     [Colors.red[800]!]
          //   ],
          //   activeFgColor: Colors.white,
          //   inactiveBgColor: Colors.grey,
          //   inactiveFgColor: Colors.white,
          //   initialLabelIndex: 0,
          //   totalSwitches: 2,
          //   labels: ['Credit', 'Cash'],
          //   radiusStyle: true,
          //   onToggle: (index) {
          //     print('switched to: $index');
          //   },
          // ),
          SizedBox(width: screenWidth * 0.02),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
          SizedBox(width: screenWidth * 0.02),
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
                        DateInvoiceWidget(invoiceNumber: "10120"),
                        SizedBox(height: screenHeight * 0.01),
                        Container(
                          height: screenHeight * 0.3,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03),
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.01),
                              CustomTextFormField(
                                labelText: "Customer *",
                                hintText: "Enter Customer",
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              CustomTextFormField(
                                labelText: "Phone Number",
                                hintText: "Enter Phone Number",
                              ),
                              SizedBox(height: screenHeight * 0.03),
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
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colorconst.cBlack),
                        ),
                        SizedBox(
                          width: screenWidth * 0.25,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: screenHeight * 0.001,
                                child: CustomPaint(
                                  painter: DottedLinePainter(),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "₹",
                                  helperStyle:
                                      TextStyle(color: Colorconst.cBlack),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: screenWidth * 0.025,
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
                                style: TextStyle(fontSize: screenWidth * 0.04),
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
                                          children: [
                                            // Container(
                                            //   width: screenWidth * .038,
                                            //   height: screenHeight * .03,
                                            //   decoration: BoxDecoration(
                                            //     border: Border.all(
                                            //         color: Colors.blue,
                                            //         width: 3),
                                            //     borderRadius:
                                            //         BorderRadius.circular(5),
                                            //     color: isChecked
                                            //         ? Colors.blue
                                            //         : Colors.transparent,
                                            //   ),
                                            //   child: isChecked
                                            //       ? Icon(Icons.check,
                                            //           color: Colors.white,
                                            //           size: 18)
                                            //       : null,
                                            // ),
                                            SizedBox(width: screenWidth * .01),
                                            Text("Paid",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colorconst.cBlack)),
                                            SizedBox(width: screenWidth * .5),
                                            SizedBox(
                                              width: screenWidth * 0.35,
                                              child: Stack(children: [
                                                Positioned(
                                                  left: 53,
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
                                                                        0.11),
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
                                                                  0.04),
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
                                      Text("Balance Due",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14)),
                                      SizedBox(width: screenWidth * .53),
                                      Text("₹ ",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04)),
                                      Text("${balanceDue.toStringAsFixed(2)}",
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
                              padding: EdgeInsets.all(10),
                              height: screenHeight * .25,
                              color: Colors.white,
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
                                        color: Colors.green,
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
                                  Row(
                                    children: [
                                      Text(
                                        "State of Supply",
                                        style:
                                            TextStyle(color: Colorconst.cGrey),
                                      ),
                                      SizedBox(
                                        width: screenWidth * .4,
                                      ),
                                      Text("Select State"),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
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
                                  color: Colors.white,
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
                                  color: Colors.white,
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
                                            BorderSide(
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
                                        child: Row(
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
            bottom: 39,
            left: 0,
            right: 0,
            child: Container(
              color: Colorconst.cLightPink,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
