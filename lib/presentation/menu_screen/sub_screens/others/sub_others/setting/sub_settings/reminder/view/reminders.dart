import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class RemidersScreen extends StatelessWidget {
  const RemidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorconst.cSecondaryBlue,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Reminders",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
          leading: Padding(
            padding: EdgeInsets.all(9.0.r),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: CircleAvatar(
                  radius: 10.r,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 16.sp,
                  )),
            ),
          ),
          // actions: [
          //   Icon(
          //     Icons.search,
          //     size: 22.sp,
          //     color: Colors.black,
          //   ),
          //   SizedBox(
          //     width: 13.w,
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                height: 1.w,
                color: Colorconst.cSecondaryGrey,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Payment Reminders",
                            style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14.sp,
                          color: Colorconst.cBlue,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment Reminders",
                                    style: GoogleFonts.inter(
                                        fontSize: 13.sp,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  CircleAvatar(
                                    radius: 8.r,
                                    backgroundColor: Colors.amber,
                                    child: Icon(
                                      FontAwesomeIcons.crown,
                                      size: 9.sp,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 14.sp,
                              color: Colorconst.cBlue,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Benefits of Service Reminders:",
                              style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _iconText(),
                              _iconText(
                                  text: "Don't lose ",
                                  text2: "customers",
                                  iconData: Icons.person_outline),
                              _iconText(
                                  text: "Grow your ",
                                  text2: "business",
                                  iconData: Icons.gpp_good_outlined),
                            ],
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                ),
              ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: Container(
                  
                             decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 6.h),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(children: [
                          Container(width: 120.w,
                          
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Colors.red.shade300,
                            borderRadius: BorderRadius.circular(15.r)),
                          ),
                          SizedBox(width: 10.w,),
                                          
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("How does Services Reminders work in Vyapar?",style: TextStyle(color: Colors.black,fontSize: 10.sp,fontWeight: FontWeight.w400),),
                            Row(
                              children: [
                                Text("Watch Video",style: TextStyle(color: Colorconst.cRed,fontSize: 10.sp,fontWeight: FontWeight.w500),),
                        
                                SizedBox(width: 5.w,),
                                CircleAvatar(
                                  backgroundColor: Colorconst.cRed,
                                  radius: 6.r,
                                  child: Icon(Icons.arrow_forward_ios_outlined, size: 7.sp,color: Colors.white,))
                              ],
                            )
                          ],))
                        ],),
                      ),
                    ),
                          ),
                )
            ],
          ),
        ));
  }

  Widget _iconText({String? text, String? text2, IconData? iconData}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colorconst.cSecondaryBlue,
          radius: 15.r,
          child: Icon(
            iconData ?? Icons.notifications_outlined,
            size: 17.sp,
            color: Colorconst.c0a7aa7Blue,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text ?? "Remind your",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              text2 ?? "parties",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}
