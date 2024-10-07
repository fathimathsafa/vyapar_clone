import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/create/sub_create/pro_forma_invoice/sub_pro_forma_invoice/add_product/controller/controller.dart';

import '../../../../../../../../../core/common/widget/custom_dropdown.dart';
import '../../../../../../../../../core/common/widget/verticle_divider.dart';
import '../../../../../../../../../core/constatnts/colors.dart';
import '../../../../../../../../../core/constatnts/text_style.dart';
import '../../../../../../sale/delivery_challan_screen/sub_screens/add_delivery_challan_screen/view/add_delivery_challan_screen.dart';





// ignore: must_be_immutable, use_key_in_widget_constructors
class AddProductScreenS extends StatelessWidget {
  //  AddProductScreenS({super.key});

   final _controller = Get.put(AddProductController());
   String selectedUnit = 'Unit';

  String selectedTax = 'Without Tax';
  bool isPriceEntered = false;
  @override
  Widget build(BuildContext context) {
   final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colorconst.cwhite,
        leading: IconButton(
            onPressed: () {
             Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Add Item To Sale",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))
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
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * .025),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .04,
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
                          height: screenHeight * .025,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextFormField(
                              keyboardType: TextInputType.number,
                              hintText: "Enter Quantity",
                              labelText: "Quantity",
                            )),
                            SizedBox(
                              width: screenWidth * .02,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap:()=> showUnitsDialog(context),
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        selectedUnit,
                                        style: TextStyle(
                                          color: selectedUnit == 'Unit'
                                              ? Colorconst.cGrey
                                              : Colorconst.cGrey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * .25,
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colorconst.cGrey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * .025,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child:  CustomTextFormField(
                                keyboardType: TextInputType.number,
                               hintText: "Rate (Price/Unit)",
                                    labelText: "Price *",
                            ),
                            ),
                            SizedBox(
                              width: screenWidth * .02,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap:()=> showTaxDialog(context),
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        selectedTax,
                                        style: TextStyle(
                                          color: selectedTax == 'Select Tax'
                                              ? Colorconst.cGrey
                                              : Colorconst.cGrey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * .1,
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colorconst.cGrey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * .02,
                        ),
                        if (isPriceEntered)
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * .01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                  Text(
                                    "Totals & Taxes",
                                    style: interFontBlack(context),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const VerticleDivider(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Text(
                                            "Subtotal",
                                            style: interFontBlack(context),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "(Rate x Qty)",
                                            style: interFontBlack(context,
                                                color: Colorconst.cGrey),
                                          ),
                                        ],
                                      )),
                                      Text(
                                        "₹            ",
                                        style: interFontBlack(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * .02,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * .22,
                                        child: Text(
                                          'Discount',
                                          style: interFontBlack(context),
                                        ),
                                      ),
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: screenHeight *
                                                  .055, // Adjust height for better appearance
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color:
                                                      Colorconst.cYellowLight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: screenWidth * .02),
                                                  Expanded(
                                                    child: TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                                vertical:
                                                                    5), // Adjust padding
                                                      ),
                                                      style: interFontBlack(
                                                          context),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 1,
                                                          color: Colorconst
                                                              .cYellowLight,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    color: Colorconst
                                                        .cSecondaryYellowLight,
                                                    height: double.infinity,
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12),
                                                      child: Icon(
                                                        Icons.percent,
                                                        color: Colorconst
                                                            .cYellowLight,
                                                        size: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * .02,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: screenHeight * .055,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colorconst.cGrey),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    color: Colorconst
                                                        .cSecondaryGrey,
                                                    height: double.infinity,
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12),
                                                      child: SizedBox(),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                        width: 1,
                                                        color: Colorconst.cGrey,
                                                      ))
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                        "0.00",
                                                        style: interFontBlack(
                                                            context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * .02,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 110,
                                        child: Text(
                                          'Tax %',
                                          style: interFontBlack(context),
                                        ),
                                      ),
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: screenHeight * .055,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colorconst.cGrey),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: CustomDropdown(
                                                items: const [],
                                                selectedValue: "Selcted dropdown",
                                                onChanged: (value){

                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenWidth * .02,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: screenHeight * .055,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colorconst.cGrey),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    color: Colorconst
                                                        .cSecondaryGrey,
                                                    height: double.infinity,
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12),
                                                      child: SizedBox(),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                        width: 1,
                                                        color: Colorconst.cGrey,
                                                      ))
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                        "0.00",
                                                        style: interFontBlack(
                                                            context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * .02,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total Amount",
                                        style: interFontBlack(context),
                                      ),
                                      SizedBox(
                                        width: screenWidth * .45,
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
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: "₹",
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                  left: screenWidth * 0.025,
                                                ),
                                              ),
                                              style: TextStyle(
                                                  fontSize: screenWidth * 0.04,
                                                  color: Colorconst.cBlack),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * .02,
                                  )
                                ],
                              ),
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
                          padding: const EdgeInsets.symmetric(vertical: 13),
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
                          padding: const EdgeInsets.symmetric(vertical: 13),
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

   void showUnitsDialog(context) {

     List<int> units = List.generate(5, (index) => index + 1);

  
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
                  // setState(() {
                  //   selectedUnit = '$unit Unit(s)';
                  // });
                  // Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

   void showTaxDialog(context) {
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
               
                    // selectedTax = 'With Tax';
                 
                },
              ),
              ListTile(
                title: const Text('Without Tax'),
                onTap: () {
                 
                    // selectedTax = 'Without Tax';
               
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}