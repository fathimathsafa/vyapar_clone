import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/loading_var.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/transaction/day_book/controller.dart'; // Import the ScreenUtil package

class DayBook extends StatelessWidget {
   final controller = Get.put(DayBookController());
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive sizing
    ScreenUtil.init(context, designSize: Size(360, 690));
    // controller.fetchDayBookReportList();
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: InkWell(
        onTap: () {
          controller.fetchDayBookReportList();
        },
        child: CircleAvatar(radius: 30.r,
        child: Center(child: Icon(Icons.refresh_outlined)),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Day Book',
          style: TextStyle(fontSize: 16.sp), // Use ScreenUtil for font size
        ),
        leading: GestureDetector(
          onTap: () {
          Get.back();
          // Get.delegate();
          } ,
          child: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            icon:
                Icon(Icons.picture_as_pdf, size: 20.sp), // Responsive icon size
            onPressed: () {},
            tooltip: 'Download PDF',
          ),
          IconButton(
            icon: Icon(Icons.grid_on, size: 20.sp), // Responsive icon size
            onPressed: () {},
            tooltip: 'View as Grid',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
        () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateDropdownAndPicker(),
                Divider(),
                SizedBox(height: 12.h), // Responsive vertical spacing
            
                // Filters section commented out for future use
                // TODO: Add filter section if necessary
                
             isLoading.value ?Center(child: CircularProgressIndicator(),):  controller.dayBookReportList.length.toInt()==0?  Column(
                  children: [
                    SizedBox(
                        height: 100
                            .h), // Responsive spacing before image and no data section
            
                    Center(
                      child: Container(
                        height: 100.h, // Responsive container height
                        width: 100.w, // Responsive container width
                        child: Image(
                          image: AssetImage('assets/images/purchase_order.jpg'),
                          fit: BoxFit.contain, // Added to ensure image scales well
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h), // Responsive vertical spacing
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'No Data Available',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.black // Responsive text size
                                ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15.h), // Responsive vertical spacing
                          Text(
                            'No data is available for this report. Please try\n again after making relevant changes.',
                            style:
                                TextStyle(fontSize: 10.sp), // Responsive text size
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ):Column(children: List.generate(controller.dayBookReportList.length, (index) {
                  var obj = controller.dayBookReportList[index];
                  return ListTile(title: Text(obj.partyName.toString()),);
                },),)
              ],
            );
          }
        ),
      ),
    );
  }
}
