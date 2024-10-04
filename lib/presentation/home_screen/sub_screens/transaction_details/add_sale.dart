import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/add_item.dart';
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
                        _buildFormContainer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTextLabel("Total Amount"),
                        _buildAmountInputField(),
                      ],
                    ),
                  ),
                  ValueListenableBuilder<double>(
                    valueListenable: totalAmountNotifier,
                    builder: (context, totalAmount, child) {
                      if (totalAmount <= 0) return const SizedBox();

                      return Column(
                        children: [
                          _buildReceivedAmountSection(totalAmount),
                          SizedBox(height: screenHeight * 0.01),
                          _buildBalanceDueSection(totalAmount),
                          _buildZigzagSeparator(),
                          SizedBox(height: screenHeight * 0.01),
                          _buildPaymentSection(),
                          SizedBox(height: screenHeight * 0.01),
                          _buildDescriptionAndPhotoSection(),
                          _buildAddDocumentButton(),
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

  Widget _buildTextLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colorconst.cBlack,
        fontSize: 15.sp,
      ),
    );
  }

  Widget _buildReceivedAmountSection(double totalAmount) {
    return Padding(
      padding: const EdgeInsets.only(left: 10), // Fixed padding
      child: GestureDetector(
        onTap: () {
          isReceivedChecked.value = !isReceivedChecked.value;
          receivedAmountNotifier.value =
              isReceivedChecked.value ? totalAmount : 0.0;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCheckBoxWithLabel(),
            _buildReceivedAmountInput(totalAmount),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckBoxWithLabel() {
    return ValueListenableBuilder<bool>(
      valueListenable: isReceivedChecked,
      builder: (context, isChecked, child) {
        return Row(
          children: [
            Container(
              width: 20, // Fixed width
              height: 20, // Fixed height
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(5),
                color: isChecked ? Colors.blue : Colors.transparent,
              ),
              child: isChecked
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
            const SizedBox(width: 8), // Fixed spacing
            const Text("Received",
                style: TextStyle(fontSize: 14, color: Colors.black)),
          ],
        );
      },
    );
  }

  Widget _buildReceivedAmountInput(double totalAmount) {
    return SizedBox(
      width: 100, // Fixed width for the text input field
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 1, // Fixed bottom position
            child: CustomPaint(painter: DottedLinePainter()),
          ),
          ValueListenableBuilder<double>(
            valueListenable: receivedAmountNotifier,
            builder: (context, receivedAmount, child) {
              return TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "₹",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10), // Fixed padding
                ),
                onChanged: (value) {
                  receivedAmountNotifier.value = double.tryParse(value) ?? 0.0;
                },
                style: const TextStyle(
                    fontSize: 16, color: Colors.black), // Fixed font size
                initialValue:
                    isReceivedChecked.value ? totalAmount.toString() : '',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceDueSection(double totalAmount) {
    return Padding(
      padding: const EdgeInsets.only(left: 10), // Fixed padding
      child: ValueListenableBuilder<double>(
        valueListenable: receivedAmountNotifier,
        builder: (context, receivedAmount, child) {
          double balanceDue = totalAmount - receivedAmount;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Balance Due",
                  style: TextStyle(color: Colors.green, fontSize: 14)),
              Text("₹ ${balanceDue.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.green, fontSize: 14)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildZigzagSeparator() {
    return ClipPath(
      clipper: ZigzagClipper(),
      child: Container(
          color: Colors.white,
          height: 10,
          width: double.infinity), // Fixed height for the zigzag separator
    );
  }

  Widget _buildPaymentSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          _buildRowWithIcon("Payment Type", Icons.money, "Cash"),
          const SizedBox(height: 10),
          const Row(children: [
            Icon(Icons.add, color: Colors.blue),
            Text("Add Payment Type", style: TextStyle(color: Colors.blue))
          ]),
          const Divider(),
          GestureDetector(
              onTap: _showStateSelectionBottomSheet,
              child: _buildRowWithText("State of Supply", "Select State")),
        ],
      ),
    );
  }

  Widget _buildDescriptionAndPhotoSection() {
    return Row(
      children: [
        _buildDescriptionField(),
        _buildAddPhotoContainer(),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 120, // Fixed height for the description field
      width: 250, // Fixed width
      color: Colors.white,
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: 'Description',
            hintText: 'Add Note',
            border: OutlineInputBorder()),
        maxLines: 3,
      ),
    );
  }

  Widget _buildAddPhotoContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 120, // Fixed height
      width: 120, // Fixed width
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey)),
        child: const Center(
            child: Icon(Icons.add_a_photo, color: Colors.blue, size: 30)),
      ),
    );
  }

  Widget _buildAddDocumentButton() {
    return Container(
      height: 150, // Fixed height
      color: Colors.white,
      child: Center(
        child: Container(
          height: 120, // Fixed button height
          width: 300, // Fixed button width
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
                  const BorderSide(color: Colors.black, width: 2)),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Icon(Icons.document_scanner_outlined, color: Colors.grey),
                  Text('Add Your Documents',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowWithIcon(String text, IconData icon, String trailingText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(color: Colors.grey)),
        Row(children: [
          Icon(icon, color: Colors.green),
          Text(trailingText),
          const Icon(Icons.arrow_drop_down)
        ]),
      ],
    );
  }

  Widget _buildRowWithText(String text, String trailingText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(color: Colors.grey)),
        Row(children: [Text(trailingText), const Icon(Icons.arrow_drop_down)]),
      ],
    );
  }

  Widget _buildAmountInputField() {
    return SizedBox(
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
              contentPadding: EdgeInsets.only(left: 20.w),
            ),
            onChanged: (value) {
              double parsedValue = double.tryParse(value) ?? 0.0;
              totalAmountNotifier.value = parsedValue;
              if (isReceivedChecked.value) {
                receivedAmountNotifier.value = parsedValue;
              }
            },
            style: TextStyle(fontSize: 15.sp, color: Colorconst.cBlack),
          ),
        ],
      ),
    );
  }

  Widget _buildFormContainer() {
    return Container(
      height: 240.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          _buildCustomTextFormField(
            labelText: selectedIndex == 0 ? "Customer *" : "Billing Name *",
            hintText:
                selectedIndex == 0 ? "Enter Customer" : "Enter Billing Name",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 25.h),
          _buildCustomTextFormField(
            keyboardType: TextInputType.number,
            labelText: "Phone Number",
            hintText: "Enter Phone Number",
          ),
          SizedBox(height: 20.h),
          AddItemButton(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddItemSaleScreen()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCustomTextFormField(
      {required String labelText,
      required String hintText,
      required TextInputType keyboardType}) {
    return CustomTextFormField(
      labelText: labelText,
      hintText: hintText,
      keyboardType: keyboardType ?? TextInputType.text,
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
