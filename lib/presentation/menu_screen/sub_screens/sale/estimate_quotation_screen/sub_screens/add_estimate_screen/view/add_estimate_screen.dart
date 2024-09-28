import 'package:flutter/material.dart';

import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/estimate_quotation_screen/sub_screens/add_estimate_item_screen/view/add_estimate_item.dart';

class EstimateQuotationScreen extends StatelessWidget {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);
  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);
  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);

  EstimateQuotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text("Estimate/Quotation"),
        actions: [
          SizedBox(width: screenWidth * 0.02),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
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
                              // SizedBox(height: screenHeight * 0.03),
                              // CustomTextFormField(
                              //   labelText: "Phone Number",
                              //   hintText: "Enter Phone Number",
                              // ),
                              SizedBox(height: screenHeight * 0.03),
                              AddItemButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddEstimateItemScreen()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
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
                                  hintStyle: const TextStyle(color: Colors.black),
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
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: screenHeight * .25,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "State of Supply",
                                        style:
                                            TextStyle(color: Colorconst.cGrey),
                                      ),
                                      SizedBox(
                                        width: screenWidth * .3,
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
                                  padding: const EdgeInsets.all(10),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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