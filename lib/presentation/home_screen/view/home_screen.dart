import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/home_screen/controller/home_screen_controller.dart';

import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/sale_list.dart';
import 'package:vyapar_clone/repository/app_data/database/db.dart';


import '../sub_screens/party details/party_details.dart';
import '../widget/header.dart';
import '../widget/header_buttons.dart';

class HomeScreen extends StatelessWidget {
  final Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    final HomeController _controller =
        Get.put(HomeController(repository: repository));
    // return Obx(() {
    //   int index = _controller.screenIndex.value;
    //   if (index == 0) {
    //     return SaleListScreen();
    //   } 
      
    //  else {
    //     return Center(child: Text("No Widget found"));
    //   }
    // });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const HeaderWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Obx(
                         () {
                            return Row(
                              children: [
                                HeaderButtons(
                                  index: 0,
                                  selectedIndex: _controller.tabIndex.value,
                                  onSingleTap: () => _controller.settabIndexValue(0),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                HeaderButtons(
                                  butnTxt: "Party Details",
                                  index: 1,
                                  selectedIndex:  _controller.tabIndex.value,
                                  onSingleTap: ()=> _controller.settabIndexValue(1),
                                )
                              ],
                            );
                          }
                        ),
                      ),

                     
                      SizedBox(
                        height: 15.h,
                      )
                    ],
                  ),
                ),
                 Expanded(
                    child: TabBarView(
                      
                  controller: _controller.tabController,
                  children: [
                SaleListScreen(),
                PartyDetails()
                  
                  
                  ],
                ))
              ],
            ),
            // Positioned(
            //   bottom: 16.0,
            //   left: MediaQuery.of(context).size.width / 3.2,
            //   right: MediaQuery.of(context).size.width / 3.2,
            //   child: AnimatedOpacity(
            //     duration: const Duration(milliseconds: 350),
            //     opacity: 1.0,
            //     child: InkWell(
            //       onTap: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) => AddSaleInvoiceScreen()));
            //       },
            //       child: Container(
            //         decoration: BoxDecoration(
            //             color: Colorconst.cRed,
            //             borderRadius: BorderRadius.circular(24.r)),
            //         child: Padding(
            //           padding:
            //               EdgeInsets.symmetric(vertical: 9.h, horizontal: 12.w),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Imageconst().setImage(
            //                 imageName: "rupee_img.png",
            //                 hieght: 20.w,
            //                 width: 20.w,
            //               ),
            //               Text(
            //                 "Add New Sale",
            //                 style: interFontGrey(
            //                     color: Colorconst.cwhite, context),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
