import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/add_item.dart';
// import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/zigzag_widget.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/expense_screen/widget/date_expense_invoice_widget.dart';

import '../controller/controller.dart';



class AddPurchaseScreen extends StatefulWidget {
  @override
  State<AddPurchaseScreen> createState() => _AddPurchaseScreenState();
}

class _AddPurchaseScreenState extends State<AddPurchaseScreen> {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);
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
  String? selectedState;

  final _controller = Get.put(AddPurchaseController());
  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        title: const Text("Purchase"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .5),
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Obx(
                        () {
                            return DateExpenseInvoiceWidget(
                              invoiceNumber: "10120",
                              titleOne: "Bill No.",
                              titleTwo: "Date",
                               date: _controller.selectedDate.value,
                                              onTapDate:() => _controller.selctedDate(context) ,
                            );
                          }
                        ),
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
                                labelText: "Party Name *",
                                hintText: "Enter party name",
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
                                              AddItemToSale()));
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
                            color: Colors.black,
                            fontSize: 14.sp,
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
                                style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.black),
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
                      if (totalAmount <= 0) return Container();

                      return Column(
                        children: [
                          _buildPaymentRow(context, totalAmount),
                          SizedBox(height: screenHeight * 0.03),
                          _buildBalanceDueRow(),
                          _buildDivider(),
                          SizedBox(height: screenHeight * .01),
                          _buildPaymentDetails(),
                          SizedBox(height: screenHeight * .01),
                          _buildDescriptionAndPhoto(),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Positioned text above the bottom button

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

  Widget _buildPaymentRow(BuildContext context, double totalAmount) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        return Padding(
          padding: EdgeInsets.only(left: screenWidth * .036),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  isReceivedChecked.value = !isReceivedChecked.value;
                  receivedAmountNotifier.value =
                      isReceivedChecked.value ? totalAmount : 0.0;
                },
                child: ValueListenableBuilder<bool>(
                  valueListenable: isReceivedChecked,
                  builder: (context, isChecked, child) {
                    return Row(
                      children: [
                        _buildCheckbox(isChecked),
                        SizedBox(width: screenWidth * .03),
                        const Text("Paid",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        SizedBox(width: screenWidth * .53),
                        _buildReceivedAmountField(totalAmount),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCheckbox(bool isChecked) {
    return Container(
      width: 20.0, // Adjusted to fixed width
      height: 20.0, // Adjusted to fixed height
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(3.0),
        color: isChecked ? Colors.blue : Colors.transparent,
      ),
      child: isChecked
          ? const Center(
              child: Icon(Icons.check, color: Colors.white, size: 13))
          : null,
    );
  }

  Widget _buildReceivedAmountField(double totalAmount) {
    return SizedBox(
      width: 100.0, // Adjusted to fixed width
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 1.0,
            child: CustomPaint(painter: DottedLinePainter()),
          ),
          ValueListenableBuilder<double>(
            valueListenable: receivedAmountNotifier,
            builder: (context, receivedAmount, child) {
              return TextFormField(
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black), // Adjusted to fixed size
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "₹",
                    hintStyle: const TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 5.0)),
                onChanged: (value) {
                  double parsedValue = double.tryParse(value) ?? 0.0;
                  receivedAmountNotifier.value = parsedValue;
                },
                initialValue:
                    isReceivedChecked.value ? totalAmount.toString() : '',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceDueRow() {
    return Padding(
      padding:
          EdgeInsets.only(left: 12.0, bottom: 6.0), // Adjusted to fixed padding
      child: ValueListenableBuilder<double>(
        valueListenable: receivedAmountNotifier,
        builder: (context, receivedAmount, child) {
          double balanceDue = totalAmountNotifier.value - receivedAmount;
          return Row(
            children: [
              const Text("Balance Due",
                  style: TextStyle(color: Colors.green, fontSize: 14)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("₹ ",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                    const SizedBox(width: 48.0),
                    Text(balanceDue.toStringAsFixed(2),
                        style:
                            const TextStyle(color: Colors.green, fontSize: 12)),
                    const SizedBox(width: 15.0),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDivider() {
    return ClipPath(
      clipper: ZigzagClipper(),
      child: Container(
          color: Colors.white,
          height: 20.0,
          width: double.infinity), // Adjusted to fixed height
    );
  }

  Widget _buildPaymentDetails() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 150.0, // Adjusted to fixed height
      color: Colors.white, // Use Colorconst.cwhite if it's defined elsewhere
      child: Column(
        children: [
          _buildPaymentTypeRow(),
          const SizedBox(height: 20.0), // Adjusted to fixed height
          _buildAddPaymentTypeRow(),
          const Divider(),
          _buildStateSelectionRow(),
        ],
      ),
    );
  }

  Widget _buildPaymentTypeRow() {
    return Row(
      children: [
        const Text("Payment Type",
            style: TextStyle(
                color: Colors
                    .grey)), // Use Colorconst.cGrey if it's defined elsewhere
        const SizedBox(width: 100.0), // Adjusted to fixed width
        const Icon(Icons.money,
            color:
                Colors.green), // Use Colorconst.Green if it's defined elsewhere
        const Text("Cash"),
        const Icon(Icons.arrow_drop_down),
      ],
    );
  }

  Widget _buildAddPaymentTypeRow() {
    return const Row(
      children: [
        Icon(Icons.add,
            color:
                Colors.blue), // Use Colorconst.cBlue if it's defined elsewhere
        Text("Add Payment Type", style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildStateSelectionRow() {
    return GestureDetector(
      onTap: () {
        _showStateSelectionBottomSheet();
      },
      child: Row(
        children: [
          const Text("State of Supply",
              style: TextStyle(
                  color: Colors
                      .grey)), // Use Colorconst.cGrey if it's defined elsewhere
          const SizedBox(width: 100.0), // Adjusted to fixed width
          const Text("Select State"),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget _buildDescriptionAndPhoto() {
    return Container(
      color: Colors.white, // Use Colorconst.cwhite if it's defined elsewhere
      child: Row(
        children: [
          _buildDescriptionField(),
          _buildPhotoUploadButton(),
        ],
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 150.0, // Adjusted to fixed height
      width: 280.0, // Adjusted to fixed width
      color: Colors.white, // Use Colorconst.cwhite if it's defined elsewhere
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
    );
  }

  Widget _buildPhotoUploadButton() {
    return Container(
      height: 90.0, // Adjusted to fixed height
      width: 275.0, // Adjusted to fixed width
      color: Colors.white, // Use Colorconst.cwhite if it's defined elsewhere
      child: Container(
        width: 60,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: const Center(
          child: Icon(Icons.add_a_photo, color: Colors.blue, size: 30),
        ),
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
