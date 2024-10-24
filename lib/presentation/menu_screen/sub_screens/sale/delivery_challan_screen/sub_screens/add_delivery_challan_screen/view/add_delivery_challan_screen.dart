import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/core/common/loading_var.dart';
import 'package:vyapar_clone/core/common/widget/bottom_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_add_item_button.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/model/item_model.dart';
import 'package:vyapar_clone/model/state_model.dart';

import 'package:vyapar_clone/presentation/home_screen/widget/date_invoice_widget.dart';
import 'package:vyapar_clone/presentation/home_screen/widget/zigzag_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/create/sub_create/pro_forma_invoice/sub_pro_forma_invoice/adde_bank/view/add_bank.dart';

import '../../../../../../../home_screen/widget/item_card_widget.dart';
import '../../../controller/delivery_challan_controller.dart';
import '../../add_item_delivery_screen/view/add_item_delivery_screen.dart';


class AddDeliveryChallanScreen extends StatelessWidget {
  AddDeliveryChallanScreen({super.key});

  final _controller = Get.find<DeliveryChallanController>();

  void _showStateSelectionBottomSheet(context) {
   if(_controller.stateList.length.toInt()==0){
     _controller.fetchStates();}


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
                     Get.back();
                    },
                  ),
                ),
                const Divider(),
                Obx(
                  () {
                    return Expanded(
                      child:isLoading.value==true?Center(child: SizedBox(
                        height: 80.w,
                        width: 80.w,
                        child:const CircularProgressIndicator()),):_controller.stateList.length.toInt()==0?Center(child: Text("No Data Found",style: TextStyle(fontSize: 20.sp,color: Colors.black),)): ListView.builder(
                        controller: controller,
                        itemCount: _controller.stateList.length,
                        itemBuilder: (context, index) {
                          StateModel obj = _controller.stateList[index];
                          return ListTile(
                            title: Text(obj.name.toString()),
                            onTap: () {
                              // _controller.selectedState!.value =
                                  // states[index].toString();
                                  _controller.selectedState.value = obj;
                    
                              Get.back();
                              // setState(() {
                              //   selectedState =
                              //       states[index]; // Update selected state
                              // });
                              // Navigator.pop(
                              //     context); // Close the bottom sheet after selecting
                            },
                          );
                        },
                      ),
                    );
                  }
                ),
              ],
            );
          },
        );
      },
    );
  }

  final List<String> states = [
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

  final List<String> invoiceNumList = [
    "10120",
    "10121",
    "10122",
    "10123",
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
              // Navigator.pop(context);
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Add Delivery Challan",
          style: TextStyle(color: Colorconst.cBlack),
        ),
       
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 500.h),
              child: Column(
                children: [
                  Column(
                    children: [
                      Obx(() {
                        return DateInvoiceWidget(
                          titleOne: "Challan No.",
                          invoiceNumber:
                              _controller.challanNoModel.value.challanNo == null
                                  ? ""
                                  : _controller.challanNoModel.value.challanNo
                                      .toString(),
                          ontapInvoice: () {
                            showDialogGlobal(
                              itemList: invoiceNumList,
                              onSelectItem: (value) {
                                // printInfo(info: "value ==$value");
                                // _controller.selectedInvoicNm.value = value;
                              },
                            );
                          },
                          onTapDate: () async {
                            String? date =
                                await ContextProvider().selectDate(context);
                            if (date == null) {
                            } else {
                              _controller.selectedSaleDate.value = date;
                            }
                          },
                          date: _controller.selectedSaleDate.value,
                        );
                      }),
                      SizedBox(height: 10.h),
                      _buildFormContainer(context),
                    ],
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

                   const Divider(),
          GestureDetector(
              onTap: () => _showStateSelectionBottomSheet(context),
              child: _buildRowWithText("State of Supply", _controller.selectedState.value.name?? "Select State")),
                  Obx(() {
                    return _controller.grandSubTotal.value == 0.0
                        ? const SizedBox()
                        : Column(
                            children: [
                              // _controller.selectedIndex.value == 0
                              //     ? Column(
                              //         children: [
                              //           _buildReceivedAmountSection(),
                              //           SizedBox(height: 12.h),
                              //           _buildBalanceDueSection(),
                              //         ],
                              //       )
                              //     : const SizedBox(),
                              // _buildZigzagSeparator(),
                              SizedBox(height: 12.h),
                              // _buildPaymentSection(context),
                              SizedBox(height: 12.h),
                              _buildDescriptionAndPhotoSection(),
                              // _buildAddDocumentButton(),
                            ],
                          );
                  }),
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
                    style:
                        GoogleFonts.inter(fontSize: 12.sp, color: Colors.grey),
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
          Obx(
             () {
              return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child:isLoading.value == true? const SizedBox(child: Center(child: CircularProgressIndicator(),),): BottomButton(onClickSave: () =>_controller.saleValidator()=="ok"? _controller.addChallan():null,),
              );
            }
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

  Widget _buildReceivedAmountSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 10), // Fixed padding
      child: GestureDetector(
        onTap: () {
          printInfo(info: "clicked");

          _controller.isChecked.value = !_controller.isChecked.value;

          if (_controller.isChecked.value) {
            _controller.recivedAmountController.text =
                _controller.grandSubTotal.value.toString();
            _controller.balanceDue.value = _controller.grandSubTotal.value -
                double.parse(_controller.recivedAmountController.text);
          } else {
            _controller.recivedAmountController.text = '0.0';
            _controller.balanceDue.value =
                double.parse(_controller.totalAmountContr.text);
          }
          // isReceivedChecked.value = !isReceivedChecked.value;
          // _controller.receivedAmountNotifier.value =
          //     isReceivedChecked.value ? totalAmount : 0.0;
          // if (_controller.isReceivedChecked.value) {
          //   _controller.recivedAmountController.text = totalAmount.toString();
          // } else {
          //   _controller.recivedAmountController.text = "";
          // }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCheckBoxWithLabel(),
            // _buildReceivedAmountInput(totalAmount),
            SizedBox(
              width: 110.w,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 10,
                    bottom: 1, // Fixed bottom position
                    child: CustomPaint(painter: DottedLinePainter()),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _controller.recivedAmountController,
                    decoration: const InputDecoration(
                      hintText: "₹",
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: 10), // Fixed padding
                    ),
                    onChanged: (value) {
                      //   receivedAmountNotifier.value = double.tryParse(value) ?? 0.0;
                      if (_controller.isChecked.value) {
                        _controller.balanceDue.value = double.parse(
                                _controller.totalAmountContr.text == ''
                                    ? '0.0'
                                    : _controller.totalAmountContr.text) -
                            double.parse(
                                _controller.recivedAmountController.text == ""
                                    ? "0.0"
                                    : _controller.recivedAmountController.text);
                      }
                    },
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black), // Fixed font size
                    // initialValue:
                    //     isReceivedChecked.value ? totalAmount.toString() : '',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckBoxWithLabel() {
    return Row(
      children: [
        Container(
          width: 18.w, // Fixed width
          height: 18.w, // Fixed height
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2.w),
            borderRadius: BorderRadius.circular(2.r),
            color:
                _controller.isChecked.value ? Colors.blue : Colors.transparent,
          ),
          child: _controller.isChecked.value
              ? Center(
                  child: Icon(Icons.check, color: Colors.white, size: 15.sp))
              : null,
        ),
        const SizedBox(width: 8), // Fixed spacing
        const Text("Received",
            style: TextStyle(fontSize: 14, color: Colors.black)),
      ],
    );
  }

  // Widget _buildReceivedAmountInput(double totalAmount) {
  //   return SizedBox(
  //     width: 100, // Fixed width for the text input field
  //     child: Stack(
  //       children: [
  //         Positioned(
  //           left: 0,
  //           right: 10,
  //           bottom: 1, // Fixed bottom position
  //           child: CustomPaint(painter: DottedLinePainter()),
  //         ),
  //         TextFormField(
  //           keyboardType: TextInputType.number,
  //           controller: _controller.recivedAmountController,
  //           decoration: const InputDecoration(
  //             hintText: "₹",
  //             border: InputBorder.none,
  //             contentPadding: EdgeInsets.only(left: 10), // Fixed padding
  //           ),
  //           // onChanged: (value) {
  //           //   receivedAmountNotifier.value = double.tryParse(value) ?? 0.0;
  //           // },
  //           style: TextStyle(
  //               fontSize: 16.sp, color: Colors.black), // Fixed font size
  //           initialValue:
  //               isReceivedChecked.value ? totalAmount.toString() : '',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildBalanceDueSection() {
    return Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w), // Fixed padding
        child:
            // double balanceDue = totalAmount - receivedAmount;
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Balance Due",
                style: TextStyle(color: Colors.green, fontSize: 14)),
            Text("₹ ${_controller.balanceDue.toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.green, fontSize: 14)),
          ],
        ));
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

  Widget _buildPaymentSection(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          _buildRowWithIcon("Payment Type", Icons.money,_controller.selectedPaymentType.value),
          const SizedBox(height: 10),
         _controller.selectedPaymentType.value =='Cheque'? _checkReferenceWidget():const SizedBox(),
          const SizedBox(height: 10),
          const Row(children: [
            Icon(Icons.add, color: Colors.blue),
            Text("Add Payment Type", style: TextStyle(color: Colors.blue))
          ]),
          const Divider(),
          GestureDetector(
              onTap: () => _showStateSelectionBottomSheet(context),
              child: _buildRowWithText("State of Supply", _controller.selectedState.value.name?? "Select State")),
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
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: TextFormField(
          controller: _controller.descriptionContr,
          style: TextStyle(color: Colors.black,fontSize: 14.sp),
          decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Add Note',
              border: OutlineInputBorder()),
          maxLines: 3,
        ),
      ),
    );
  }

  Widget _buildAddPhotoContainer() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 110.h,
        color: Colors.white,
        child: InkWell(
          onTap: () => _controller.chooseImage(),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade700)),
            child:
            _controller.imgPath.value !=''?ClipRRect(child: Image.file(File(_controller.imgPath.value),fit: BoxFit.cover,)):
             const Center(
                child: Icon(Icons.add_a_photo, color: Colors.blue, size: 30)),
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
        InkWell(
          onTap: () {
           showPaymentTypeBottom( 
            onClickClose: () => Get.back(),
            onClickCash: () => _controller.setPaymentType("Cash"),onClickCheque: () => _controller.setPaymentType("Cheque"),onClickAddBank: () => Get.to( ()=>AddBankScreen()));
            
          },
          child: Row(children: [
            Icon(icon, color: Colors.green),
            SizedBox(
              width: 7.w,
            ),
            Obx(() {
              return Text(
                _controller.selectedPaymentType.value,
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              );
            }),
            SizedBox(
              width: 7.w,
            ),
            const Icon(Icons.arrow_drop_down)
          ]),
        ),
      ],
    );
  }

  Widget _buildRowWithText(String text, String trailingText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(color: Colors.grey)),
        Row(children: [Text(trailingText,style: TextStyle(color: Colors.black,fontSize: 13.sp),), const Icon(Icons.arrow_drop_down)]),
      ],
    );
  }

  Widget _checkReferenceWidget(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

      Text("Payment Ref No.",style: GoogleFonts.inter(fontSize: 13.sp,color: Colors.black45,fontWeight: FontWeight.w400),),
          SizedBox(
      width: 120.w,
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
            controller: _controller.referenceNoContr,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 12.sp,color: Colors.black45),
              hintText: "Referenc No.",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20.w),
            ),
            
            onChanged: (value) {
             
            
            },
            style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
          ),
        ],
      ),
    )
    ],);
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
            controller: _controller.totalAmountContr,
            decoration: InputDecoration(
              hintText: "₹",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20.w),
            ),
            onChanged: (value) {
              _controller.grandSubTotal.value = double.tryParse(value) ?? 0.0;
              _controller.balanceDue.value = _controller.grandSubTotal.value;
              // double parsedValue = double.tryParse(value) ?? 0.0;
              // totalAmountNotifier.value = parsedValue;
              // if (isReceivedChecked.value) {
              //   receivedAmountNotifier.value = parsedValue;

              // }
            },
            style: TextStyle(fontSize: 15.sp, color: Colorconst.cBlack),
          ),
        ],
      ),
    );
  }

  Widget _buildFormContainer(context) {
    return Obx(
       () {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Obx(() {
                return _buildCustomTextFormField(
                  controller: _controller.customerTxtCont,
                  labelText: _controller.selectedIndex.value == 0
                      ? "Customer *"
                      : "Billing Name *",
                  hintText: _controller.selectedIndex.value == 0
                      ? "Enter Customer"
                      : "Enter Billing Name",
                  keyboardType: TextInputType.emailAddress,
                );
              }),
              SizedBox(height: 25.h),
              _buildCustomTextFormField(
                controller: _controller.phoneNumberController,
                keyboardType: TextInputType.number,
                labelText: "Phone Number",
                hintText: "Enter Phone Number",
              ),
              SizedBox(height: 20.h),
              Column(
                children: List.generate(
                  _controller.itemList.length,
                  (index) {
                    ItemModel obj = _controller.itemList[index];
                    return ItemsCardWidget(
                      discount: obj.discount,
                      itemName: obj.itemName,
                      itemNum: (index + 1).toString(),
                      price: obj.price,
                      quantity: obj.quantity,
                      tax: obj.tax,
                      total: obj.total,
                      discountP: obj.discountP,
                      subtotal: obj.subtotalP,
                    );
                  },
                ),
              ),
              _controller.itemList.length.toInt() == 0
                  ? const SizedBox()
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tatal Disc: ${_controller.grandDiscount}",
                                style: interFontBlack1(
                                  fontsize: 11.sp,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                "Total Tax Amt: ${_controller.grandTax.toStringAsFixed(2)}",
                                style: interFontBlack1(
                                    fontsize: 11.sp, color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tatal Qty: ${_controller.grandQty}",
                                style: interFontBlack1(
                                  fontsize: 11.sp,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                "Subtotal: ${_controller.grandSubTotal}",
                                style: interFontBlack1(
                                    fontsize: 11.sp, color: Colors.black45),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
              SizedBox(
                height: 20.h,
              ),
              AddItemButton(onTap: () {
                _controller.clearItemController();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AddItemToSale()),
                // );
                Get.to(() => AddItemToDeliveryChallan());
              }),
            ],
          ),
        );
      }
    );
  }

  Widget _buildCustomTextFormField(
      {required String labelText,
      required String hintText,
      required TextInputType keyboardType,
    final  TextEditingController? controller
      
      }) {
    return CustomTextFormField(
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      keyboardType: keyboardType ,
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
