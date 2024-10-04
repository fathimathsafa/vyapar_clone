import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/add_item.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/zigzag_widget.dart';

class AddSaleOrdercreen extends StatefulWidget {
  @override
  State<AddSaleOrdercreen> createState() => _AddSaleOrdercreenState();
}

class _AddSaleOrdercreenState extends State<AddSaleOrdercreen> {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);
  String? selectedState;
  List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];
  void _showStateSelectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7, // Adjust size as needed
          maxChildSize: 0.9,
          minChildSize: 0.3,
          builder: (_, controller) {
            return Column(
              children: [
                // Header of Bottom Sheet
                ListTile(
                  title: Text("Select State of Supply"),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: states.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(states[index]),
                        onTap: () {
                          setState(() {
                            selectedState =
                                states[index]; // Update selected state
                          });
                          Navigator.pop(
                              context); // Close the bottom sheet after selecting
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

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
        title: Text("Sale Order"),
        actions: [
          SizedBox(width: screenWidth * 0.02),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
          SizedBox(width: screenWidth * 0.02),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .3),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        DateInvoiceWidget(invoiceNumber: "10120"),
                        SizedBox(height: screenHeight * 0.05),
                        Container(
                          height: screenHeight * 0.37,
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
                              CustomTextFormField(
                                labelText: "Due Date",
                                hintText: "24/09/2024",
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
                  SizedBox(height: screenHeight * 0.10),
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
                                            SizedBox(width: screenWidth * .01),
                                            Text("Advance Amt",
                                                style: TextStyle(fontSize: 14)),
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
                                  GestureDetector(
                                    onTap: () {
                                      _showStateSelectionBottomSheet();
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "State of Supply",
                                          style: TextStyle(
                                              color: Colorconst.cGrey),
                                        ),
                                        SizedBox(
                                          width: screenWidth * .4,
                                        ),
                                        Text("Select State"),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
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
