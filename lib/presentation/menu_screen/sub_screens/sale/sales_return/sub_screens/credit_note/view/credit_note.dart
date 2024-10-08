import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
// import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/add_item.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/zigzag_widget.dart';

import '../../../../../../../../core/constatnts/text_style.dart';
import '../controller/controller.dart';

class CreditNoteScreen extends StatefulWidget {
  @override
  State<CreditNoteScreen> createState() => _CreditNoteScreenState();
}

class _CreditNoteScreenState extends State<CreditNoteScreen> {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);

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
  // To store the selected state

  final _controller = Get.put(CreditNoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Credit Note"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
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
                        Obx(
                         () {
                            return DateInvoiceWidget(invoiceNumber: "10120", date: _controller.selectedPurchaseDate.value,
                                          onTapDate:() => _controller.selctedDate(context));
                          }
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 310.h,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              SizedBox(height: 20.h),
                              CustomTextFormField(
                                labelText: "Customer *",
                                hintText: "Enter Customer",
                              ),
                              SizedBox(height: 25.h),
                              CustomTextFormField(
                                keyboardType: TextInputType.number,
                                labelText: "Phone Number",
                                hintText: "Enter Phone Number",
                              ),
                              SizedBox(height: 25.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildFormField(
                                      label: 'Invoice Date',
                                      suffixIcon: Icon(Icons.calendar_today),
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: _buildFormField(
                                      label: 'Inv No.',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
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
                  // SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
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
                                  helperStyle:
                                      TextStyle(color: Colorconst.cBlack),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 10.w,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 10.w),
                                            Text("Paid",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colorconst.cBlack)),
                                            SizedBox(
                                              width: 190.w,
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              child: Stack(children: [
                                                Positioned(
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 10.h,
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
                                                                left: 10.w),
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
                                                          fontSize: 14.sp,
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
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(left: 30.w),
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
                                              fontSize: 15.sp)),
                                      SizedBox(width: 150.w),
                                      Text("₹ ",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colorconst.cBlack)),
                                      Text("${balanceDue.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15.sp))
                                    ],
                                  );
                                },
                              ),
                            ),
                            ClipPath(
                              clipper: ZigzagClipper(),
                              child: Container(
                                color: Colors.white,
                                height: 20.h,
                                width: double.infinity,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              height: 130.h,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Payment Type",
                                        style: TextStyle(
                                            color: Colorconst.cGrey,
                                            fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        width: 160.w,
                                      ),
                                      Icon(
                                        Icons.money,
                                        color: Colors.green,
                                      ),
                                      // SizedBox(
                                      //   width: screenWidth * .01,
                                      // ),
                                      Text(
                                        "Cash",
                                        style:
                                            TextStyle(color: Colorconst.cBlack),
                                      ),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 35.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.add, color: Colorconst.cBlue),
                                      Text(
                                        "Add Payment Type",
                                        style: TextStyle(
                                            color: Colorconst.cBlue,
                                            fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  InkWell(
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
                                          width: 90.w,
                                        ),
                                        Text(
                                          selectedState ??
                                              "Select State", // "Select State" when nothing is selected
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.w),
                                  height: 100.h,
                                  width: 250.w,
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
                                  padding: EdgeInsets.all(10.w),
                                  height: 100.h,
                                  width: 110.w,
                                  color: Colors.white,
                                  child: Container(
                                    width: 60.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius:
                                          BorderRadius.circular(8.0.r),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: Colorconst.cBlue,
                                        size: 30.sp,
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
            bottom: 0.h,
            left: 0,
            right: 0,
            child: BottomButton(),
          ),
        ],
      ),
    );
  }

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

  Widget _buildFormField({
    required String label,
    String? initialValue,
    bool isEnabled = true,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      enabled: isEnabled,
      style: interFontBlack(context, color: Colorconst.cBlack, fontsize: 17.sp),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        // Increase height by adjusting content padding
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h, // Adjust this value for vertical height
          horizontal: 15.w, // Horizontal padding
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
