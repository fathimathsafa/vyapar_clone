import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/loading_var.dart';
import 'package:vyapar_clone/core/common/widget/add_button_green.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/images.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/purchase/purchase_list_screen/sub_screens/add_purchase_screen/view/add_purchase_screen.dart';

import '../sub_screens/add_purchase_screen/controller/controller.dart';





class PurchaseListScreen extends StatelessWidget {
  PurchaseListScreen({super.key});
final controller = Get.put(AddPurchaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          controller.fetchAllPurchase();
        },
        child: CircleAvatar(
          radius: 30.r,
          child:const Icon(Icons.refresh_outlined),),
      ),
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: ()=> Get.back(), icon:const Icon(Icons.arrow_back)),
        title:const Text("Purchase List"),
        actions: [Icon(Icons.search_outlined,color: Colors.black54,size: 23.sp,),SizedBox(width: 20.w,),
        Icon(Icons.picture_as_pdf,color: Colors.red,size: 23.sp,),
        SizedBox(width: 10.w,)
        ],
       
      ),
      body: Column(
        children: [
          SizedBox(height: 12.h,),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                   borderRadius: BorderRadius.circular(4.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 9.h,horizontal: 7.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                            "Total Purchase",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 9.sp),
                          ),
                          SizedBox(height: 
                          4.h,),
                    Text(
                            "₹ 0.00",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14.sp,fontWeight: FontWeight.w600),
                          ),
                         
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(
             () {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child:isLoading.value? const Center(child: CircularProgressIndicator()): controller.purchaseList.length.toInt()==0? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Imageconst().setImage(
                          imageName: "images-removebg-preview.png",
                          width: double.infinity,
                          hieght: 100.h),
                      Text(
                        "No Data Available",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        "No purchase details are available. Please try again after making a purchase.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                     
                    ],
                  ):ListView.builder(
                    itemCount: controller.purchaseList.length,
                    itemBuilder: (context, index) {
                      var obj = controller.purchaseList[index];
                    return ListTile(title: Text(obj.partyName.toString()),);
                  },),
                ),
              );
            }
          ),

           Padding(
             padding:  EdgeInsets.only(bottom: 12.h),
             child: AddButtonGreen(
              backgroundColor: Colorconst.cRed,
              iconBackGroundColor: Colorconst.cRed,
              icon: Icons.add ,
              iconColor: Colors.white,
              text: "Add Purchase ",
                      onTap: () => Get.to(() => AddPurchaseScreen(

                      )),
                    ),
           )
        ],
      ),
    );
  }
}