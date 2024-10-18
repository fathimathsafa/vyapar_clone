import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vyapar_clone/core/common/widget/custom_dropdown.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

import 'controller/controller.dart';

// import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_item.dart';
// import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_sale.dart';

class AddItemToSale extends StatelessWidget {
  AddItemToSale({super.key});

  final GlobalKey<FormState> addItemKey = GlobalKey<FormState>();
  final List<int> units = List.generate(5, (index) => index + 1);

  final _controller = Get.put(TransactionDetailController());

  void showUnitsDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Unit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: units.map((unit) {
              return ListTile(
                title: Text('$unit Unit(s)'),
                onTap: () {
                  _controller.selectedUnit.value = '$unit Unit(s)';
                  // setState(() {
                  //   selectedUnit = '$unit Unit(s)';
                  // });
                  // Navigator.pop(context);
                  Get.back();
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
                  _controller.selectedTax.value = 'With Tax';
                  // setState(() {
                  //   selectedTax = 'With Tax';
                  // });
                  // Navigator.pop(context);
                  Get.back();
                },
              ),
              ListTile(
                title: const Text('Without Tax'),
                onTap: () {
                  _controller.selectedTax.value = 'Without Tax';
                  Get.back();
                  // setState(() {
                  //   selectedTax = 'Without Tax';
                  // });
                  // Navigator.pop(context);
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Add Items to Sale",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
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
                                onTap: () => showUnitsDialog(context),
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 13.w, right: 10.w),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(() {
                                        return Text(
                                          _controller.selectedUnit.value,
                                          style: TextStyle(
                                              color: _controller
                                                          .selectedUnit.value ==
                                                      'Unit'
                                                  ? Colorconst.cGrey
                                                  : Colorconst.cBlack,
                                              fontSize: 16.sp),
                                        );
                                      }),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colorconst.cGrey,
                                        size: 25.sp,
                                      ),
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: interFontBlack(context,
                                    color: Colorconst.cBlack, fontsize: 16.sp),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Rate (Price/Unit)",
                                    labelText: "Price *",
                                    labelStyle:
                                        TextStyle(color: Colorconst.cGrey)),
                                onChanged: (value) {
                                  _controller.isPriceEntered.value =
                                      value.isNotEmpty;
                                  // setState(() {
                                  //   isPriceEntered = value.isNotEmpty;
                                  // });
                                },
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * .02,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => showTaxDialog(context),
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Obx(() {
                                        return Text(
                                          _controller.selectedTax.value,
                                          style: TextStyle(
                                            color:
                                                _controller.selectedTax.value ==
                                                        'Select Tax'
                                                    ? Colorconst.cGrey
                                                    : Colorconst.cGrey,
                                          ),
                                        );
                                      }),
                                      SizedBox(
                                        width: screenWidth * .1,
                                      ),
                                      Icon(
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
                        // if (_controller.isPriceEntered.value)
                        Obx(() {
                          return _controller.isPriceEntered.value
                              ? Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * .01),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: screenHeight * .01,
                                        ),
                                        Text(
                                          "Totals & Taxes",
                                          style: interFontBlack(context),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        const VerticleDivider(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Row(
                                              children: [
                                                Text(
                                                  "Subtotal",
                                                  style:
                                                      interFontBlack(context),
                                                ),
                                                SizedBox(
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
                                                        color: Colorconst
                                                            .cYellowLight,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                            width: screenWidth *
                                                                .02),
                                                        Expanded(
                                                          child: TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          5), // Adjust padding
                                                            ),
                                                            style:
                                                                interFontBlack(
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
                                                          height:
                                                              double.infinity,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        12),
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
                                                          color:
                                                              Colorconst.cGrey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          color: Colorconst
                                                              .cSecondaryGrey,
                                                          height:
                                                              double.infinity,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        12),
                                                            child:
                                                                const SizedBox(),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                              width: 1,
                                                              color: Colorconst
                                                                  .cGrey,
                                                            ))
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: Text(
                                                              "0.00",
                                                              style:
                                                                  interFontBlack(
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
                                                          color:
                                                              Colorconst.cGrey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: CustomDropdown(
                                                      items: [],
                                                      selectedValue: '',
                                                      onChanged: (newValue) {},
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
                                                          color:
                                                              Colorconst.cGrey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          color: Colorconst
                                                              .cSecondaryGrey,
                                                          height:
                                                              double.infinity,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        12),
                                                            child:
                                                                const SizedBox(),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                              width: 1,
                                                              color: Colorconst
                                                                  .cGrey,
                                                            ))
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: Text(
                                                              "0.00",
                                                              style:
                                                                  interFontBlack(
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
                                                    bottom:
                                                        screenHeight * 0.001,
                                                    child: CustomPaint(
                                                      painter:
                                                          DottedLinePainter(),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    style: interFontBlack(
                                                        context,
                                                        color:
                                                            Colorconst.cBlack,
                                                        fontsize: 16.sp),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: "₹",
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                        left:
                                                            screenWidth * 0.025,
                                                      ),
                                                    ),
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
                              : const SizedBox();
                        })
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
                          padding: EdgeInsets.symmetric(vertical: 13),
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
                          padding: EdgeInsets.symmetric(vertical: 13),
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
