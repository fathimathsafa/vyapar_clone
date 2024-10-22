import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/loading_var.dart';

import 'package:vyapar_clone/core/common/widget/custom_dropdown.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/core/snackbar/my_snackbar.dart';
import 'package:vyapar_clone/model/item_model.dart';
import 'package:vyapar_clone/model/unit_model.dart';

import '../../../../model/tax_model.dart';
import 'controller/controller.dart';

// import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_item.dart';
// import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_sale.dart';

class AddItemToSale extends StatelessWidget {
  AddItemToSale({super.key});

  final GlobalKey<FormState> addItemKey = GlobalKey<FormState>();

  final _controller = Get.put(TransactionDetailController());

  void showUnitsDialog(context) {
    _controller.fetchUnitList();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Unit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          ),
          content: Obx(() {
            return isLoading.value == true
                ? SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: const Center(child: CircularProgressIndicator()))
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _controller.unitList.map((unit) {
                      UnitModel ob = unit;
                      return ListTile(
                        title: Text(ob.name.toString()),
                        onTap: () {
                          _controller.unitModel.value = ob;

                          Get.back();
                        },
                      );
                    }).toList(),
                  );
          }),
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
                  _controller.isTaxOrNo.value = 'With Tax';
                  // setState(() {
                  //   isTaxOrNo = 'With Tax';
                  // });
                  // Navigator.pop(context);
                  Get.back();
                },
              ),
              ListTile(
                title: const Text('Without Tax'),
                onTap: () {
                  _controller.isTaxOrNo.value = 'Without Tax';
                  Get.back();
                  // setState(() {
                  //   isTaxOrNo = 'Without Tax';
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

  void showTaxexDialog(context) {
    if (_controller.taxList.length.toInt() == 0) {
      _controller.fetchTax();
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Obx(() {
            return isLoading.value == true
                ? Center(
                    child: SizedBox(
                        height: 80.w,
                        width: 80.w,
                        child: const CircularProgressIndicator()),
                  )
                : SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _controller.taxList.length.toInt() == 0
                            ? [
                                Align(
                                    alignment: Alignment.center,
                                    child: Center(
                                        child: Text(
                                      "No Data Found",
                                      style: TextStyle(
                                          fontSize: 20.sp, color: Colors.black),
                                    )))
                              ]
                            : List.generate(
                                _controller.taxList.length,
                                (index) {
                                  TaxModel ob = _controller.taxList[index];
                                  return ListTile(
                                    title: Text('${ob.taxType}  ${ob.rate}%'),
                                    onTap: () {
                                      if (_controller.priceContr.text != '') {
                                        _controller.calculateTotalAmount(
                                            price: double.parse(
                                                _controller.priceContr.text),
                                            quantity: double.parse(_controller
                                                        .quantityContr.text ==
                                                    ''
                                                ? "1.0"
                                                : _controller
                                                    .quantityContr.text),
                                            discountPercentage: _controller
                                                        .discountContr.text ==
                                                    ''
                                                ? 0.0
                                                : double.parse(_controller
                                                    .discountContr.text,
                                                    
                                                    ),
                                                    taxPercentage: double.parse(ob.rate.toString())
                                                    
                                                    );
                                      }
                                      _controller.selectedTax.value = ob;
                                      Get.back();
                                    },
                                  );
                                },
                              )

                        // [

                        //   ListTile(
                        //     title: const Text('Without Tax'),
                        //     onTap: () {
                        //       // _controller.selectedTax.value = 'Without Tax';
                        //       Get.back();
                        //       // setState(() {
                        //       //   selectedTax = 'Without Tax';
                        //       // });
                        //       // Navigator.pop(context);
                        //     },
                        //   ),
                        // ],
                        ),
                  );
          }),
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
                              controller: _controller.itemNameContr,
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
                              controller: _controller.quantityContr,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                printInfo(info: "qantitty");
                                if (_controller.quantityContr.text != '' &&
                                    _controller.priceContr.text != '') {
                                  _controller.calculateTotalAmount(
                                      price: double.parse(
                                          _controller.priceContr.text),
                                      quantity: double.parse(
                                          _controller.quantityContr.text),
                                      discountPercentage: _controller
                                                  .discountContr.text ==
                                              ''
                                          ? 0.0
                                          : double.parse(
                                              _controller.discountContr.text),
                                              taxPercentage: double.parse(_controller.selectedTax.value.rate.toString())
                                              );
                                }
                              },
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
                                          _controller.unitModel.value.name ==
                                                  null
                                              ? "Select Unit"
                                              : _controller.unitModel.value.name
                                                  .toString(),
                                          style: TextStyle(
                                              color: _controller.unitModel.value
                                                          .name ==
                                                      null
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
                                controller: _controller.priceContr,
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
                                  if (_controller.priceContr.text != '') {
                                    _controller.calculateTotalAmount(
                                        price: double.parse(
                                            _controller.priceContr.text),
                                        quantity: double.parse(
                                            _controller.quantityContr.text == ''
                                                ? "1.0"
                                                : _controller
                                                    .quantityContr.text),
                                        discountPercentage:
                                            _controller.discountContr.text == ''
                                                ? 0.0
                                                : double.parse(_controller
                                                    .discountContr.text),
                                                    taxPercentage: double.parse(_controller.selectedTax.value.rate.toString())
                                                    );
                                  }
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
                                          _controller.isTaxOrNo.value
                                              .toString(),
                                          style: TextStyle(
                                            color:
                                                _controller.isTaxOrNo.value ==
                                                        'Without tax'
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
                                              "₹ ${_controller.subTotalP.value}",
                                              style: interFontBlack(context,
                                                  color: Colors.black,
                                                  fontsize: 14.sp),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            )
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
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller: _controller
                                                                .discountContr,
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
                                                            onChanged: (value) {
                                                              if (_controller
                                                                      .discountContr
                                                                      .text !=
                                                                  '') {
                                                                _controller.calculateTotalAmount(
                                                                    price: double.parse(
                                                                        _controller
                                                                            .priceContr
                                                                            .text),
                                                                    quantity: double.parse(
                                                                        _controller
                                                                            .quantityContr
                                                                            .text==''?'1.0': _controller
                                                                            .quantityContr
                                                                            .text),
                                                                    discountPercentage: _controller.discountContr.text ==
                                                                            ''
                                                                        ? 0.0
                                                                        : double.parse(_controller
                                                                            .discountContr
                                                                            .text),
                                                                            taxPercentage: double.parse(_controller.selectedTax.value.rate.toString())
                                                                            );
                                                              } else {
                                                                _controller
                                                                    .calculateTotalAmount(
                                                                  price: double.parse(
                                                                      _controller
                                                                          .priceContr
                                                                          .text),
                                                                  quantity: double.parse(
                                                                        _controller
                                                                            .quantityContr
                                                                            .text==''?'1.0': _controller
                                                                            .quantityContr
                                                                            .text),
                                                                          taxPercentage: double.parse(_controller.selectedTax.value.rate.toString())
                                                                );
                                                              }
                                                            },
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
                                                              _controller
                                                                  .totalDiscount
                                                                  .value
                                                                  .toStringAsFixed(2),
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
                                                  child: InkWell(
                                                    onTap: () =>
                                                        showTaxexDialog(
                                                            context),
                                                    child: Container(
                                                        height:
                                                            screenHeight * .055,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: Colorconst
                                                                  .cGrey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: CustomDropdown(
                                                          hintText: "${_controller
                                                                  .selectedTax
                                                                  .value
                                                                  .taxType} ${_controller
                                                                  .selectedTax
                                                                  .value
                                                                  .rate}%",
                                                          items: [],
                                                          selectedValue:
                                                              _controller
                                                                      .selectedTax
                                                                      .value
                                                                      .taxType ??
                                                                  '',
                                                          onChanged:
                                                              (newValue) {},
                                                        )),
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
                                                              _controller
                                                                      .totalTaxes
                                                                      .value.toStringAsFixed(2)
                                                                       
                                                                  ,
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
                                                    controller: _controller
                                                        .totalAmountContr,
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
                      onTap: () {
                        ItemModel obj = ItemModel(
                            discount:
                                _controller.totalDiscount.value.toString(),
                            itemName: _controller.itemNameContr.text,
                            price: _controller.priceContr.text,
                            quantity: _controller.quantityContr.text,
                            tax: _controller.totalTaxes.value.toString(),
                            total: _controller.totalPrice.value.toString(),
                            discountP: _controller.discountContr.text,
                            subtotalP: _controller.subTotalP.value.toString(),
                            unit: _controller.unitModel.value.name,
                            taxPercent: _controller.selectedTax.value.rate
                            );
                        _controller.addItem(item: obj);
                        _controller.clearItemController();
                        SnackBars.showSuccessSnackBar(text: "Add item to sale");
                      },
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
                      onTap: () {
                        ItemModel obj = ItemModel(
                            discount:
                                _controller.totalDiscount.value.toString(),
                            itemName: _controller.itemNameContr.text,
                            price: _controller.priceContr.text,
                            quantity: _controller.quantityContr.text,
                            tax: _controller.totalTaxes.value.toString(),
                            total: _controller.totalPrice.value.toString(),
                            discountP: _controller.discountContr.text,
                            subtotalP: _controller.subTotalP.value.toString(),
                            unit: _controller.unitModel.value.name,
                            taxPercent: _controller.selectedTax.value.rate
                            );
                        _controller.addItem(item: obj);
                        Get.back();
                      },
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
