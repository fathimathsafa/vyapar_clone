import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../core/constatnts/colors.dart';
import '../../../core/constatnts/text_style.dart';

import '../../../model/invoice_model.dart';

class InvoiceCard extends StatelessWidget {
  InvoiceCard(
      {super.key,
      this.object,
      this.deleteFunction
      
      });
 final InvoiceModel? object;
 final Function()?deleteFunction;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      object!.partyName.toString() ?? "blue sky tech legal solutions",
                      style:
                          interFontBlack(context, color: Colors.black, fontsize: 12.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colorconst.cGreen,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: Text("SALE",
                            style: interFontBlack(context,
                                color: Colors.green, fontsize: 10.sp)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      object!.invoiceNo ?? "#23-24-01 15",
                      style: interFontBlack(context,
                          color: Colorconst.cGrey, fontsize: 10.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      object!.invoiceDate.toString() ?? "07 Sep, 24",
                      style: interFontBlack(context,
                          color: Colorconst.cGrey, fontsize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: interFontBlack(context,
                          color: Colorconst.cGrey, fontsize: 10.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      object!.totalAmount.toString()?? "",
                      style:
                          interFontBlack(context, color: Colors.black, fontsize: 14.sp),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balance",
                      style: interFontBlack(context,
                          color: Colorconst.cGrey, fontsize: 10.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      object!.balanceAmount.toString(),
                      style:
                          interFontBlack(context, color: Colors.black, fontsize: 14.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.print_outlined,
                      size: 23.sp,
                      color: Colorconst.cGrey,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Transform(
                      transform: Matrix4.diagonal3Values(-1, 1, 1),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.reply_outlined,
                        size: 23.sp,
                        color: Colorconst.cGrey,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        size: 23.sp,
                        color: Colorconst.cGrey,
                      ),
                      onSelected: (value) {
                        if (value == 'Edit') {
                        } else if (value == 'Delete') {
                          showDeleteBottomSheet(object??InvoiceModel());
                        } else if (value == 'Update') {}
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 'Edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 'Delete',
                          child: Text('Delete'),
                        ),
                        const PopupMenuItem(
                          value: 'Update',
                          child: Text('Update'),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteBottomSheet(InvoiceModel object){

    Get.bottomSheet(Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r)),
                                  
                                  height: 150.h,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                                    child: Column(
                                      children: [
                                        Icon(Icons.delete_forever_outlined,size: 35.sp,color: Colors.red,),
                                        Row(
                                          children: [
                                            
                                            Expanded(
                                              child: SizedBox(
                                                child: Text(
                                                  "Are you sure want to delete ${object.partyName.toString()} bill ?",
                                                  style:
                                                      TextStyle( color:  Colors.black87,fontSize: 15.sp),
                                                      textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                Get.back();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(8.r),
                                                    color: Colors.blue),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w, vertical: 7.h),
                                                  child: Text(
                                                    "Cencel",
                                                    style:
                                                        TextStyle(color:  Colors.white,fontSize: 13.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                           
                                            InkWell(
                                              onTap: deleteFunction,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(8.r),
                                                    color: Colors.blue),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w, vertical: 7.h),
                                                  child: Text(
                                                    "Delete",
                                                    style:
                                                        TextStyle(color:  Colors.white,fontSize: 13.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
  }
}