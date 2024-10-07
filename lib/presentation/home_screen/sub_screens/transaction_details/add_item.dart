import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
// import 'package:vyapar_clone/core/common/widget/custom_dropdown.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class AddItemSaleScreen extends StatefulWidget {
  const AddItemSaleScreen({super.key});

  @override
  State<AddItemSaleScreen> createState() => _AddItemSaleScreenState();
}

class _AddItemSaleScreenState extends State<AddItemSaleScreen> {
  final GlobalKey<FormState> addItemKey = GlobalKey<FormState>();
  List<int> units = List.generate(5, (index) => index + 1);

  String selectedUnit = 'Unit';
  String selectedTax = 'Without Tax';
  bool isPriceEntered = false;

  void showUnitsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Unit',
            style: TextStyle(color: Colorconst.cBlack),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: units.map((unit) {
              return ListTile(
                title: Text(
                  '$unit Unit(s)',
                  style: const TextStyle(color: Colorconst.cBlack),
                ),
                onTap: () {
                  setState(() {
                    selectedUnit = '$unit Unit(s)';
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void showTaxDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('With Tax'),
                onTap: () {
                  setState(() {
                    selectedTax = 'With Tax';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Without Tax'),
                onTap: () {
                  setState(() {
                    selectedTax = 'Without Tax';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize ScreenUtil

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colorconst.cwhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Add Item To Sale",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w), // Use ScreenUtil
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h, // Use ScreenUtil
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextFormField(
                              hintText: "e.g. Chocolate Cake",
                              labelText: "Item Name",
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 10.h, // Use ScreenUtil
                        ),
                        Column(
                          children: [
                            _buildRow(
                              CustomTextFormField(
                                keyboardType: TextInputType.number,
                                hintText: "Enter Quantity",
                                labelText: "Quantity",
                              ),
                              _buildDropdownField(selectedUnit, showUnitsDialog,
                                  80.w), // Use ScreenUtil
                            ),
                            SizedBox(height: 10.h), // Use ScreenUtil
                            _buildRow(
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: _inputDecorationWithLabel(
                                    "Rate (Price/Unit)", "Price *"),
                                onChanged: (value) => setState(
                                    () => isPriceEntered = value.isNotEmpty),
                              ),
                              _buildDropdownField(selectedTax, showTaxDialog,
                                  40.w, 8), // Use ScreenUtil
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h, // Use ScreenUtil
                        ),
                        if (isPriceEntered)
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w), // Use ScreenUtil
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h), // Use ScreenUtil
                                Text("Totals & Taxes",
                                    style: interFontBlack(context)),
                                const SizedBox(height: 10),
                                const VerticleDivider(),
                                const SizedBox(height: 10),
                                buildRowWithTexts(
                                    "Subtotal", "(Rate x Qty)", context),
                                SizedBox(height: 10.h), // Use ScreenUtil
                                buildDiscountRow(context),
                                SizedBox(height: 10.h), // Use ScreenUtil
                                buildTaxRow(context),
                                SizedBox(height: 10.h), // Use ScreenUtil
                                buildTotalAmountRow(
                                    80.w, 80.h, context), // Use ScreenUtil
                                SizedBox(height: 10.h), // Use ScreenUtil
                              ],
                            ),
                          )
                      ],
                    ),
                  )),
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 350),
              opacity: 1.0,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 13.h), // Use ScreenUtil
                          child: Center(
                              child: Text(
                            "Save & New",
                            style: interFontGrey(context),
                          )),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Colorconst.cRed,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 13.h), // Use ScreenUtil
                          child: Center(
                              child: Text(
                            "Save",
                            style: interFontGrey(context),
                          )),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRow(Widget leftChild, Widget rightChild) {
    return Row(
      children: [
        Expanded(child: leftChild),
        SizedBox(width: 10.w), // Use ScreenUtil
        Expanded(child: rightChild),
      ],
    );
  }

  Widget _buildDropdownField(
      String text, VoidCallback onTap, double spacerWidth,
      [double radius = 4]) {
    return GestureDetector(
      onTap: onTap,
      child: InputDecorator(
        decoration: _inputDecoration(radius),
        child: _dropdownRow(text, spacerWidth),
      ),
    );
  }

  InputDecoration _inputDecoration([double radius = 4]) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  InputDecoration _inputDecorationWithLabel(String hintText, String labelText) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      hintText: hintText,
      labelText: labelText,
      labelStyle:
          TextStyle(color: Colorconst.cGrey, fontSize: 15.sp), // Use ScreenUtil
    );
  }

  Widget _dropdownRow(String text, double spacerWidth) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(color: Colorconst.cGrey),
        ),
        SizedBox(width: spacerWidth),
        const Icon(Icons.arrow_drop_down, color: Colorconst.cGrey),
      ],
    );
  }

  Widget buildRowWithTexts(String label1, String label2, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(label1, style: interFontBlack(context)),
              const SizedBox(width: 4),
              Text(label2,
                  style: interFontBlack(context, color: Colorconst.cGrey)),
            ],
          ),
        ),
        Text("₹            ", style: interFontBlack(context)),
      ],
    );
  }

  Widget buildDiscountRow(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 80.w, // Use ScreenUtil
            child: Text(
              "Discount",
              style: interFontBlack(context),
            )),
        const Text("0.0"),
      ],
    );
  }

  Widget buildTaxRow(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 80.w, // Use ScreenUtil
            child: Text(
              "Tax",
              style: interFontBlack(context),
            )),
        const Text("0.0"),
      ],
    );
  }

  Widget buildTotalAmountRow(
      double width, double height, BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: width, // Use ScreenUtil
            child: Text(
              "Total Amount",
              style: interFontBlack(context),
            )),
        const Text("0.0"),
      ],
    );
  }
}
