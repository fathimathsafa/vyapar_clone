import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../../../../../../core/common/widget/appbar_common.dart';
import '../../../../../../../core/common/widget/custom_text_field.dart';
import '../sub_pro_forma_invoice/add_product/view/add_Product.dart';
import '../sub_pro_forma_invoice/add_signature/view/add_signature.dart';
import '../sub_pro_forma_invoice/adde_bank/view/add_bank.dart';

class ProFormaInvoice extends StatelessWidget {
  const ProFormaInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCom(title: "Create Pro Forma Invoice", action: []),
      backgroundColor: Colorconst.cSecondaryGrey,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 12.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _editCardWidget(),
                  SizedBox(
                    height: 10.h,
                  ),
                  _leftAlignHText(title: "Customer"),
                  SizedBox(
                    height: 9.h,
                  ),
                  _addWidget(text: "Select Customer"),
                  SizedBox(
                    height: 10.h,
                  ),
                  _leftAlignHText(
                      title: "Products", isOnRightDefaultIcon: true),
                  SizedBox(
                    height: 9.h,
                  ),
                  _addWidget(text: "Add Products",onTap: () => Get.to(()=>AddProductScreenS()),),
                  SizedBox(
                    height: 10.h,
                  ),

                  _addCustomerField(),
                  SizedBox(
                    height: 10.h,
                  ),
                  _optionalWidget(),
                  // SizedBox(height: 200.h,)
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_bottomBotton()],
          )
        ],
      ),
    );
  }

  void _adAdddress() {
    Get.bottomSheet(
        // isDismissible: true,

        SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r)),
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.close,
                          size: 20.sp,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 8.h,
                ),
                Divider(
                  height: 1.w,
                  color: Colorconst.cSecondaryGrey,
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 9.h,
                      ),
                      SizedBox(
                          height: 40.h,
                          child: customTextFormFieldNew(labelText: "Title")),
                      SizedBox(height: 7.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Autofill Company Name",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 9.h),

                      SizedBox(
                          height: 40.h,
                          child: customTextFormFieldNew(
                              labelText: "Address Line 1 *")),
                      SizedBox(height: 9.h),
                      SizedBox(
                          height: 40.h,
                          child: customTextFormFieldNew(
                              labelText: "Address Line 2")),
                      SizedBox(height: 9.h),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                                height: 40.h,
                                child: customTextFormFieldNew(
                                    labelText: "Pincode")),
                          ),
                          Container(
                            color: const Color.fromARGB(255, 38, 48, 234),
                            height: 40.h,
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                "Fetch Details",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                          )
                        ],
                      ),

                      SizedBox(height: 9.h),
                      SizedBox(
                          height: 40.h,
                          child: customTextFormFieldNew(labelText: "City")),
                      SizedBox(height: 9.h),
                      SizedBox(
                          height: 40.h,
                          child: customTextFormFieldNew(labelText: "State *")),
                      SizedBox(height: 9.h),
                      SizedBox(
                          height: 40.h,
                          child: customTextFormFieldNew(labelText: "Notes")),
                      // SizedBox(height: 9.h),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: const Color.fromARGB(255, 54, 15, 225)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text("Save & Update",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),

                // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void _signatureDetails() {
    Get.bottomSheet(
        isDismissible: true,
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        topRight: Radius.circular(13.r)),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Signature",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              size: 20.sp,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                   
          
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(
                      height: 1.w,
                      color: Colorconst.cSecondaryGrey,
                    ),
          
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 9.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
          
                            Get.to(()=>const AddSignatureScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.w,
                                      color: Colorconst.cSecondaryGrey),
                                  borderRadius: BorderRadius.circular(7.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 8.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: 18.w,
                                        width: 18.w,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          radius: 9.r,
                                          child: Icon(
                                            Icons.add,
                                            size: 14.sp,
                                            color: Colors.white,
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Add New",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 7.h,),
                          InkWell(
                            onTap: () {
                             
          
                            
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.w,
                                      color: Colorconst.cSecondaryGrey),
                                  borderRadius: BorderRadius.circular(7.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    

                                    Container(decoration: BoxDecoration(
                                      border: Border.all(width: 1.w,color: Colors.blue),
                                      borderRadius: BorderRadius.circular(30.r)),
                                      
                                      child: Padding(
                                        padding:  EdgeInsets.all(1.r),
                                        child: CircleAvatar(
                                          radius: 4.r,
                                          backgroundColor: Colors.blue,),
                                      ),
                                      ),
                                      SizedBox(width: 6.w,),
                                      Text(
                                      "No Signature",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                   
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
          
                  
                    SizedBox(
                      height: 7.h,
                    ),
          
                    // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  void _bankDetails() {
    Get.bottomSheet(
        isDismissible: true,
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        topRight: Radius.circular(13.r)),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Bank",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              size: 20.sp,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                   
          
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(
                      height: 1.w,
                      color: Colorconst.cSecondaryGrey,
                    ),
          
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 9.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
          
                            Get.to(()=> AddBankScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.w,
                                      color: Colorconst.cSecondaryGrey),
                                  borderRadius: BorderRadius.circular(7.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 8.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: 18.w,
                                        width: 18.w,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          radius: 9.r,
                                          child: Icon(
                                            Icons.add,
                                            size: 14.sp,
                                            color: Colors.white,
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Add New Bank",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 7.h,),
                          InkWell(
                            onTap: () {
                             
          
                            
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.w,
                                      color: Colorconst.cSecondaryGrey),
                                  borderRadius: BorderRadius.circular(7.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cash",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),

                                    Container(decoration: BoxDecoration(
                                      border: Border.all(width: 1.w,color: Colors.blue),
                                      borderRadius: BorderRadius.circular(30.r)),
                                      
                                      child: Padding(
                                        padding:  EdgeInsets.all(1.r),
                                        child: CircleAvatar(
                                          radius: 4.r,
                                          backgroundColor: Colors.blue,),
                                      ),
                                      )
                                   
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
          
                  
                    SizedBox(
                      height: 7.h,
                    ),
          
                    // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  void _addressDetails() {
    Get.bottomSheet(
        isDismissible: true,
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.r),
                      topRight: Radius.circular(13.r)),
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Dispatch Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            size: 20.sp,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.w),
                      child: Text(
                        "Xiatech",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 8.h,
                  ),
                  Divider(
                    height: 1.w,
                    color: Colorconst.cSecondaryGrey,
                  ),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 9.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();

                            _adAdddress();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.w,
                                    color: Colorconst.cSecondaryGrey),
                                borderRadius: BorderRadius.circular(7.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 8.h),
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 18.w,
                                      width: 18.w,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 9.r,
                                        child: Icon(
                                          Icons.add,
                                          size: 14.sp,
                                          color: Colors.white,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Add Shipping Address",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: const Color.fromARGB(255, 54, 15, 225)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Text("Save",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),

                  // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
                ],
              ),
            ),
          ],
        ));
  }

  void _addRefference() {
    Get.bottomSheet(
        isDismissible: true,
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        topRight: Radius.circular(13.r)),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Add Reference",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 8.w,),
                              Icon(Icons.error,color: Colors.grey,size: 14.sp,)
                            ],
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              size: 20.sp,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 1.w,
                      color: Colorconst.cSecondaryGrey,
                    ),
          
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                      child: Column(
                        children: [
                          customTextFormFieldNew(
                        
                            labelText: "Reference",
                            maxLines: 6,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                        
                        ],
                      ),
                    ),
          
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: const Color.fromARGB(255, 54, 15, 225)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: Text("Submit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
          
                    // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  void _termsCondition() {
    Get.bottomSheet(
        isDismissible: true,
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        topRight: Radius.circular(13.r)),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 8.w,),
                              Icon(Icons.error,color: Colors.grey,size: 14.sp,)
                            ],
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              size: 20.sp,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 1.w,
                      color: Colorconst.cSecondaryGrey,
                    ),

                    SizedBox(height: 8.h,),
          
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, ),
                      child: Column(
                        children: [
                          customTextFormFieldNew(
                        
                            labelText: "Add Terms",
                            maxLines: 6,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                        
                        ],
                      ),
                    ),
                     Padding(
                        padding:
                          EdgeInsets.symmetric(horizontal: 13.w, ),
                       child: Row(
                              children: [
                                SizedBox(
                                    height: 18.w,
                                    width: 18.w,
                                    child: const Checkbox(
                                        checkColor: Colors.blue,
                                        hoverColor: Colors.blue,
                                        activeColor: Colors.blue,
                                        autofocus: true,
                                        value: false,
                                        onChanged: null)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Save For Future",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                     ),
          
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: const Color.fromARGB(255, 54, 15, 225)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: Text("Save",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
          
                    // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  void _addNoteBottomSheet() {
    Get.bottomSheet(
        isDismissible: true,
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.r),
                      topRight: Radius.circular(13.r)),
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notes",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            size: 20.sp,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.w,
                    color: Colorconst.cSecondaryGrey,
                  ),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                    child: Column(
                      children: [
                        customTextFormFieldNew(
                          hintText: "Add Notes",
                          labelText: "Add Notes",
                          maxLines: 6,
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                height: 18.w,
                                width: 18.w,
                                child: const Checkbox(
                                    checkColor: Colors.blue,
                                    hoverColor: Colors.blue,
                                    activeColor: Colors.blue,
                                    autofocus: true,
                                    value: false,
                                    onChanged: null)),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Save for Future",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: const Color.fromARGB(255, 54, 15, 225)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Text("Save",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),

                  // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _bottomBotton() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Amount",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 9.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "₹ 0.00",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(6.r)),
              child: Padding(
                padding: EdgeInsets.all(6.0.r),
                child: Row(
                  children: [
                    Text(
                      "Create",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 11.sp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _addCustomerField() {
    return Container(
      decoration: BoxDecoration(
          color: Colorconst.cSecondaryBlue,
          borderRadius: BorderRadius.circular(7.r)),
      child: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: Row(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Custom Fields",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Personalize to perfectly suit your style",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 9.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
            Icon(
              Icons.headphones_outlined,
              size: 22.sp,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }

  Widget _optionalWidget() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Optional",
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                    radius: 7.r,
                    backgroundColor: Colors.black54,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 11.sp,
                    )),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  "Additional Charges",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 9.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), color: Colors.white),
          child: Column(
            children: [
              _optionalOptionWdget(
                centerTitle: "Select Despatch Address",
                onTap: () => _addressDetails(),
              ),
              _optionalOptionWdget(
                  letfIcon: Icons.account_balance_outlined,
                  topTitle: "Bank",
                  bottomTitle: "Cash",
                  rightText: "Change",
                  onTap: () => _bankDetails(),
                  ),
              _optionalOptionWdget(
                centerTitle: "Select Signature",
                letfIcon: Icons.draw_outlined,
                onTap: () =>_signatureDetails() ,
              ),
              _optionalOptionWdget(
                  centerTitle: "Add Reference", letfIcon: Icons.book_online
                  
                  ,onTap: () => _addRefference(),
                  ),
              _optionalOptionWdget(
                centerTitle: "Add Notes",
                letfIcon: Icons.note_add_outlined,
                onTap: () => _addNoteBottomSheet(),
              ),
              _optionalOptionWdget(
                  centerTitle: "Add Terms", letfIcon: Icons.document_scanner,
                  
                  onTap: () => _termsCondition(),
                  ),
              _optionalOptionWdget(
                  centerTitle: "Add Delivery / Shipping Charges",
                  letfIcon: Icons.currency_rupee_sharp),
              _optionalOptionWdget(
                  centerTitle: "add Packaging Charges",
                  letfIcon: Icons.currency_rupee_sharp),
              _optionalOptionWdget(
                  centerTitle: "Extra Dixcount/ Apply Coupon",
                  letfIcon: Icons.percent_sharp),
            ],
          ),
        )
      ],
    );
  }

  Widget _optionalOptionWdget(
      {Function()? onTap,
      IconData? letfIcon,
      String? centerTitle,
      String? topTitle,
      String? bottomTitle,
      String? rightText}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 7.h),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              letfIcon ?? Icons.airport_shuttle_rounded,
                              size: 18.sp,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            centerTitle == ""
                                ? const SizedBox()
                                : Text(
                                    centerTitle ?? "",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.inter(
                                        fontSize: 11.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600),
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topTitle ?? "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      fontSize: 9.sp,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  bottomTitle ?? "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        rightText ?? "",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Divider(
                height: 1.w,
                color: Colorconst.cSecondaryGrey,
              ),
              SizedBox(
                height: 4.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _addWidget({String? text,Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7.r)),
        child: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 8.r,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 12.sp,
                  )),
              SizedBox(
                width: 6.w,
              ),
              Text(
                text ?? "Edit",
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _leftAlignHText(
      {String? title, Icon? rightIcon, bool? isOnRightDefaultIcon}) {
    return Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              title ?? "PFI-1",
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 6.w,
            ),
            rightIcon ?? const SizedBox(),
            isOnRightDefaultIcon == true
                ? Icon(
                    Icons.error,
                    size: 16.sp,
                    color: Colors.black54,
                  )
                : const SizedBox()
          ],
        ));
  }

  Widget _editCardWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7.r)),
      child: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: Row(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pro Forma Invoice #",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 9.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "PFI-1",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "03-10-2024",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 9.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Edit",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const Text(""),
                SizedBox(
                  height: 4.h,
                ),
                const Text(""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
