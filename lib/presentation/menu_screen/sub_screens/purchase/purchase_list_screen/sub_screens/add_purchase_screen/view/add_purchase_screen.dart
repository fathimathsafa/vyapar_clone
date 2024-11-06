import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/context_provider.dart';

import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/add_item.dart';
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

  // States list for dropdown
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

  void _showStateSelectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          minChildSize: 0.3,
          builder: (_, controller) {
            return Column(
              children: [
                ListTile(
                  title: Text("Select State of Supply"),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
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
                            selectedState = states[index];
                          });
                          Navigator.pop(context);
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
                        Obx(() {
                          return DateExpenseInvoiceWidget(
                            invoiceNumber: _controller.selectBillNo.value,
                            onTapBillNo: () {
                              showDialogGlobal(
                                onSelectItem: (p0) {
                                  _controller.selectBillNo.value = p0;
                                },
                              );
                            },
                            titleOne: "Bill No.",
                            titleTwo: "Date",
                            date: _controller.selectedDate.value,
                          );
                        }),
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
      width: 20.0,
      height: 20.0,
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
      width: 100.0,
      child: TextFormField(
        enabled: !isReceivedChecked.value,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "₹",
        ),
        onChanged: (value) {
          receivedAmountNotifier.value = double.tryParse(value) ?? 0.0;
        },
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _buildBalanceDueRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Balance Due",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          ValueListenableBuilder<double>(
            valueListenable: receivedAmountNotifier,
            builder: (context, receivedAmount, child) {
              double balanceDue = totalAmountNotifier.value - receivedAmount;
              return Text("₹ ${balanceDue.toStringAsFixed(2)}");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(color: Colors.grey[400]),
    );
  }

  Widget _buildPaymentDetails() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "State of Supply",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          GestureDetector(
            onTap: () => _showStateSelectionBottomSheet(),
            child: Row(
              children: [
                Text(
                  selectedState ?? "Select State",
                  style: const TextStyle(color: Colors.grey),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionAndPhoto() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Description",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            labelText: "Enter Description",
            hintText: "Description",
          ),
          const SizedBox(height: 20),
          const Text(
            "Upload Photo",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.camera_alt, color: Colors.grey),
              ),
              const SizedBox(width: 10),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.photo_library, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
