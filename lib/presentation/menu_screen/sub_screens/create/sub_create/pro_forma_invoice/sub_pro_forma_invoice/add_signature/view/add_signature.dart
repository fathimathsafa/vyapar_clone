import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../../../../../../../../core/common/widget/appbar_common.dart';



class AddSignatureScreen extends StatelessWidget {
  const AddSignatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCom(title: "Add Signature", action: []),
      backgroundColor: Colorconst.cSecondaryGrey,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 12.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r)),

                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),
                        child: Column(children: [
                          Row(children: [
                            Text("Signature",style: GoogleFonts.inter(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500),)
                          ],),

                          SizedBox(height: 25.h,),

                          Card(
                            
                            color: Colors.white,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                              child: Column(
                                children: [
                                  Icon(Icons.draw_outlined,size: 100.sp,color: Colors.grey,),
                              
                                  Text("Upload your Signature",style: GoogleFonts.inter(fontSize: 14.sp,color: const Color.fromARGB(255, 31, 71, 246),fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ),),

                            Text("You can change image by tapping on image *",style: GoogleFonts.inter(fontSize: 9.sp,color: Colors.black54,fontWeight: FontWeight.w600),),

                            SizedBox(height: 10.h,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Signature name *",textAlign: TextAlign.left, style: GoogleFonts.inter(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w600),)),

                              SizedBox(height: 7.h,),
                              SizedBox(
                                height: 40.h,
                                child: customTextFormFieldNew(maxLines: 1,labelText: "Please enter signature name")),

                                  SizedBox(height: 10.h,),
                                Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Default",textAlign: TextAlign.left, style: GoogleFonts.inter(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w600),),

                                    Icon(Icons.toggle_on_outlined,size: 40.sp,color: Colors.blue,)
                                  ],
                                ),
                                Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("With stamp",textAlign: TextAlign.left, style: GoogleFonts.inter(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.w600),),

                                    Icon(Icons.toggle_off_outlined,size: 40.sp,color: Colors.grey,)
                                  ],
                                ),

                        
                        ],),
                      ),
                  ),
                  SizedBox(height: 10.h,),


                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("*Folows the below steps to generate a digital signature",textAlign: TextAlign.left, style: GoogleFonts.inter(fontSize: 11.sp,color: Colors.black,fontWeight: FontWeight.w600),)),

                    SizedBox(height: 8.h,),

                    _stpeWidget(text: "1. Grab a white paper and sign it."),
                    _stpeWidget(text: '2. Click "Upload signature."',),
                    _stpeWidget(text: '3. Choose "Camera" or "Gallery." '),
                    _stpeWidget(text: "4. Take a well-lit photo of your signature or pick one from the gallery."),
                    _stpeWidget(text: "5. Crop the image to show only the signature."),
                    _stpeWidget(text: "6. Check the result. If it's not good, try again until you're happy with it."),


                
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //  _bottomBotton()
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: const Color.fromARGB(255, 54, 15, 225)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Text("Add Signature",
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
               SizedBox(height: 7.h,),
            ],
          )
        ],
      ),
    );
  }
  Widget _stpeWidget({String? text}){

    return   Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 7.h),
        child: Text(text?? "1. ",style: _stepTextStyle(),),
      ));
  }
TextStyle _stepTextStyle(){

  return GoogleFonts.inter(fontSize: 12.sp,color: Colors.black54,fontWeight: FontWeight.w600);
}
}
