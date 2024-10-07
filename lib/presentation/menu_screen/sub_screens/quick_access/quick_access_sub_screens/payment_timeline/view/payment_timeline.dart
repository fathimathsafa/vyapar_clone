import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/common/widget/appbar_common.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';



class PaymentTimelineScreen extends StatelessWidget {
  const PaymentTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: appBarCom(
          title: "Payment Timeline",
          bacGroundColor: Colors.white,
          action: [
            Icon(
              Icons.search,
              size: 22.sp,
            ),
            SizedBox(
              width: 10.w,
            )
          ]),
      body: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding:  EdgeInsets.all(10.r),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r), color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Net Balance",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "₹ 0",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "You Received",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "₹ 0",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You Gave",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "₹ 0",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Divider(
                      color: Colorconst.cSecondaryGrey,
                      height: 1.w,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => _dateFilterBottomSheet(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "This Year",
                                    style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Transform.rotate(
                                      angle: -1.55,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        size: 14.sp,
                                        color: Colors.black,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "(01-01-2024 - 31-12-2024)",
                                style: GoogleFonts.inter(
                                    color: Colors.black54,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.solidFileExcel,
                                  size: 25.sp,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                GestureDetector(
                                  onTap: () => _pdfPro(),
                                  child: Icon(
                                    FontAwesomeIcons.solidFilePdf,
                                    size: 25.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _dateFilterBottomSheet(){

     Get.bottomSheet(
      
      SingleChildScrollView(
        child: FractionallySizedBox(
         
             
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
               
               
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r), topRight: Radius.circular(13.r)),
                    color: Colors.white),
                child: Column(
                  children: [
                    
                    SizedBox(height: 10.h,),
                   
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date Filter",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                // InkWell(
                                //   onTap: () => Get.back(),
                                //   child: Icon(
                                //     Icons.close,
                                //     size: 20.sp,
                                //     color: Colors.black54,
                                //   ),
                                // )
                              ],
                            ),
                            
                        
                            
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Column(children: List.generate(
                      
                      8, (index) => Column(children: [
                        _dateFilterTextWidget(text: "This Week"),
                    SizedBox(height: 10.h,),
                    ],),),),
                  
                   
                   
                    
                    
                            
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colorconst.cRed),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                child: Text("APPLY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                            
                    
                            
                    
                    SizedBox(height: 7.h,)
                            
                    // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
  }

  void _pdfPro() {
    Get.bottomSheet(SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
           
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r), topRight: Radius.circular(13.r)),
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 10.h,),
                SizedBox(
                  // height: 160.h,
                  child: Icon(FontAwesomeIcons.solidFilePdf,size: 90.sp,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Download PDF",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          // InkWell(
                          //   onTap: () => Get.back(),
                          //   child: Icon(
                          //     Icons.close,
                          //     size: 20.sp,
                          //     color: Colors.black54,
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(height: 12.h,),

                       Align(
                        alignment: Alignment.topLeft,
                         child: Text(
                          textAlign: TextAlign.left,
                              "Genrate and share professional PDF reports in a single click",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                       ),

                      
                    ],
                  ),
                ),
                SizedBox(height: 12.h,),
                _quickAccessEwayCheckTextWidget(text: "Easily download the comoplete list of in a single PDF for seamless management."),
                SizedBox(height: 10.h,),
                _quickAccessEwayCheckTextWidget(text: "Generate adn share professioinal PDF reports in a single click."),
                SizedBox(height: 10.h,),
                _quickAccessEwayCheckTextWidget(text: "No limits on how many times you can download."),
                SizedBox(height: 10.h,),
               
                
                
          
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colorconst.cRed),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            child: Text("Subscribe to PRO now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
          
                
          
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.headset_mic_outlined,size: 16.sp,),
                      SizedBox(width: 7.w,),
                      Text(
                        "Talk to a specialist",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),
                     
                    ],
                  ),
                ),
                SizedBox(height: 7.h,)
          
                // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
              ],
            ),
          ),
        ],
      ),
    ));
  }
 Widget _quickAccessEwayCheckTextWidget({String? text}){

    return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,size: 17.sp,),
                      SizedBox(width: 7.w,),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          text?? "Easily create E-way bills with a click.",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                );
  }

  Widget _dateFilterTextWidget({String? text}){

    return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.circle_outlined,size: 17.sp,color: Colors.blue,),
                      SizedBox(width: 7.w,),
                      Text(
                        text?? "Easily create E-way bills with a click.",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                );
  }
}
