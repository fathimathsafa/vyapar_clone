import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class GenralSettingScreen extends StatelessWidget {
  const GenralSettingScreen({super.key});
  final int sIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Colors,
      appBar: AppBar(
        backgroundColor: Colorconst.cSecondaryBlue,
        elevation: 0,
        title: Text(
          "Genral",
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
        actions: [
          SizedBox(
            width: 13.w,
          ),
          Icon(
            Icons.search,
            size: 22.sp,
            color: Colors.black,
          ),
          SizedBox(
            width: 13.w,
          ),
        ],
      ),
      body: Container(
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
              headerBlue(),
          
              applicationSetings(),
              headerBlue(headerName: "Security"),
              
              securitySetting(),
              Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
               headerBlue(headerName: "Multifirm"),
              multiFirmSetting(),
              Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
               headerBlue(headerName: "Stock Transfer Between Godowns"),
              stockTransferBtSetting(),
              Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
               headerBlue(headerName: "Backup"),
               backupSetting(),
          
              Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
          
              moreTransaction()
             
            ],
          ),
        ),
      ),
    );
  }

  Widget moreTransaction(){

    return Column(children: [
       headerBlue(headerName: "More Transactions"),

       settingsRows(leftRow: [
              Text(
                "Estimate/(Proforma Invoice)",
                style: settingTxtStyle(),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.error,
                size: 12.sp,
                color: Colors.grey,
              )
            ], rightRow: [
             
              Icon(
                Icons.toggle_on_outlined,
                size: 30.sp,
                color: Colors.blue,
              )
            ]),

            Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),


    ],);
  }

  Widget applicationSetings(){
    return Column(children: [
       settingsRows(leftRow: [
              Text(
                "App Language",
                style: settingTxtStyle(),
              )
            ], rightRow: [
              Text(
                "English",
                style: optionsTextStyle(),
              ),
              SizedBox(
                width: 14.w,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 20.sp,
                color: Colors.black,
              )
            ]),
            Divider(
              color: Colorconst.cSecondaryGrey,
              height: 1.w,
            ),
            settingsRows(leftRow: [
              Text(
                "Business Currency",
                style: settingTxtStyle(),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.error,
                size: 12.sp,
                color: Colors.grey,
              )
            ], rightRow: [
              Text(
                "₹",
                style: optionsTextStyle(),
              ),
              SizedBox(
                width: 14.w,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 20.sp,
                color: Colors.black,
              )
            ]),
            Divider(
              color: Colorconst.cSecondaryGrey,
              height: 1.w,
            ),
            settingsRows(leftRow: [
              Text(
                "Decimal Places",
                style: settingTxtStyle(),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.error,
                size: 12.sp,
                color: Colors.grey,
              )
            ], rightRow: [
              Text(
                "-",
                style: optionsTextStyle(
                  fontWeight: FontWeight.w300,
                  textSize: 14.sp,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Column(
                children: [
                  Text(
                    "2",
                    style: optionsTextStyle(),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 1.w,
                    width: 10.w,
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                "+",
                style: optionsTextStyle(),
              ),
            ]),
            Divider(
              color: Colorconst.cSecondaryGrey,
              height: 1.w,
            ),
            settingsRows(leftRow: [
              Text(
                "Date Format",
                style: settingTxtStyle(),
              ),
             
            ], rightRow: [
              Text(
                "dd/MM/yyyy",
                style: optionsTextStyle(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                width: 14.w,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 20.sp,
                color: Colors.black,
              )
            ]),
            Divider(
              color: Colorconst.cSecondaryGrey,
              height: 1.w,
            ),
            settingsRows(leftRow: [
              Text(
                "Show warning for unsaved changes",
                style: settingTxtStyle(),
              ),
             
            ], rightRow: [
             
              Icon(
                Icons.toggle_on_outlined,
                size: 30.sp,
                color: Colorconst.cBlue,
                
              )
            ]),
            Divider(
              color: Colorconst.cSecondaryGrey,
              height: 1.w,
            ),
            settingsRows(leftRow: [
              Text(
                "Change Vyapar Theme",
                style: settingTxtStyle(),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.error,
                size: 12.sp,
                color: Colors.grey,
              )
            ], rightRow: [
              Text(
                "Modern",
                style: optionsTextStyle(),
              ),
              SizedBox(
                width: 14.w,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 20.sp,
                color: Colors.black,
              )
            ]),
            Divider(
              color: Colorconst.cSecondaryGrey,
              height: 1.w,
            )

    ],);
  }

  Widget securitySetting(){

    return settingsRows(leftRow: [
              Text(
                "Passcode/FingerPrint(if present)",
                style: settingTxtStyle(),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.error,
                size: 12.sp,
                color: Colors.grey,
              )
            ], rightRow: [
             
              Icon(
                Icons.toggle_off_outlined,
                size: 30.sp,
                color: Colors.grey,
              )
            ]);
  }
  Widget multiFirmSetting(){

    return settingsRows(leftRow: [
              Text(
                "Multifirm Settings",
                style: settingTxtStyle(),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.error,
                size: 12.sp,
                color: Colors.grey,
              ),
              SizedBox(width: 5.w,),

               CircleAvatar(
                          radius: 5.r,
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(
                            FontAwesomeIcons.crown,
                            size: 6.sp,
                            color: Colors.grey,
                          ),
                        ),
            ], rightRow: [
             
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12.sp,
                color: Colors.black,
              )
            ]);
  }
  Widget stockTransferBtSetting(){

    return settingsRows(leftRow: [
              Text(
                "Godown management & Stock transfer ",
                style: settingTxtStyle(),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.error,
                size: 12.sp,
                color: Colors.grey,
              ),
              SizedBox(
                width: 4.w,
              ),
            CircleAvatar(radius: 2.r,backgroundColor: Colors.red,),
            CircleAvatar(
                          radius: 4.r,
                          backgroundColor: Colors.amber[300],
                          child: Icon(
                            FontAwesomeIcons.crown,
                            size: 6.sp,
                            color: Colors.black,
                          ),
                        ),

            ], rightRow: [
             
              Icon(
                Icons.toggle_off_outlined,
                size: 30.sp,
                color: Colors.grey,
              )
            ]);
  }
  Widget backupSetting(){

    return settingsRows(leftRow: [
              Text(
                "Backup Settings ",
                style: settingTxtStyle(),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.error,
                size: 12.sp,
                color: Colors.grey,
              )
            ], rightRow: [
             
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12.sp,
                color: Colors.black,
              )
            ]);
  }

  TextStyle settingTxtStyle() {
    return GoogleFonts.inter(
        wordSpacing: -2.w,
        color: Colors.black87,
        fontSize: 13.sp,
        fontWeight: FontWeight.w500);
  }

  TextStyle optionsTextStyle(
      {Color? color,
      FontWeight? fontWeight,
      TextDecoration? textDecoration,
      double? textSize,
      double? hieght}) {
    return GoogleFonts.inter(
        height: hieght,
        wordSpacing: -2.w,
        color: color ?? Colors.black87,
        decoration: textDecoration,
        fontSize: textSize ?? 11.sp,
        fontWeight: fontWeight ?? FontWeight.w300);
  }

  Widget headerBlue({String? headerName}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colorconst.cSecondaryBlue,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 6.h, top: 10.h, left: 15.w, right: 15.w),
              child: Text(
                headerName ?? "Application",
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget settingsRows({List<Widget>? leftRow, List<Widget>? rightRow}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: leftRow ?? [],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: rightRow ?? [],
          )
        ],
      ),
    );
  }
}
