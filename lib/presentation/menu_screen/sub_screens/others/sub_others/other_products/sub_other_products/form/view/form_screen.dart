import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';



class FormScreen extends StatelessWidget {
  const FormScreen({super.key});
  final int sIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: Padding(
        //   padding: EdgeInsets.all(9.0.r),
        //   child: GestureDetector(
        //       onTap: () => Get.back(),
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Colors.white,
        //       size: 16.sp,
        //     ),
        //   ),
        // ),
        title: Text(
          "Webstore",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.close,
              size: 20.sp,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
                      SizedBox(
                        height: 30.h,
                      ),
                       Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 14.w),
                         child: Column(
                           children: [
                             CustomTextFormField(
                             
                              labelText: "Name *",
                              hintText: "Enter name",
                             ),
                              SizedBox(height: 12.h,),
                             CustomTextFormField(
                             
                              labelText: "Enter Email",
                              hintText: "Enter Email",
                             ),
                              SizedBox(height: 12.h,),
                             CustomTextFormField(
                             
                              labelText: "Enter Mobile Number",
                              hintText: "Enter Mobile Number",
                            
                             ),
                              SizedBox(height: 12.h,),
                             CustomTextFormField(
                             
                              labelText: "Enter Pincode",
                              hintText: "",
                             ),
                             SizedBox(height: 12.h,),
                             CustomTextFormField(
                              isEditable: false,
                              labelText: "Choose Service",
                              hintText: "",
                              suffixIconWidget:  Transform.rotate(
                                          angle: -1.55,
                                          child: Icon(
                                            Icons.arrow_back_ios_new_outlined,
                                            size: 10.sp,
                                            color: Colorconst.cBlue,
                                          )),
                             ),
                           ],
                         ),
                       ),
                  
                      
                    ],
                  ),
                ),
              ),
            ],
          ),

          InkWell(
                // onTap: () => Get.to(()=>VyaparLicenceScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.r),
                              color: Colors.black26),
                    
                           child: Padding(
                             padding:  EdgeInsets.symmetric(vertical: 12.h,horizontal: 0.w),
                             child: Text("Apply Now",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500)),
                           ),   
                    
                    ),
                  ),
                
                ],),
              )
        ],
      ),
    );
  }

}
