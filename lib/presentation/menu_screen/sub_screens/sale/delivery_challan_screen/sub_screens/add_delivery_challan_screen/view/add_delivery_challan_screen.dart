import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
// import 'package:vyapar_clone/core/constatnts/text_style.dart';
// import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/delivery_challan_screen/sub_screens/add_item_delivery_screen/view/add_item_delivery_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/delivery_challan_screen/widget/challan_date_widget.dart';

class AddDeliveryChallanScreen extends StatefulWidget {
  @override
  State<AddDeliveryChallanScreen> createState() =>
      _AddDeliveryChallanScreenState();
}

class _AddDeliveryChallanScreenState extends State<AddDeliveryChallanScreen> {
  final ValueNotifier<double> totalAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<double> receivedAmountNotifier = ValueNotifier(0.0);

  final ValueNotifier<bool> isReceivedChecked = ValueNotifier(false);
  // Initialize TextEditingController
  late TextEditingController _dateController;
  DateTime selectedDate = DateTime.now(); // Initialize with the current date

  @override
  void initState() {
    super.initState();
    // Initialize the date controller with the current date formatted
    _dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(selectedDate), // Set initial date
    );
  }

  @override
  void dispose() {
    _dateController.dispose(); // Dispose of the controller to free resources
    super.dispose();
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000), // Date range starting from year 2000
      lastDate: DateTime(2101), // Date range up to year 2101
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // Update the TextField with the new selected date
        _dateController.text = DateFormat('dd/MM/yyyy')
            .format(selectedDate); // Format the selected date
      });
    }
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

  String? selectedState; // To store the selected state

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
        title: Text(
          "Delivery Challan",
          style: TextStyle(color: Colorconst.cBlack),
        ),
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
                        DateChallanWidget(invoiceNumber: "10120"),
                        SizedBox(height: 10.h),
                        Container(
                          height: 230.h,
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
                              TextField(
                                controller: _dateController,
                                decoration: InputDecoration(
                                  helperStyle:
                                      TextStyle(color: Colorconst.cBlack),
                                  labelStyle:
                                      TextStyle(color: Colorconst.cBlack),
                                  labelText: 'Due Date',
                                  suffixIcon: Icon(Icons.calendar_today),
                                  border: OutlineInputBorder(
                                    // Add a border
                                    borderRadius: BorderRadius.circular(
                                        5.0.r), // Optional: round the corners
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Set the border color
                                  ),
                                  // You can also set the focused and enabled borders if you want
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0.r),
                                    borderSide: BorderSide(
                                        color: Colors
                                            .blue), // Change color when focused
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0.r),
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Change color when enabled
                                  ),
                                ),

                                readOnly: true, // Make the TextField read-only
                                onTap: () => _selectDate(
                                    context), // Show the date picker when clicked
                              ),
                              SizedBox(height: 20.h),
                              AddItemButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddItemDeliery()));
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
                      horizontal: 20.h,
                      vertical: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            color: Colorconst.cBlack,
                            fontWeight: FontWeight.bold,
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
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              height: 50.h,
                              color: Colors.white,
                              child: Column(
                                children: [
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
